unit uDM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, sqldb, db, FileUtil, uLanguages;

type

  { TDM }

  TDM = class(TDataModule)
    dsFirstTable: TDataSource;
    dsSecondTable: TDataSource;
    dsApplying: TDataSource;
    dsCategory: TDataSource;
    dsLanguages: TDataSource;
    MSC: TMySQL57Connection;
    sqApplyingid_use: TAutoIncField;
    sqApplyinguse_name: TStringField;
    sqCategorycategory: TStringField;
    sqCategoryid_category: TAutoIncField;
    sqFirstTableid_category: TLongintField;
    sqFirstTableid_pl: TSmallintField;
    sqCategory: TSQLQuery;
    sqApplying: TSQLQuery;
    sqFirstTable: TSQLQuery;
    sqLanguages: TSQLQuery;
    sqLanguagescreate_year: TDateField;
    sqLanguageshistory: TMemoField;
    sqLanguagesid_pl: TSmallintField;
    sqLanguageslibs_frameworks: TStringField;
    sqLanguageslogo: TStringField;
    sqLanguagestitle: TStringField;
    sqExcel: TSQLQuery;
    sqSecondTable: TSQLQuery;
    SQLT: TSQLTransaction;
    sqSecondTableid_pl: TSmallintField;
    sqSecondTableid_use: TLongintField;
    procedure sqLanguagesAfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  DM: TDM;

implementation
{$R *.lfm}

{ TDM }

procedure TDM.sqLanguagesAfterScroll(DataSet: TDataSet);
var id,id2,word: string;
  i:integer;
begin
  fLanguages.iLogo.Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'img\logo\'+dm.sqLanguages.FieldByName('logo').AsString);

  for i:=0 to fLanguages.chlbInvisible.count-1 do
  begin
    fLanguages.chlbInvisible.Checked[i]:=false;
    fLanguages.chlbCategory.Checked[i]:=false;
  end;

  for i:=0 to fLanguages.chlbInvise.count-1 do
  begin
    fLanguages.chlbInvise.Checked[i]:=false;
    fLanguages.chlbApplying.Checked[i]:=false;
  end;

  sqFirstTable.Filter:='id_pl='+sqLanguages.FieldByName('id_pl').AsString;
  sqFirstTable.Filtered:=true;
  dm.sqFirstTable.First;
  while not sqFirstTable.EOF do
                            begin
                              id:=sqFirstTable.FieldByName('id_category').AsString;
                              for i:=0 to fLanguages.chlbInvisible.count-1 do
                              if fLanguages.chlbInvisible.Items[i] = id then
                              begin
                                   fLanguages.chlbInvisible.Checked[i]:=true;
                                   fLanguages.chlbCategory.Checked[i]:=true;
                              end;
                              dm.sqFirstTable.Next;
                            end;
  sqSecondTable.Filter:='id_pl='+sqLanguages.FieldByName('id_pl').AsString;
  sqSecondTable.Filtered:=true;
  dm.sqSecondTable.First;
  while not sqSecondTable.EOF do
                            begin
                              id:=sqSecondTable.FieldByName('id_use').AsString;
                              for i:=0 to fLanguages.chlbInvise.count-1 do
                                      if fLanguages.chlbInvise.Items[i] = id then
                                      begin
                                      fLanguages.chlbInvise.Checked[i]:=true;
                                      fLanguages.chlbApplying.Checked[i]:=true;
                                      end;
                              dm.sqSecondTable.Next;
                            end;
end;

end.

