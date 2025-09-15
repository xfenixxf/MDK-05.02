unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids, StdCtrls,edit;

type
  Contacts = record
    Name: string[100];
    Telephon: string[20];
    Note: string[20];
  end; //record


type

  { TfMain }

  TfMain = class(TForm)
    bDelet: TSpeedButton;
    bEdit: TSpeedButton;
    bSort: TSpeedButton;
    bAdd: TSpeedButton;
    Button1: TButton;
    Panel1: TPanel;
    SG: TStringGrid;
    procedure bAddClick(Sender: TObject);
    procedure bDeletClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bSortClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;
   adres: string;
implementation

{$R *.lfm}

{ TfMain }


procedure TfMain.bAddClick(Sender: TObject);
begin
  begin
  //очищаем поля, если там что-то есть:
  fEdit.eName.Text:= '';
  fEdit.eTelephone.Text:= '';
  //устанавливаем ModalResult редактора в mrNone:
  fEdit.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit.ShowModal;
  //если пользователь ничего не ввел - выходим:
  if (fEdit.eName.Text= '') or (fEdit.eTelephone.Text= '') then exit;
  //если пользователь не нажал "Сохранить" - выходим:
  if fEdit.ModalResult <> mrOk then exit;
  //иначе добавляем в сетку строку, и заполняем её:
  SG.RowCount:= SG.RowCount + 1;
  SG.Cells[0, SG.RowCount-1]:= fEdit.eName.Text;
  SG.Cells[1, SG.RowCount-1]:= fEdit.eTelephone.Text;
  SG.Cells[2, SG.RowCount-1]:= fEdit.CBNote.Text;
end;
end;

procedure TfMain.bDeletClick(Sender: TObject);
   begin
  //если данных нет - выходим:
  if SG.RowCount = 1 then exit;
  //иначе выводим запрос на подтверждение:
  if MessageDlg('Требуется подтверждение',
                'Вы действительно хотите удалить контакт "' +
                SG.Cells[0, SG.Row] + '"?',
      mtConfirmation, [mbYes, mbNo, mbIgnore], 0) = mrYes then
         SG.DeleteRow(SG.Row);
end;

procedure TfMain.bEditClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе записываем данные в форму редактора:
  fEdit.eName.Text:= SG.Cells[0, SG.Row];
  fEdit.eTelephone.Text:= SG.Cells[1, SG.Row];
  fEdit.CBNote.Text:= SG.Cells[2, SG.Row];
  //устанавливаем ModalResult редактора в mrNone:
  fEdit.ModalResult:= mrNone;
  //теперь выводим форму:
  fEdit.ShowModal;
  //сохраняем в сетку возможные изменения,
  //если пользователь нажал "Сохранить":
  if fEdit.ModalResult = mrOk then begin
    SG.Cells[0, SG.Row]:= fEdit.eName.Text;
    SG.Cells[1, SG.Row]:= fEdit.eTelephone.Text;
    SG.Cells[2, SG.Row]:= fEdit.CBNote.Text;
  end;
end;

procedure TfMain.bSortClick(Sender: TObject);
begin
  //если данных в сетке нет - просто выходим:
  if SG.RowCount = 1 then exit;
  if MessageDlg(
        'Сортировка',
        'Как вы хотите отсортировать список? По имени (Да) или по примечанию (Нет)?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      SG.SortColRow(True, 0); // Сортировка по имени (столбец 0)
    end
    else
    begin
      SG.SortColRow(True, 2); // Сортировка по примечанию (столбец 2)
    end;
  end;

procedure TfMain.Button1Click(Sender: TObject);
begin
   ShowMessage('Данная программа позволяет записывать,изменять и удалять телефонные контакты');
end;



procedure TfMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
  var
  MyCont: Contacts; //для очередной записи
  f: file of Contacts; //файл данных
  i: integer; //счетчик цикла
begin
  //если строки данных пусты, просто выходим:
  if SG.RowCount = 1 then exit;
  //иначе открываем файл для записи:
  try
    AssignFile(f, adres + 'telephones.dat');
    Rewrite(f);
    //теперь цикл - от первой до последней записи сетки:
    for i:= 1 to SG.RowCount-1 do begin
      //получаем данные текущей записи:
      MyCont.Name:= SG.Cells[0, i];
      MyCont.Telephon:= SG.Cells[1, i];
      MyCont.Note:= SG.Cells[2, i];
      //записываем их:
      Write(f, MyCont);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TfMain.FormCreate(Sender: TObject);
  var
    MyCont: Contacts; //для очередной записи
    f: file of Contacts; //файл данных
  begin
    //сначала получим адрес программы:
    adres:= ExtractFilePath(ParamStr(0));
    //настроим сетку:
    SG.Cells[0, 0]:= 'sdfsf';
    SG.Cells[1, 0]:= 'Телефон';
    SG.Cells[2, 0]:= 'Примечание';
    SG.ColWidths[0]:= 365;
    SG.ColWidths[1]:= 150;
    SG.ColWidths[2]:= 150;
    //если файла данных нет, просто выходим:
    if not FileExists(adres + 'telephones.dat') then exit;
    //иначе файл есть, открываем его для чтения и
    //считываем данные в сетку:
    try
      AssignFile(f, adres + 'telephones.dat');
      Reset(f);
      //теперь цикл - от первой до последней записи сетки:
      while not Eof(f) do begin
        //считываем новую запись:
        Read(f, MyCont);
        //добавляем в сетку новую строку, и заполняем её:
          SG.RowCount:= SG.RowCount + 1;
          SG.Cells[0, SG.RowCount-1]:= MyCont.Name;
          SG.Cells[1, SG.RowCount-1]:= MyCont.Telephon;
          SG.Cells[2, SG.RowCount-1]:= MyCont.Note;
      end;
    finally
      CloseFile(f);
    end;
  end;


end.

