unit uApplying;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  DBGrids, Buttons, StdCtrls, uLanguages, udm, db;

type

  { TfApplying }

  TfApplying = class(TForm)
    dbApplying: TDBGrid;
    DBEdit1: TDBEdit;
    dbnApplying: TDBNavigator;
    Label1: TLabel;
    procedure dbnApplyingBeforeAction(Sender: TObject; Button: TDBNavButtonType
      );
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private

  public

  end;

var
  fApplying: TfApplying;

implementation

{$R *.lfm}

{ TfApplying }

procedure TfApplying.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var i:integer;
  id:string;
begin
  if dm.sqApplying.State in [dsEdit, dsInsert] then
  if MessageDlg('Хотите, чтобы изменения встпупили в силу?', mtConfirmation,
   [mbOk, mbCancel], 0) = mrCancel then
                        dbnApplying.BtnClick(nbCancel)
                        else
                         dbnApplying.BtnClick(nbPost);

  fLanguages.chlbInvise.Items.clear;
  dm.sqApplying.First;
  fLanguages.chlbApplying.Items.Clear;
  while not dm.sqApplying.EOF do
        begin
             fLanguages.chlbApplying.Items.Append(dm.sqApplying.FieldByName('use_name').AsString);
             fLanguages.chlbInvise.Items.Append(dm.sqApplying.FieldByName('id_use').AsString);
             dm.sqApplying.Next;
        end;
  //i:=0;
  //dm.sqApplying.First;
  //fLanguages.chlbApplying.Items.Clear;
  //while not dm.sqApplying.EOF do
  //      begin
  //           fLanguages.chlbApplying.Items.Append(dm.sqApplying.FieldByName('use_name').AsString);
  //           dm.sqApplying.Next;
  //           fLanguages.chlbInvise.Items.Append(inttostr(i));
  //           i:=i+1;
  //      end;

  dm.sqSecondTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
  dm.sqSecondTable.Filtered:=true;
  dm.sqSecondTable.First;
  while not dm.sqSecondTable.EOF do
                            begin
                              id:=dm.sqSecondTable.FieldByName('id_use').AsString;
                              for i:=0 to fLanguages.chlbInvise.count-1 do
                                      if fLanguages.chlbInvise.Items[i] = id then
                                      begin
                                      fLanguages.chlbInvise.Checked[i]:=true;
                                      fLanguages.chlbApplying.Checked[i]:=true;
                                      end;
                              dm.sqSecondTable.Next;
                            end;
   CanClose:=true;
end;

procedure TfApplying.dbnApplyingBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
var s:string;
begin
  if button=nbPost then
   begin
    s:=DBEdit1.Text;
    DBEdit1.Text:='';
    if DM.sqApplying.Locate('use_name', s, []) then
     begin
      ShowMessage('Данное поле уже существует');
      if DM.sqApplying.Locate('use_name', '', []) then DM.sqApplying.Delete;
      Abort;
     end;
    DBEdit1.Text:=s;
   end;

end;

end.

