unit uAdmin;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, uMainMenu;

type

  { TfAdmin }

  TfAdmin = class(TForm)
    cbVisible: TCheckBox;
    eLog: TEdit;
    ePassword: TEdit;
    iAdmin: TImage;
    Label1: TLabel;
    Label2: TLabel;
    BackBtn: TSpeedButton;
    AdminBtn: TSpeedButton;
    procedure AdminBtnClick(Sender: TObject);
    procedure AdminBtnMouseEnter(Sender: TObject);
    procedure AdminBtnMouseLeave(Sender: TObject);
    procedure BackBtnClick(Sender: TObject);
    procedure BackBtnMouseEnter(Sender: TObject);
    procedure BackBtnMouseLeave(Sender: TObject);
    procedure cbVisibleChange(Sender: TObject);
    procedure eLogKeyPress(Sender: TObject; var Key: char);
    procedure ePasswordKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fAdmin: TfAdmin;
  znach: integer;

implementation
{$R *.lfm}

{ TfAdmin }

procedure TfAdmin.BackBtnClick(Sender: TObject);
begin
  fAdmin.Close;
end;

procedure TfAdmin.BackBtnMouseEnter(Sender: TObject);
begin
  BackBtn.Left:=BackBtn.Left-5;
  BackBtn.Top:=BackBtn.Top-5;
  BackBtn.Width:=BackBtn.Width+10;
  BackBtn.Height:=BackBtn.Height+10;
  BackBtn.Font.Size:=BackBtn.Font.Size+2;
end;

procedure TfAdmin.BackBtnMouseLeave(Sender: TObject);
begin
 BackBtn.Left:=BackBtn.Left+5;
  BackBtn.Top:=BackBtn.Top+5;
  BackBtn.Width:=BackBtn.Width-10;
  BackBtn.Height:=BackBtn.Height-10;
  BackBtn.Font.Size:=BackBtn.Font.Size-2;
end;

procedure TfAdmin.cbVisibleChange(Sender: TObject);
begin
 if (cbVisible.Checked=true) then
                                  ePassword.PasswordChar:=#0
                                else
                                  ePassword.PasswordChar:='*';
end;

procedure TfAdmin.eLogKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then ActiveControl:=ePassword
end;

procedure TfAdmin.ePasswordKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then AdminBtn.Click;
end;

procedure TfAdmin.FormShow(Sender: TObject);
begin
  ActiveControl:=eLog;
end;

procedure TfAdmin.AdminBtnClick(Sender: TObject);
begin
 if ((eLog.Text<>'') and (ePassword.Text<>'')) then
   if (eLog.Text='admin') then
    if (ePassword.Text='090203') then
                                     begin
                                          znach:=1;
                                          fMainMenu.ShowModal;
                                          eLog.Text:='';
                                          ePassword.Text:='';
                                     end
    else ShowMessage('Ошибка! Пароль введен неверно')
   else ShowMessage('Ошибка! Логин введен неверно')
  else ShowMessage('Ошибка! Введите данные и повторите попытку');
end;

procedure TfAdmin.AdminBtnMouseEnter(Sender: TObject);
begin
  AdminBtn.Left:=AdminBtn.Left-5;
  AdminBtn.Top:=AdminBtn.Top-5;
  AdminBtn.Width:=AdminBtn.Width+10;
  AdminBtn.Height:=AdminBtn.Height+10;
  AdminBtn.Font.Size:=AdminBtn.Font.Size+2;
  AdminBtn.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\btn\open_key.bmp');
end;

procedure TfAdmin.AdminBtnMouseLeave(Sender: TObject);
begin
  AdminBtn.Width:=AdminBtn.Width-10;
  AdminBtn.Height:=AdminBtn.Height-10;
  AdminBtn.Left:=AdminBtn.Left+5;
  AdminBtn.Top:=AdminBtn.Top+5;
  AdminBtn.Font.Size:=AdminBtn.Font.Size-2;
  AdminBtn.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\btn\key.bmp');
end;



end.

