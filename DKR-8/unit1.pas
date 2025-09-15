unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  math,unit2;

type

  { TCalculate }

  TCalculate = class(TForm)
    Button1: TButton;
    Del: TButton;
    Count: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TypeProcentbox: TComboBox;
    itogovayasumma: TMemo;
    Vvodperiod: TEdit;
    Vvodsum: TEdit;
    Period: TLabel;
    TypeProcent: TLabel;
    Itogovayasuma: TLabel;
    Vklad: TLabel;
    Stavka: TLabel;
    Vvodstavka: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure ClearClick(Sender: TObject);
    procedure CountClick(Sender: TObject);
    procedure DelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormulesClick(Sender: TObject);
  private
    function IsValidNumber(const Value: string; out Number: Double): Boolean;
    function CalculateSimpleInterest(P, r, t: Double): Double;
    function CalculateCompoundInterest(P, r, t: Double): Double;
    procedure EnsureComboBoxSelection;
  public
  end;

var
  Calculate: TCalculate;

implementation

{$R *.lfm}

{ TCalculate }

procedure TCalculate.FormCreate(Sender: TObject);
begin
  TypeProcentbox.ItemIndex := 0;
end;

procedure TCalculate.FormulesClick(Sender: TObject);
begin
  Form1.show;
end;



procedure TCalculate.EnsureComboBoxSelection;
begin
  if TypeProcentbox.ItemIndex = -1 then
    TypeProcentbox.ItemIndex := 0;
end;

function TCalculate.IsValidNumber(const Value: string; out Number: Double): Boolean;
var
  TempValue: String;
  i: Integer;
  HasDecimal: Boolean;
  MinusPos: Integer;
  poundPos:integer;
begin
  Result := False;
  TempValue := Trim(Value);

  if TempValue = '' then Exit;

  poundPos:= Pos(',', TempValue);
  MinusPos := Pos('-', TempValue);
  if MinusPos > 0 then
  begin
    // Минус разрешен только в начале и только для процентных ставок
    if (MinusPos <> 1) then
      Exit;

  end;



  // Проверяем допустимые символы (и запятые, и точки)
  HasDecimal := False;
  for i := 1 to Length(TempValue) do
  begin
    if not (TempValue[i] in ['0'..'9','-', ',', '.']) then begin
      Exit;
    end;

    // Проверяем любой десятичный разделитель
    if TempValue[i] in [',', '.'] then
    begin
      if HasDecimal then Exit;
      HasDecimal := True;
    end;
  end;

if HasDecimal=true then begin
  if poundPos = 0 then exit;
  end;

  Result := TryStrToFloat(TempValue, Number);
end;

function TCalculate.CalculateSimpleInterest(P, r, t: Double): Double;
begin
  // Простые проценты: S = P * (1 + r * t)
  // Где t - срок в месяцах, переводим в годы (t/12)
  Result := P * (1 + (r / 100) * (t / 12));
end;

function TCalculate.CalculateCompoundInterest(P, r, t: Double): Double;
var
  n: Integer;
begin
  n := 12; // Ежемесячная капитализация (12 раз в год)
  Result := P * Power(1 + (r / 100) / n, n * (t / 12));
end;

procedure TCalculate.ClearClick(Sender: TObject);
begin

end;

procedure TCalculate.Button1Click(Sender: TObject);
begin
  Form1.show;
end;

procedure TCalculate.CountClick(Sender: TObject);
var
  P, r, t, Amount: Double;
begin
  // Проверяем ввод суммы вклада
  if not IsValidNumber(Vvodsum.Text, P) or (P <= 0) then
  begin
    ShowMessage('Введите корректную сумму вклада');
    Vvodsum.SetFocus;
    Exit;
  end;

  // Проверяем ввод процентной ставки
  if not IsValidNumber(Vvodstavka.Text, r) then
  begin
    ShowMessage('Введите корректную процентную ставку');
    Vvodstavka.SetFocus;
    Exit;
  end;

  // Проверяем ввод периода
  if not IsValidNumber(Vvodperiod.Text, t) or (t <= 0) then
  begin
    ShowMessage('Введите корректный период (положительное число месяцев)');
    Vvodperiod.SetFocus;
    Exit;
  end;

  // Выполняем расчет
  if TypeProcentbox.ItemIndex = 0 then
    Amount := CalculateSimpleInterest(P, r, t)
  else
    Amount := CalculateCompoundInterest(P, r, t);


itogovayasumma.Lines.clear;
   if TypeProcentbox.ItemIndex = 0 then
  itogovayasumma.Text := 'По сумме вклада ' + FormatFloat('0.00', P) + ' руб. за ' +
                        FormatFloat('0',t) + ' месяцев с процентной ставкой ' +
                        FormatFloat('0.00', r) + '% по простым процентам составляет: ' +
                        FormatFloat('0.00', Amount) + ' руб.'
else
  itogovayasumma.Text := 'По сумме вклада ' + FormatFloat('0.00', P) + ' руб. за ' +
                        FormatFloat('0',t) + ' месяцев с процентной ставкой ' +
                        FormatFloat('0.00', r) + '% по сложным процентам составляет: ' +
                        FormatFloat('0.00', Amount) + ' руб.';
 end;

procedure TCalculate.DelClick(Sender: TObject);
begin
     Vvodsum.Text := '';
  Vvodstavka.Text := '';
  Vvodperiod.Text := '';
  itogovayasumma.Lines.clear;
end;



end.
