unit uLanguages;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DBDateTimePicker, Forms,
  Controls, Graphics, Dialogs, StdCtrls, DbCtrls, DBGrids, ExtCtrls,
  MaskEdit, EditBtn, ExtDlgs, Buttons, CheckLst, DB, uImg;
  //DateTimePicker, DBExtCtrls ,uDM
type

  { TfLanguages }

  TfLanguages = class(TForm)
    AddInDBBtn: TSpeedButton;
    chlbApplying: TCheckListBox;
    chlbInvise: TCheckListBox;
    chlbCategory: TCheckListBox;
    chlbInvisible: TCheckListBox;
    dbLanguages: TDBGrid;
    Imgbtn: TBitBtn;
    iLogo: TImage;
    EditApplyingBtn: TButton;
    EditCategoryBtn: TButton;
    dbnLanguages: TDBNavigator;
    dtpDate: TDBDateTimePicker;
    dbeTitle: TDBEdit;
    dbmPopular: TDBMemo;
    dbmHistory: TDBMemo;
    gbOpisanie: TGroupBox;
    gbCategory: TGroupBox;
    gbApplying: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    msSearchTitle: TMaskEdit;
    AddApplyingBtn: TSpeedButton;
    procedure AddApplyingBtnClick(Sender: TObject);
    procedure AddInDBBtnClick(Sender: TObject);
    procedure chlbApplyingItemClick(Sender: TObject; Index: integer);
    procedure chlbCategoryItemClick(Sender: TObject; Index: integer);
    procedure EditApplyingBtnClick(Sender: TObject);
    procedure EditCategoryBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImgbtnClick(Sender: TObject);
    procedure msSearchTitleChange(Sender: TObject);
  private

  public

  end;

var
  fLanguages: TfLanguages;

implementation
uses uAdmin, uCategory, uApplying, uDM;

{$R *.lfm}

{ TfLanguages }
//привелегии для пользователя и для админа
procedure TfLanguages.FormShow(Sender: TObject);
begin
    if (uAdmin.znach<>1) then
                          begin
                           //dbnLanguages.Enabled:=false;
                           dbeTitle.Enabled:=false;
                           dtpDate.Enabled:=false;
                           dbmPopular.Enabled:=false;
                           dbmHistory.Enabled:=false;
                           Imgbtn.Enabled:=false;
                           EditCategoryBtn.Enabled:=false;
                           EditApplyingBtn.Enabled:=false;
                           AddInDBBtn.Enabled:=false;
                           //chlbCategory.Enabled:=false;
                           //chlbApplying.Enabled:=false;
                           AddApplyingBtn.Enabled:=false;
                          end
                          else
                           begin
                            //dbnLanguages.Enabled:=true;
                            dbeTitle.Enabled:=true;
                            dtpDate.Enabled:=true;
                            dbmPopular.Enabled:=true;
                            dbmHistory.Enabled:=true;
                            Imgbtn.Enabled:=true;
                            EditCategoryBtn.Enabled:=true;
                            EditApplyingBtn.Enabled:=true;
                            AddInDBBtn.Enabled:=true;
                            //chlbCategory.Enabled:=true;
                            //chlbApplying.Enabled:=true;
                            AddApplyingBtn.Enabled:=true;
                           end;
    iLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'img\logo\'+dm.sqLanguages.FieldByName('logo').AsString);
    dm.sqFirstTable.First;
    dm.sqSecondTable.First;
end;

procedure TfLanguages.ImgbtnClick(Sender: TObject);
begin
 fImg.ShowModal;
end;

//поиск по названию
procedure TfLanguages.msSearchTitleChange(Sender: TObject);
begin
  if msSearchTitle.Text<>'' then
     DM.sqLanguages.Locate('title', msSearchTitle.Text, [loCaseInsensitive,loPartialKey]);
end;



//открытие формы редактирования "категория"
procedure TfLanguages.EditCategoryBtnClick(Sender: TObject);
begin
 fCategory.ShowModal;

end;

//добавление всех эл-тов из бд Category и Applying в checklistbox'ы
procedure TfLanguages.FormActivate(Sender: TObject);
var id:string;
  i:integer;
begin
  //dbLanguages.FirstColumn;
  dm.sqCategory.First;
  chlbInvisible.Items.Clear;
  chlbCategory.Items.Clear;

  while not dm.sqCategory.EOF do
        begin
             chlbCategory.Items.Append(dm.sqCategory.FieldByName('category').AsString);
             chlbInvisible.Items.Append(dm.sqCategory.FieldByName('id_category').AsString);
             dm.sqCategory.Next;
        end;
  dm.sqApplying.First;
  chlbApplying.Items.Clear;
  chlbInvise.Items.Clear;
  while not dm.sqApplying.EOF do
        begin
             chlbApplying.Items.Append(dm.sqApplying.FieldByName('use_name').AsString);
             chlbInvise.Items.Append(dm.sqApplying.FieldByName('id_use').AsString);
             dm.sqApplying.Next;
        end;
  //добавление отмеченных эл-тов в checklistbox'ах
      dm.sqFirstTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
      dm.sqFirstTable.Filtered:=true;
      dm.sqFirstTable.First;
      //ShowMessage(inttostr(fLanguages.chlbInvisible.Count));
      //ShowMessage(inttostr(fLanguages.chlbCategory.Count));
      while not dm.sqFirstTable.EOF do
                                begin
                                  id:=dm.sqFirstTable.FieldByName('id_category').AsString;
                                  for i:=0 to fLanguages.chlbInvisible.count-1 do
                                  if fLanguages.chlbInvisible.Items[i] = id then
                                  //if pos(id,fLanguages.chlbInvisible.items[i])>0 then
                                  begin
                                       fLanguages.chlbCategory.Checked[i]:=true;

                                       fLanguages.chlbInvisible.Checked[i]:=true;
                                  end;
                                  dm.sqFirstTable.Next;
                                end;

      //предыдущая версия
      //dm.sqSecondTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
      //dm.sqSecondTable.Filtered:=true;
      //dm.sqSecondTable.First;
      //while not dm.sqSecondTable.EOF do
      //                      begin
      //                        id:=dm.sqSecondTable.FieldByName('id_use').AsString;
      //                        for i:=0 to fLanguages.chlbInvise.count-1 do
      //                       if pos(id,fLanguages.chlbInvise.items[i])>0 then
      //                        begin
      //                             fLanguages.chlbInvise.Checked[i]:=true;
      //                             fLanguages.chlbApplying.Checked[i]:=true;
      //                        end;
      //                        dm.sqSecondTable.Next;
      //                      end;


  //новая версия
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
end;

//открытие формы редактирования "область применения"
procedure TfLanguages.EditApplyingBtnClick(Sender: TObject);
begin
  fApplying.ShowModal;
end;

procedure TfLanguages.AddInDBBtnClick(Sender: TObject);
var i,word:integer;
  sql:string;
begin
  dm.sqFirstTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
  dm.sqFirstTable.Filtered:=true;
  dm.sqFirstTable.First;
  //word:=dm.sqLanguages.FieldByName('id_pl').Value;
  //sql:='delete from firsttable where id_pl='+IntToStr(word);
  //ошибка
  while not dm.sqFirstTable.EOF do
    begin
     dm.sqFirstTable.Delete;
    end;


        //begin
        //     dm.sqfirsttable.close;
        //     dm.sqfirsttable.SQL.Text:=sql;
        //     dm.sqfirsttable.execSQL;
        //     chlbCategory.Close;
        //     chlbCategory.open;
        //     chlbCategory.Delete;
        //end;
  //dm.sqFirstTable.DeleteSQL.Add('DELETE FROM firsttable WHERE id_pl='+inttostr(word));

  //dm.sqFirstTable.DeleteSQL.Clear;
  //dm.sqFirstTable.Filtered:=false;
 for i:=0 to chlbInvisible.Items.Count-1 do
     if chlbInvisible.Checked[i]=true then
        begin
         dm.sqFirstTable.Insert;
         dm.sqFirstTable.FieldByName('id_category').Value:=StrToInt(chlbInvisible.Items[i]);
         dm.sqFirstTable.FieldByName('id_pl').Value:=dm.sqLanguages.FieldByName('id_pl').Value;
         dm.sqFirstTable.Post;
        end;
end;

procedure TfLanguages.AddApplyingBtnClick(Sender: TObject);
var i:integer;
begin
  dm.sqSecondTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
  dm.sqSecondTable.Filtered:=true;
  dm.sqSecondTable.First;
  while not dm.sqSecondTable.EOF do
    begin
     dm.sqSecondTable.Delete;
    end;
  for i:=0 to chlbInvise.Items.Count-1 do
     if chlbInvise.Checked[i]=true then
        begin
         dm.sqSecondTable.Insert;
         dm.sqSecondTable.FieldByName('id_use').Value:=StrToInt(chlbInvise.Items[i]);
         dm.sqSecondTable.FieldByName('id_pl').Value:=dm.sqLanguages.FieldByName('id_pl').Value;
         dm.sqSecondTable.Post;
        end;
end;

procedure TfLanguages.chlbApplyingItemClick(Sender: TObject; Index: integer);
begin
  chlbInvise.Checked[chlbApplying.ItemIndex]:=chlbApplying.Checked[chlbApplying.ItemIndex];
end;

procedure TfLanguages.chlbCategoryItemClick(Sender: TObject; Index: integer);
begin
   chlbInvisible.Checked[chlbCategory.ItemIndex]:=chlbCategory.Checked[chlbCategory.ItemIndex];
end;

end.

