program ProgrammingLanguages;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, datetimectrls, uLog, uDM, uMainMenu, uAdmin, uLanguages, uCategory,
  uApplying, uImg, uExcel
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TfLog, fLog);
  Application.CreateForm(TfMainMenu, fMainMenu);
  Application.CreateForm(TfLanguages, fLanguages);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfAdmin, fAdmin);
  Application.CreateForm(TfCategory, fCategory);
  Application.CreateForm(TfApplying, fApplying);
  Application.CreateForm(TfImg, fImg);
  Application.CreateForm(TfExcel, fExcel);
  Application.Run;
end.

