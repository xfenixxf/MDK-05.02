unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids, StdCtrls,edit,Unit1;

type
  Skadrecord = record
    Name: string[100];
    Typed: string[5];
    Counts: string[40];
    Counts1: string[40];
    Date: string[100];
    News:Boolean;
  end; //record


type

  { TfMain }

  TfMain = class(TForm)
    bDelet: TSpeedButton;
    bEdit: TSpeedButton;
    bSort: TSpeedButton;
    bAdd: TSpeedButton;
    info: TButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    SG: TStringGrid;
    Save: TSpeedButton;
    load: TSpeedButton;
    procedure bAddClick(Sender: TObject);
    procedure bDeletClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject; var CloseAction: TCloseAction);
    procedure infoClick(Sender: TObject);
    procedure loadClick(Sender: TObject);
    procedure Sort(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Opensklad(const FileName: string);
    procedure Saves(const FileName: string);
    procedure bSaveClick(Sender: TObject);
  private

  public
     FFileName: string;
  end;

var
  fMain: TfMain;
   adres: string;
implementation

{$R *.lfm}

{ TfMain }


procedure TfMain.bAddClick(Sender: TObject);
  begin
  //очищаем поля, если там что-то есть:
  fEdit.eName.Text:= '';
  fEdit.Counts.Text:= '';
  fEdit.Counts1.Text:= '';
  //устанавливаем ModalResult редактора в mrNone:
  fEdit.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit.ShowModal;
  //если пользователь ничего не ввел - выходим:
  if (fEdit.eName.Text= '') or (fEdit.Counts.Text= '') or (fEdit.Counts1.Text= '') then exit;
  //если пользователь не нажал "Сохранить" - выходим:
  if fEdit.ModalResult <> mrOk then exit;
  //иначе добавляем в сетку строку, и заполняем её:
  SG.RowCount:= SG.RowCount + 1;
  SG.Cells[0, SG.RowCount-1]:= fEdit.eName.Text;
  SG.Cells[1, SG.RowCount-1]:= fEdit.CBNote.Text;
  SG.Cells[2, SG.RowCount-1]:= fEdit.Counts.Text;
  SG.Cells[3, SG.RowCount-1]:= fEdit.Counts1.Text;
  SG.Cells[4, SG.RowCount-1]:= DatetoStr(fEdit.Date.Date);
   if fEdit.News.Checked then
    SG.Cells[5, SG.RowCount-1] := 'Новая'
  else
    SG.Cells[5, SG.RowCount-1] := 'Б/У';
end;


procedure TfMain.bDeletClick(Sender: TObject);
   begin
  //если данных нет - выходим:
  if SG.RowCount = 1 then exit;
  //иначе выводим запрос на подтверждение:
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить запись "' +
                SG.Cells[0, SG.Row] + '"?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         SG.DeleteRow(SG.Row);
end;

procedure TfMain.bEditClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  fEdit.eName.Text:= SG.Cells[0, SG.Row];
  fEdit.CBNote.Text:= SG.Cells[1, SG.Row];
  fEdit.Counts.Text:= SG.Cells[2, SG.Row];
  fEdit.Counts1.Text:= SG.Cells[3, SG.Row];
  fEdit.Date.Date:= StrtoDate(SG.Cells[4, SG.Row]);
  //устанавливаем ModalResult редактора в mrNone:
  fEdit.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit.ShowModal;
  //сохраняем в сетку возможные изменения,
  //если пользователь нажал "Сохранить":
  if fEdit.ModalResult = mrOk then begin
    SG.Cells[0, SG.Row]:= fEdit.eName.Text;
    SG.Cells[1, SG.Row]:= fEdit.CBNote.Text;
    SG.Cells[2, SG.Row]:= fEdit.Counts.Text;
    SG.Cells[3, SG.Row]:= fEdit.Counts1.Text;
    SG.Cells[4, SG.Row]:= DatetoStr(fEdit.Date.Date);
      if fEdit.News.Checked then
    SG.Cells[5, SG.Row] := 'Новая'
  else
    SG.Cells[5, SG.Row] := 'Б/У';
end;
  end;

procedure TfMain.bSaveClick(Sender: TObject; var CloseAction: TCloseAction);
begin
     // Настраиваем диалог сохранения
  SaveDialog1.Title := 'Сохранить данные о складе';
  SaveDialog1.DefaultExt := 'txt';
  SaveDialog1.Filter := 'Файлы данных (*.txt)|*.txt|Все файлы (*.*)|*.*';
  SaveDialog1.FileName := 'склад.txt';

  // Показываем диалог и сохраняем данные
  if SaveDialog1.Execute then
  begin
    Saves(SaveDialog1.FileName);
    ShowMessage('Данные успешно сохранены в файл: ' + SaveDialog1.FileName);
  end;
end;

procedure TfMain.infoClick(Sender: TObject);
begin
  ShowMessage('Программа для работы склада оперативной памяти');
end;

procedure TfMain.loadClick(Sender: TObject);
  begin
   begin
   // Настраиваем диалог сохранения
  OpenDialog1.Title := 'Открыть данные о складе';
  OpenDialog1.DefaultExt := 'txt';
  OpenDialog1.Filter := 'Файлы данных (*.txt)|*.txt|Все файлы (*.*)|*.*';
  OpenDialog1.FileName := 'склад.txt';
  if OpenDialog1.Execute then
  begin
    Opensklad(OpenDialog1.FileName);
    ShowMessage('Данные успешно открыты из файла: ' + OpenDialog1.FileName);
  end;
end;
end;

procedure TfMain.Sort(Sender: TObject);   //ссссссссссссссссссссссссссссссссссссссссссссссссссссссссссссс
begin
  Form1.ShowModal;
  if Form1.ModalResult = mrOk then
  begin
    if Form1.Sorted.Text = 'Названию' then
      SG.SortColRow(true, 0);
    if Form1.Sorted.Text = 'Типу' then
      SG.SortColRow(true, 1);
    if Form1.Sorted.Text = 'Стоимости' then
      SG.SortColRow(true, 2);
    if Form1.Sorted.Text = 'Количеству' then
      SG.SortColRow(true, 3);
    if Form1.Sorted.Text = 'Дате' then
      SG.SortColRow(true, 4);
    if Form1.Sorted.Text = 'Новизне' then
      SG.SortColRow(true, 5);
  end;
end;

procedure TfMain.Opensklad(const FileName: string);
var
    f: file of Skadrecord;
  Sklad: Skadrecord;
begin
  if not FileExists(FileName) then exit;
  try
    AssignFile(f, FileName);
    Reset(f);
    SG.RowCount := 1;
    while not Eof(f) do
    begin
      Read(f, Sklad);
      SG.RowCount := SG.RowCount + 1;
       SG.Cells[0, SG.RowCount-1] := Sklad.Name;
        SG.Cells[1, SG.RowCount-1] := Sklad.Typed;
        SG.Cells[2, SG.RowCount-1] := Sklad.Counts;
        SG.Cells[3, SG.RowCount-1] := Sklad.Counts1;
        SG.Cells[4, SG.RowCount-1] := Sklad.Date;
        if Sklad.News then
          SG.Cells[5, SG.RowCount-1] := 'Новая'
        else
          SG.Cells[5, SG.RowCount-1] := 'Б/У';
    end;
  finally
      CloseFile(f);
  end;
end;

procedure TfMain.Saves(const FileName: string);
 var
   f: file of Skadrecord;
  Sklad: Skadrecord;
  i: integer;
begin
  if SG.RowCount = 1 then exit;
  try
    assignfile(f, FileName);
    rewrite(f);
    for i:=1 to SG.RowCount-1 do
    begin
      Sklad.Name := SG.Cells[0, i];
      Sklad.Typed := SG.Cells[1, i];
      Sklad.Counts := SG.Cells[2, i];
      Sklad.Counts1 := SG.Cells[3, i];
      Sklad.Date := SG.Cells[4, i];
      Sklad.News := SG.Cells[5, i]= 'Новая';
      Write(f, Sklad);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TfMain.bSaveClick(Sender: TObject);
  begin
     // Настраиваем диалог сохранения
  SaveDialog1.Title := 'Сохранить данные о складе';
  SaveDialog1.DefaultExt := 'txt';
  SaveDialog1.Filter := 'Файлы данных (*.txt)|*.txt|Все файлы (*.*)|*.*';
  SaveDialog1.FileName := 'склад.txt';

  // Показываем диалог и сохраняем данные
  if SaveDialog1.Execute then
  begin
    Saves(SaveDialog1.FileName);
    ShowMessage('Данные успешно сохранены в файл: ' + SaveDialog1.FileName);
  end;
end;


procedure TfMain.FormCreate(Sender: TObject);
  begin
    SG.Cells [0, 0]:= 'Название';
    SG.Cells[1, 0]:= 'Тип';
    SG.Cells[2, 0]:= 'Цена';
    SG.Cells[3, 0]:= 'Колличество';
    SG.Cells[4, 0]:= 'Дата поступления';
    SG.Cells[5, 0]:= 'Новизна';
    SG.ColWidths[0]:= 300;
    SG.ColWidths[1]:= 100;
    SG.ColWidths[2]:= 100;
    SG.ColWidths[3]:= 100;
    SG.ColWidths[4]:= 150;
    SG.ColWidths[5]:= 100;
  end;

end.

