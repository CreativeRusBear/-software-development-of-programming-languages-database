unit uLog;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Menus, Buttons, uMainMenu, uAdmin;

type

  { TfLog }

  TfLog = class(TForm)
    iBackground: TImage;
    miExit: TMenuItem;
    miAdmin: TMenuItem;
    mm: TMainMenu;
    LogBtn: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure LogBtnClick(Sender: TObject);
    procedure LogBtnMouseEnter(Sender: TObject);
    procedure LogBtnMouseLeave(Sender: TObject);
    procedure miAdminClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  private

  public

  end;

var
  fLog: TfLog;

implementation

{$R *.lfm}

{ TfLog }

procedure TfLog.LogBtnClick(Sender: TObject);
begin
  fMainMenu.ShowModal;
end;

procedure TfLog.LogBtnMouseEnter(Sender: TObject);
begin
  LogBtn.Left:=LogBtn.Left-5;
  LogBtn.Top:=LogBtn.Top-5;
  LogBtn.Width:=LogBtn.Width+10;
  LogBtn.Height:=LogBtn.Height+10;
  LogBtn.Font.Size:=LogBtn.Font.Size+4;
  LogBtn.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\btn\home.bmp');
end;

procedure TfLog.LogBtnMouseLeave(Sender: TObject);
begin
  LogBtn.Width:=LogBtn.Width-10;
  LogBtn.Height:=LogBtn.Height-10;
  LogBtn.Left:=LogBtn.Left+5;
  LogBtn.Top:=LogBtn.Top+5;
  LogBtn.Font.Size:=LogBtn.Font.Size-4;
  LogBtn.Glyph.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\btn\come.bmp');
end;

procedure TfLog.FormKeyPress(Sender: TObject; var Key: char);
begin
  if key=#13 then LogBtn.Click;
end;


procedure TfLog.miAdminClick(Sender: TObject);
begin
 fAdmin.ShowModal;
end;

procedure TfLog.miExitClick(Sender: TObject);
begin
  fLog.Close;
end;

end.

