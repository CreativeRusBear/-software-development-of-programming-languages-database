unit uCategory;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, DBGrids, Buttons, uDM, db, uLanguages;

type

  { TfCategory }

  TfCategory = class(TForm)
    dbCategory: TDBGrid;
    DBEdit1: TDBEdit;
    dbnCategory: TDBNavigator;
    Label1: TLabel;
    Memo1: TMemo;
    procedure dbnCategoryBeforeAction(Sender: TObject; Button: TDBNavButtonType
      );
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private

  public

  end;

var
  fCategory: TfCategory;

implementation
{$R *.lfm}

{ TfCategory }

procedure TfCategory.dbnCategoryBeforeAction(Sender: TObject;
  Button: TDBNavButtonType);
var s:string;
begin
  if button=nbPost then
   begin
    s:=DBEdit1.Text;
    DBEdit1.Text:='';
    if DM.sqCategory.Locate('category', s, []) then
     begin
      ShowMessage('Данное поле уже существует');
      if DM.sqCategory.Locate('category', '', []) then DM.sqCategory.Delete;
      Abort;
     end;
    DBEdit1.Text:=s;

   end;
end;

procedure TfCategory.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var i:integer;
  id:string;
begin
  if dm.sqCategory.State in [dsEdit, dsInsert] then
  if MessageDlg('Хотите, чтобы изменения встпупили в силу?', mtConfirmation,
   [mbOk, mbCancel], 0) = mrCancel then
                        dbnCategory.BtnClick(nbCancel)
                        else
                         dbnCategory.BtnClick(nbPost);

  fLanguages.chlbInvisible.Items.clear;
    //i:=0;
    //dm.sqCategory.First;
    //fLanguages.chlbCategory.Items.Clear;
    //while not dm.sqCategory.EOF do
    //      begin
    //           fLanguages.chlbCategory.Items.Append(dm.sqCategory.FieldByName('category').AsString);
    //           dm.sqCategory.Next;
    //           fLanguages.chlbInvisible.Items.Append(inttostr(i));
    //           i:=i+1;
    //      end;
  dm.sqCategory.First;
  fLanguages.chlbCategory.Items.Clear;
  while not dm.sqCategory.EOF do
        begin
             fLanguages.chlbCategory.Items.Append(dm.sqCategory.FieldByName('category').AsString);
             fLanguages.chlbInvisible.Items.Append(dm.sqCategory.FieldByName('id_category').AsString);
             dm.sqCategory.Next;
        end;

      dm.sqFirstTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
      dm.sqFirstTable.Filtered:=true;
      dm.sqFirstTable.First;
      while not dm.sqFirstTable.EOF do
                                begin
                                  id:=dm.sqFirstTable.FieldByName('id_category').AsString;
                                  for i:=0 to fLanguages.chlbInvisible.count-1 do
                                  if fLanguages.chlbInvisible.Items[i] = id then
                                  begin
                                       fLanguages.chlbCategory.Checked[i]:=true;

                                       fLanguages.chlbInvisible.Checked[i]:=true;
                                  end;
                                  dm.sqFirstTable.Next;
                                end;
   CanClose:=true;
end;


end.

