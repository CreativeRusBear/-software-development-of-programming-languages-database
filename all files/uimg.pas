unit uImg;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, ExtDlgs;

type

  { TfImg }

  TfImg = class(TForm)
    AddAndEditBtn: TButton;
    ObzorBtn: TButton;
    Image1: TImage;
    opd: TOpenPictureDialog;
    procedure AddAndEditBtnClick(Sender: TObject);
    procedure ObzorBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  fImg: TfImg;
  img,firstimg:string;

implementation
uses uLanguages, uDM;
{$R *.lfm}

{ TfImg }

procedure TfImg.ObzorBtnClick(Sender: TObject);
begin
     DM.sqLanguages.Edit;
     if fImg.opd.Execute then
                             begin
                             img:=fImg.opd.FileName;
                             if firstimg=ExtractFilePath(img) then
                               begin
                                    if ExtractFileName(img)<>'no_photo.png' then
                                       begin
                                       fImg.Image1.Picture.LoadFromFile(img);
                                       AddAndEditBtn.Enabled:=true;
                                       end;
                               end
                             else
                              ShowMessage('Файлы с логотипами нужно загружать в папку "\img\logo"');
                         end;
end;

procedure TfImg.AddAndEditBtnClick(Sender: TObject);
begin
     DM.sqLanguages.Edit;
     DM.sqLanguages.FieldByName('logo').AsString:=ExtractFileName(img);
     DM.sqLanguages.Post;
     fImg.Close;
     fLanguages.iLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\logo\'+dm.sqLanguages.FieldByName('logo').AsString);
end;

procedure TfImg.FormShow(Sender: TObject);
begin
     fImg.Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\logo\'+dm.sqLanguages.FieldByName('logo').AsString);
     AddAndEditBtn.Enabled:=false;
     firstimg:=ExtractFilePath(Application.ExeName)+'img\logo\';
end;



end.

