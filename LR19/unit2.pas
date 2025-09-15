unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form2.close;
end;

procedure TForm2.Button2Click(Sender: TObject);
var x1,x2,y1,y2,x,y,p,s:integer;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or(Edit3.Text = '') or (Edit4.Text = '') then
  begin
  edit5.Text:='заполните';
  edit6.Text:='поля';
  end
  else
  begin
  x1:=strtoint(Edit1.text);
  y1:=strtoint(Edit2.text);
  x2:=strtoint(Edit3.text);
  y2:=strtoint(Edit4.text);
  if x1<0 then edit1.Text:='Не должно быть -';
  if x2<0 then edit3.Text:='Не должно быть -';
  if y1<0 then edit2.Text:='Не должно быть -';
  if y2<0 then edit4.Text:='Не должно быть -';
  if (x1<0) or (x2<0) or (y1<0) or (y2<0) then
  begin
  edit5.Text:='нет отрицат.';
  edit6.Text:='Координат';
  end
  else
  begin
  if x2>x1 then x:=x2-x1
  else x:=x1-x2;
  if y2>y1 then y:=y2-y1
  else y:=y1-y2;
  s:=x*y;
  p:=2*(x+y);
  edit5.Text:=inttostr(p);
  edit6.Text:=inttostr(s);
  end;
  end;
end;


procedure TForm2.Button3Click(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
end;

end.

