unit uMainMenu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Menus, StdCtrls, Buttons, uLanguages, uExcel;

type

  { TfMainMenu }

  TfMainMenu = class(TForm)
    gbPrimechanie: TGroupBox;
    iBackground: TImage;
    mPrimechanie: TMemo;
    miExcel: TMenuItem;
    miConclusion: TMenuItem;
    miLanguages: TMenuItem;
    mm: TMainMenu;
    BackBtn: TSpeedButton;
    PrimechanieBtn: TSpeedButton;
    procedure BackBtnClick(Sender: TObject);
    procedure BackBtnMouseEnter(Sender: TObject);
    procedure BackBtnMouseLeave(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure miExcelClick(Sender: TObject);
    procedure miLanguagesClick(Sender: TObject);
    procedure PrimechanieBtnClick(Sender: TObject);
    procedure PrimechanieBtnMouseEnter(Sender: TObject);
    procedure PrimechanieBtnMouseLeave(Sender: TObject);
  private

  public

  end;

var
  fMainMenu: TfMainMenu;

implementation
uses uAdmin;

{$R *.lfm}

{ TfMainMenu }

procedure TfMainMenu.BackBtnClick(Sender: TObject);
begin
  uAdmin.znach:=0;
  fMainMenu.Close;
  fAdmin.Close;
end;

procedure TfMainMenu.BackBtnMouseEnter(Sender: TObject);
begin
  BackBtn.Left:=BackBtn.Left-5;
  BackBtn.Top:=BackBtn.Top-5;
  BackBtn.Width:=BackBtn.Width+10;
  BackBtn.Height:=BackBtn.Height+10;
  BackBtn.Font.Size:=BackBtn.Font.Size+2;
end;

procedure TfMainMenu.BackBtnMouseLeave(Sender: TObject);
begin
  BackBtn.Left:=BackBtn.Left+5;
  BackBtn.Top:=BackBtn.Top+5;
  BackBtn.Width:=BackBtn.Width-10;
  BackBtn.Height:=BackBtn.Height-10;
  BackBtn.Font.Size:=BackBtn.Font.Size-2;
end;

procedure TfMainMenu.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key=#27 then BackBtn.Click;
end;

procedure TfMainMenu.FormShow(Sender: TObject);
begin
  if uAdmin.znach=1 then
                        PrimechanieBtn.Visible:=true
                    else
                        PrimechanieBtn.Visible:=false;
end;

procedure TfMainMenu.miExcelClick(Sender: TObject);
begin
  fExcel.ShowModal;
end;


procedure TfMainMenu.miLanguagesClick(Sender: TObject);
begin
   fLanguages.ShowModal;
end;

procedure TfMainMenu.PrimechanieBtnClick(Sender: TObject);
begin
  if gbPrimechanie.Visible=false then
                                     begin
                                       gbPrimechanie.Visible:=true;
                                       PrimechanieBtn.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\btn\up.bmp');
                                     end
                                 else
                                     begin
                                          gbPrimechanie.Visible:=false;
                                          PrimechanieBtn.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\btn\down.bmp');
                                     end;

end;

procedure TfMainMenu.PrimechanieBtnMouseEnter(Sender: TObject);
begin
  PrimechanieBtn.Left:=PrimechanieBtn.Left-5;
  PrimechanieBtn.Top:=PrimechanieBtn.Top-5;
  PrimechanieBtn.Width:=PrimechanieBtn.Width+10;
  PrimechanieBtn.Height:=PrimechanieBtn.Height+10;
  PrimechanieBtn.Font.Size:=PrimechanieBtn.Font.Size+2;
end;

procedure TfMainMenu.PrimechanieBtnMouseLeave(Sender: TObject);
begin
  PrimechanieBtn.Left:=PrimechanieBtn.Left+5;
    PrimechanieBtn.Top:=PrimechanieBtn.Top+5;
    PrimechanieBtn.Width:=PrimechanieBtn.Width-10;
    PrimechanieBtn.Height:=PrimechanieBtn.Height-10;
    PrimechanieBtn.Font.Size:=PrimechanieBtn.Font.Size-2;
end;

end.
