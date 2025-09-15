unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    del: TButton;
    num9: TButton;
    num6: TButton;
    num3: TButton;
    c: TButton;
    delen: TButton;
    ymn: TButton;
    minus: TButton;
    Kor: TButton;
    kvadr: TButton;
    deleniena0: TButton;
    num7: TButton;
    pound: TButton;
    plus: TButton;
    ravno: TButton;
    num4: TButton;
    num1: TButton;
    num0: TButton;
    num8: TButton;
    num5: TButton;
    num2: TButton;
    ce: TButton;
    Stroka1: TEdit;
    Stroka2: TEdit;
    procedure cClick(Sender: TObject);
    procedure KorClick(Sender: TObject);
    procedure kvadrClick(Sender: TObject);
    procedure deleniena0Click(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure poundClick(Sender: TObject);
    procedure ravnoClick(Sender: TObject);
    procedure ceClick(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  q,w,e:real;
  znak,cdscd:string;
  q1:boolean;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ClickBut(Sender: TObject); //ввод
begin
  if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка') then  Stroka1.Text:=(sender as TButton).Caption
  else Stroka1.Text:=Stroka1.Text + (sender as TButton).Caption;
end;

procedure TForm1.ClickZnak(Sender: TObject);
begin
  if (znak <> '') and (Stroka1.text='0 ') then begin       // Меняем знак
  case znak of
    '+': w := w + 0;
    '-': w := w - 0;
    '*': w := w * 1;
    '/': w := w / 1;
  end;
  znak := (sender as TButton).Caption;
  Stroka2.text := floattostr(w) + znak;
  pound.Enabled := True;
end;
  if (znak <> '') and (Stroka1.text<>'0 ') then begin                       //промежуточный подсчёт
  if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка')or (Pos('О', Stroka1.Text) <>0) then e:=0
  else e:=StrToFloat(Stroka1.text);
  ravnoClick(Sender);
  w:=StrToFloat(Stroka1.text);
  Stroka1.text:='0 ';
  znak:=(sender as TButton).Caption;
  Stroka2.text:=floattostr(w)+znak;
  pound.Enabled := True;
  end;
  if (znak = '') then
  begin
  if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка')or (Pos('О', Stroka1.Text) <>0) then w:=0
  else  w:=StrToFloat(Stroka1.text);                                         //ввод 1го параметра и его знака
  Stroka1.text:='0 ';
  znak:=(sender as TButton).Caption;
  Stroka2.text:=floattostr(w)+znak;
  Stroka1.Text:='0 ';
  pound.Enabled := True;
end;
  end;

procedure TForm1.poundClick(Sender: TObject);                                  //проверка запятой
begin
  begin
  if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка')or (Pos('О', Stroka1.Text) <>0) then Stroka1.Text:='0,'
  else Stroka1.Text:= Stroka1.Text + ',' ;
  if Pos(',', Stroka1.Text) <>0 then pound.Enabled := False
  else pound.Enabled := True;
end;
end;

procedure TForm1.ravnoClick(Sender: TObject);                                 // - + / *
begin
    if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка')or (Pos('О', Stroka1.Text) <>0) then e:=0
  else e:=StrToFloat(Stroka1.text);
  case znak of
  '+':e:=w+e;
  '-':e:=w-e;
  '/':begin
          if e=0 then begin
          Stroka2.text:='';
          pound.Enabled := True;
          znak:='';
          Stroka1.text:='Ошибка';
           Exit;
          end
          else e:= w / e;
        end;
  '*':e:=w*e;
  end;
  if e=0 then Stroka1.text:='0 '
  else Stroka1.text:=floattostr(e);
  Stroka2.text:='';
  if Pos(',', Stroka1.Text) <>0 then pound.Enabled := False
  else pound.Enabled := True;
  znak:='';
end;

procedure TForm1.ceClick(Sender: TObject);                         //с
begin
  Stroka1.text:='0 ';
  pound.Enabled := True;
end;

procedure TForm1.delClick(Sender: TObject);                       //<-
var
  q: String;
begin
  q := Stroka1.Text;
  if q <> '0 ' then
  begin
    Delete(q, Length(q), 1);
    Stroka1.Text := q;
  if Pos(',', Stroka1.Text) <>0 then pound.Enabled := False
  else pound.Enabled := True;
  end;
end;

procedure TForm1.cClick(Sender: TObject);                    //се
begin
  Stroka1.text:='0 ';
  Stroka2.text:='';
  w:=0;
  e:=0;
  znak:='';
  pound.Enabled := True;
end;

procedure TForm1.KorClick(Sender: TObject);                         //Кор
begin
  if Stroka1.Text = '' then Exit;
  if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка')or (Pos('О', Stroka1.Text) <>0) then w:=0
  else w:=StrToFloat(Stroka1.text);
  if (w > 0) or (w=0) then begin
    w := sqrt(w);
    Stroka1.Text := floattostr(w);
    if Pos(',', Stroka1.Text) <>0 then pound.Enabled := False
  else pound.Enabled := True;
  end
  else begin
   Stroka1.Text := 'Ошибка';
   Stroka2.Text := '';
  end;
end;

procedure TForm1.kvadrClick(Sender: TObject);                         //x^2
begin
  if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка') or (Pos('О', Stroka1.Text) <>0) then w:=0
  else w:=StrToFloat(Stroka1.text);
  w := w*w;
  Stroka1.Text := floattostr(w);
  if Pos(',', Stroka1.Text) <>0 then pound.Enabled := False
  else pound.Enabled := True;
end;

procedure TForm1.deleniena0Click(Sender: TObject);                           //1/x
begin
  if (Stroka1.Text='0 ') or (Stroka1.text='Ошибка')or (Pos('О', Stroka1.Text) <>0) then w:=0
  else w:=StrToFloat(Stroka1.text);
  if w<>0 then begin
  w := 1 / w;
   Stroka1.Text := floattostr(w);
  if Pos(',', Stroka1.Text) <>0 then pound.Enabled := False
  else pound.Enabled := True;
  end
else begin
      Stroka1.Text := 'Ошибка';
      pound.Enabled := True;
    end;
  end;


end.

