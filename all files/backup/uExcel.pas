unit uExcel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, ComObj, ActiveX, Variants, Windows, Messages, uDM, uLanguages;
  //uses ComObj, ActiveX, Variants, Windows, Messages;
type

  { TfExcel }

  TfExcel = class(TForm)
    chgPL: TCheckGroup;
    chgTables: TCheckGroup;
    iExcel: TImage;
    ConclusionBtn: TSpeedButton;
    procedure chgTablesItemClick(Sender: TObject; Index: integer);
    procedure ConclusionBtnClick(Sender: TObject);
  private

  public

  end;

var
  fExcel: TfExcel;
  //глобальная переменная для работы с Excel
  MyExcel: OleVariant;
  //константа для работы с Excel
  const ExcelApp = 'Excel.Application';
implementation

{$R *.lfm}

{ TfExcel }
//установлен ли Excel на ПК
function CheckExcelInstall:boolean;
var
  ClassID: TCLSID;
  Rez : HRESULT;
begin
// Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(ExcelApp)), ClassID);
  if Rez = S_OK then
  begin
       Result := true;
       //ShowMessage('Приложение MS Excel установлено на этом компьютере');
       //созание файла
  end
  else
  begin
       ShowMessage('Приложение MS Excel не установлено на этом компьютере');
       Result := false;
  end;
end;

procedure TfExcel.ConclusionBtnClick(Sender: TObject);
var i,j,k,m, number:integer;
s, str, id:string;
c1: OleVariant;
kk:boolean;
begin
  if uExcel.CheckExcelInstall then
   begin
         if (chgPL.Checked[0]=false) and (chgPL.Checked[1]=false) and (chgPL.Checked[2]=false) and (chgPL.Checked[3]=false) and (chgPl.Checked[4]=false) and (chgPL.Checked[5]=false) then
         begin
              chgTables.Checked[0]:=false;
              chgPL.Visible:=false;
              //if ((chgTables.Checked[1]=false) and (chgTables.Checked[2]=false)) then
              //   ShowMessage('Ошибка! Вы ничего не выбрали.');
         end;
         if ((chgTables.Checked[0]=false) and (chgTables.Checked[1]=false) and (chgTables.Checked[2]=false)) then
            ShowMessage('Ошибка! Вы ничего не выбрали.')
       else
           begin
                MyExcel:=CreateOleObject(ExcelApp);
                //показывать/не показывать системные сообщения Excel
                MyExcel.Application.EnableEvents:=true;
                MyExcel.Visible:=true;
                //создание пустой рабочей книги
                MyExcel.WorkBooks.Add;
                //c1:=MyExcel.ActiveWorkBook.WorkSheets[1];
                if chgTables.Checked[0] then
                                               begin
                                                c1:=MyExcel.ActiveWorkBook.WorkSheets[1];
                                                c1.Rows[1].Font.Bold := True;
                                                c1.Rows[1].Font.Name := 'Tahoma';
                                                dm.sqLanguages.Filtered:=false;
                                              c1.Name := WideString(utf8Decode('Описание ЯП'));
                                              m:=0;
                                              if (chgPL.Checked[0]) then
                                                                    begin
                                                                         c1.Cells[1, 1]:=WideString(utf8Decode('Название'));
                                                                         k:=2;
                                                                         m:=m+1;
                                                                         dm.sqLanguages.First;
                                                                         while not dm.sqLanguages.Eof do
                                                                             begin
                                                                                 c1.Cells[k,1]:=WideString(utf8Decode(dm.sqLanguages.FieldByName('title').AsString));
                                                                                 dm.sqLanguages.Next;
                                                                                 k:=k+1;
                                                                               end;
                                                                    end;
                                              if (chgPL.Checked[1]) then
                                                                    begin
                                                                         m:=m+1;
                                                                         k:=2;dm.sqLanguages.First;
                                                                        if chgPL.Checked[0] then number:=2
                                                                         //begin
                                                                         //     c1.Cells[1, 2]:=WideString(utf8Decode('Дата создания'));
                                                                         //     while not dm.sqLanguages.Eof do
                                                                         //           begin
                                                                         //                c1.Cells[k,2]:=WideString(utf8Decode(dm.sqLanguages.FieldByName('create_year').AsString));
                                                                         //                dm.sqLanguages.Next;
                                                                         //                k:=k+1;
                                                                         //           end;
                                                                         //end
                                                                        else number:=1;

                                                                        c1.Cells[1, number]:=WideString(utf8Decode('Дата создания'));
                                                                        while not dm.sqLanguages.Eof do
                                                                         begin
                                                                          c1.Cells[k,number]:=WideString(utf8Decode(dm.sqLanguages.FieldByName('create_year').AsString));
                                                                          dm.sqLanguages.Next;
                                                                          k:=k+1;
                                                                         end;
                                                                    end;

                                              if (chgPL.Checked[2]) then
                                                                    begin
                                                                        m:=m+1;
                                                                        k:=2;
                                                                        dm.sqLanguages.First;
                                                                        if (chgPL.Checked[0] and chgPL.Checked[1]) then number:=3
                                                                                                                   //begin
                                                                                                                   //c1.cells[1, 3]:=WideString(utf8Decode('Библиотеки и фреймворки'));
                                                                                                                   //while not dm.sqLanguages.Eof do
                                                                                                                   //begin
                                                                                                                   //     c1.Cells[k,3]:=WideString(utf8Decode(dm.sqLanguages.FieldByName('libs_frameworks').AsString));
                                                                                                                   //     dm.sqLanguages.Next;
                                                                                                                   //     k:=k+1;
                                                                                                                   //end;
                                                                                                                   //end
                                                                        else if (chgPL.Checked[0] or  chgPL.Checked[1]) then number:=2
                                                                        else number:=1;
                                                                        c1.Cells[1, number]:=WideString(utf8Decode('Библиотеки и фреймворки'));
                                                                        while not dm.sqLanguages.Eof do
                                                                         begin
                                                                          c1.Cells[k,number]:=WideString(utf8Decode(dm.sqLanguages.FieldByName('libs_frameworks').AsString));
                                                                          dm.sqLanguages.Next;
                                                                          k:=k+1;
                                                                         end;
                                                                        end;

                                              if (chgPL.Checked[3]) then
                                                                    begin
                                                                        m:=m+1;
                                                                        k:=2;
                                                                        dm.sqLanguages.First;
                                                                        if (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[2]) then number:=4
                                                                                                                                        //begin
                                                                                                                                        //c1.cells[1, 4]:=WideString(utf8Decode('История'));
                                                                                                                                        //while not dm.sqLanguages.Eof do
                                                                                                                                        //begin
                                                                                                                                        //     c1.Cells[k,4]:=WideString(utf8Decode(dm.sqLanguages.FieldByName('history').AsString));
                                                                                                                                        //     dm.sqLanguages.Next;
                                                                                                                                        //     k:=k+1;
                                                                                                                                        //end;
                                                                                                                                        //end
                                                                        else if ((chgPL.Checked[0] and chgPL.Checked[1]) or (chgPL.Checked[0] and chgPL.Checked[2]) or (chgPL.Checked[1] and chgPL.Checked[2])) then number:=3
                                                                        else if (chgPL.Checked[0] or  chgPL.Checked[1] or chgPL.Checked[2]) then number:=2
                                                                        else number:=1;
                                                                        c1.Cells[1, number]:=WideString(utf8Decode('История'));
                                                                        while not dm.sqLanguages.Eof do
                                                                         begin
                                                                          c1.Cells[k,number]:=WideString(utf8Decode(dm.sqLanguages.FieldByName('history').AsString));
                                                                          dm.sqLanguages.Next;
                                                                          k:=k+1;
                                                                         end;
                                                                      end;
                                              if (chgPL.Checked[4]) then
                                                                    begin
                                                                     m:=m+1;
                                                                     k:=2;
                                                                     dm.sqLanguages.First;
                                                                     if (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[3]) then number:=5
                                                                      //begin
                                                                      // c1.cells[1, 5]:=WideString(utf8Decode('Класс языка'));
                                                                      // while not dm.sqLanguages.Eof do
                                                                      // begin
                                                                      // dm.sqFirstTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
                                                                      // dm.sqFirstTable.Filtered:=true;
                                                                      // dm.sqFirstTable.First;
                                                                      // str:='';
                                                                      // while not dm.sqFirstTable.EOF do
                                                                      // begin
                                                                      // id:=dm.sqFirstTable.FieldByName('id_category').AsString;
                                                                      // if dm.sqCategory.Locate('id_category', id, []) then
                                                                      // str:=str+dm.sqCategory.FieldByName('category').AsString+',';
                                                                      // dm.sqFirstTable.Next;
                                                                      // end;
                                                                      // c1.Cells[k,5]:=WideString(utf8Decode(str));
                                                                      // k:=k+1;
                                                                      // dm.sqLanguages.Next;
                                                                      // end;
                                                                      // end
                                                                      else if ((chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[2]) or (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[3]) or
                                                                      (chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[3]) or (chgPL.Checked[0] and chgPL.Checked[2] and chgPL.Checked[3])) then number:=4
                                                                      else if ((chgPL.Checked[0] and chgPL.Checked[1]) or (chgPL.Checked[0] and chgPL.Checked[2]) or (chgPL.Checked[0] and chgPL.Checked[3]) or (chgPL.Checked[1] and chgPL.Checked[2]) or (chgPL.Checked[1] and chgPL.Checked[3]) or (chgPL.Checked[2] and chgPL.Checked[3])) then number:=3
                                                                      else if (chgPL.Checked[0] or  chgPL.Checked[1] or chgPL.Checked[2] or chgPL.Checked[3]) then number:=2
                                                                      else number:=1;

                                                                    c1.cells[1, number]:=WideString(utf8Decode('Класс языка'));
                                                                    while not dm.sqLanguages.Eof do
                                                                    begin
                                                                    dm.sqFirstTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
                                                                    dm.sqFirstTable.Filtered:=true;
                                                                    dm.sqFirstTable.First;
                                                                    str:='';
                                                                    while not dm.sqFirstTable.EOF do
                                                                    begin
                                                                    id:=dm.sqFirstTable.FieldByName('id_category').AsString;
                                                                    if dm.sqCategory.Locate('id_category', id, []) then
                                                                    str:=str+dm.sqCategory.FieldByName('category').AsString+',';
                                                                    dm.sqFirstTable.Next;
                                                                    end;
                                                                    Delete(str,length(str),1);
                                                                    c1.Cells[k,number]:=WideString(utf8Decode(str));
                                                                    k:=k+1;
                                                                    dm.sqLanguages.Next;
                                                                    end;
                                                                    end;

                                              if (chgPL.Checked[5]) then
                                                                    begin
                                                                         m:=m+1;
                                                                         k:=2;
                                                                         dm.sqLanguages.First;
                                                                         if (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[3] and chgPL.Checked[4]) then number:=6
                                                                         else if ((chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[3]) or (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[4]) or (chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[3] and chgPL.Checked[4]) or (chgPL.Checked[0] and chgPL.Checked[2] and chgPL.Checked[3] and chgPL.Checked[4]) or (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[3] and chgPL.Checked[4])) then number:=5
                                                                         else if ((chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[2]) or (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[3]) or (chgPL.Checked[0] and chgPL.Checked[1] and chgPL.Checked[4]) or (chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[3]) or  (chgPL.Checked[1] and chgPL.Checked[2] and chgPL.Checked[4]) or (chgPL.Checked[0] and chgPL.Checked[2] and chgPL.Checked[3]) or (chgPL.Checked[0] and chgPL.Checked[2] and chgPL.Checked[4]) or (chgPL.Checked[2] and chgPL.Checked[3] and chgPL.Checked[4])) then number:=4
                                                                         else if ((chgPL.Checked[0] and chgPL.Checked[1]) or (chgPL.Checked[0] and chgPL.Checked[2]) or (chgPL.Checked[0] and chgPL.Checked[3]) or (chgPL.Checked[0] and chgPL.Checked[4]) or (chgPL.Checked[1] and chgPL.Checked[2]) or (chgPL.Checked[1] and chgPL.Checked[3]) or (chgPL.Checked[1] and chgPL.Checked[4]) or (chgPL.Checked[2] and chgPL.Checked[3]) or (chgPL.Checked[2] and chgPL.Checked[4]) or (chgPL.Checked[3] and chgPL.Checked[4])) then number:=3
                                                                         else if (chgPL.Checked[0] or  chgPL.Checked[1] or chgPL.Checked[2] or chgPL.Checked[3] or chgPL.Checked[4]) then number:=2
                                                                         else number:=1;
                                                                         c1.cells[1, number]:=WideString(utf8Decode('Область применения'));
                                                                         while not dm.sqLanguages.Eof do
                                                                         begin
                                                                         dm.sqSecondTable.Filter:='id_pl='+dm.sqLanguages.FieldByName('id_pl').AsString;
                                                                         dm.sqSecondTable.Filtered:=true;
                                                                         dm.sqSecondTable.First;
                                                                         str:='';
                                                                         while not dm.sqSecondTable.EOF do
                                                                         begin
                                                                         id:=dm.sqSecondTable.FieldByName('id_use').AsString;
                                                                         if dm.sqApplying.Locate('id_use', id, []) then
                                                                         str:=str+dm.sqApplying.FieldByName('use_name').AsString+',';
                                                                         dm.sqSecondTable.Next;
                                                                    end;
                                                                    Delete(str,length(str),1);
                                                                    c1.Cells[k,number]:=WideString(utf8Decode(str));
                                                                    k:=k+1;
                                                                    dm.sqLanguages.Next;
                                                                    end;
                                                                    end;

                                              MyExcel.Workbooks[1].WorkSheets[1].Columns['A:F'].AutoFit;
                                              for i:=1 to m do
                                              for j:=1 to k-1 do
                                              begin
                                              c1.Cells[j,i].Borders[9].LineStyle:=1;
                                              c1.Cells[j,i].Borders[7].LineStyle:=1;
                                              c1.Cells[j,i].Borders[10].LineStyle:=1;
                                              c1.Cells[j,i].Borders[8].LineStyle:=1;
                                              c1.Cells[j,i].Borders[12].LineStyle:=1;
                                              c1.Cells[j,i].Borders[11].LineStyle:=1;
                                              end;

                    end;

           if (chgTables.Checked[1]) then
            begin
              if (chgTables.Checked[0]=false) then
                                               begin
                                                c1:=MyExcel.ActiveWorkBook.WorkSheets[1];
                                                c1.Rows[1].Font.Bold := True;
                                                c1.Rows[1].Font.Name := 'Tahoma';
                                                //dm.sqLanguages.Filtered:=false;
                                                c1.Name := WideString(utf8Decode('Категории'));
                                                c1.Cells[1, 1]:=WideString(utf8Decode('Класс языка'));
                                                k:=2;
                                                dm.sqCategory.First;
                                                while not dm.sqCategory.Eof do
                                                begin
                                                 c1.Cells[k,1]:=WideString(utf8Decode(dm.sqCategory.FieldByName('category').AsString));
                                                 dm.sqCategory.Next;
                                                 k:=k+1;
                                                end;
                                                MyExcel.Workbooks[1].WorkSheets[1].Columns['A:F'].AutoFit;
                                               end
           else if (chgTables.Checked[0]) then
                                         begin
                                                c1:=MyExcel.ActiveWorkBook.WorkSheets[2];
                                                c1.Rows[1].Font.Bold := True;
                                                c1.Rows[1].Font.Name := 'Tahoma';
                                                //dm.sqLanguages.Filtered:=false;
                                                c1.Name := WideString(utf8Decode('Категории'));
                                                c1.Cells[1, 1]:=WideString(utf8Decode('Класс языка'));
                                                k:=2;
                                                dm.sqCategory.First;
                                                while not dm.sqCategory.Eof do
                                                begin
                                                 c1.Cells[k,1]:=WideString(utf8Decode(dm.sqCategory.FieldByName('category').AsString));
                                                 dm.sqCategory.Next;
                                                 k:=k+1;
                                                end;
                                                MyExcel.Workbooks[1].WorkSheets[2].Columns['A:F'].AutoFit;
                                         end;
           for j:=1 to k-1 do
                        begin
                             c1.Cells[j,1].Borders[9].LineStyle:=1;
                             c1.Cells[j,1].Borders[7].LineStyle:=1;
                             c1.Cells[j,1].Borders[10].LineStyle:=1;
                             c1.Cells[j,1].Borders[8].LineStyle:=1;
                             c1.Cells[j,1].Borders[12].LineStyle:=1;
                             c1.Cells[j,1].Borders[11].LineStyle:=1;
                        end;
            end;

           if (chgTables.Checked[2]) then
            begin
            if (chgTables.Checked[0] and chgTables.Checked[1]) then i:=3
           else if (chgTables.Checked[0] or chgTables.Checked[1]) then i:=2
           else i:=1;

               c1:=MyExcel.ActiveWorkBook.WorkSheets[i];
               c1.Rows[1].Font.Bold := True;
               c1.Rows[1].Font.Name := 'Tahoma';
               c1.Name := WideString(utf8Decode('Область применения'));
               c1.Cells[1, 1]:=WideString(utf8Decode('Область применения'));
               k:=2;
               dm.sqApplying.First;
               while not dm.sqApplying.Eof do
               begin
               c1.Cells[k,1]:=WideString(utf8Decode(dm.sqApplying.FieldByName('use_name').AsString));
               dm.sqApplying.Next;
               k:=k+1;
               end;
               MyExcel.Workbooks[1].WorkSheets[i].Columns['A:F'].AutoFit;

               for j:=1 to k-1 do
                        begin
                             c1.Cells[j,1].Borders[9].LineStyle:=1;
                             c1.Cells[j,1].Borders[7].LineStyle:=1;
                             c1.Cells[j,1].Borders[10].LineStyle:=1;
                             c1.Cells[j,1].Borders[8].LineStyle:=1;
                             c1.Cells[j,1].Borders[12].LineStyle:=1;
                             c1.Cells[j,1].Borders[11].LineStyle:=1;
                        end;
            end;
           end;
           end;
           fExcel.Close;
           for i:=0 to chgTables.Items.Count-1 do
           chgTables.Checked[i]:=false;
           for i:=0 to chgPL.Items.Count-1 do
           chgPL.Checked[i]:=false;
           chgPL.Visible:=false;
end;

procedure TfExcel.chgTablesItemClick(Sender: TObject; Index: integer);
var i: integer;
begin
   if chgTables.Checked[0]=true then chgPL.Visible:=true
  else
    begin
    for i:=chgPL.Items.Count-1 downto 0 do
    chgPL.Checked[i]:=false;
    chgPL.Visible:=false;
    end;
end;



end.

