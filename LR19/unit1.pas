unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var x,y,x1,i:integer;
  var f,f1,f2,f3,i1:real;
begin
  if (Edit1.Text = '') or (Edit3.Text = '') then
  begin
  edit2.Text:='заполните поля';
  end
  else
  begin
    i1:=1;
   x:=strtoint(Edit1.text);
   y:=strtoint(Edit3.text);
   if x<>1 then
   begin
   f1:=x+1;
   f2:=x-1;
   if x>0 then
   begin
   f3:=f1/f2;
   x1:=x;
   end
   else
   begin
   f3:=f2/f1;
   x1:=-x;
   end;
   for i:=1 to x1 do
   begin
    i1:=i1*f3;
   end;
   f:=i1+(18*x*y*y);
   edit2.Text:=floattostr(f);
   end
   else
   edit2.Text:='Нет решений';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.close;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form2.show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  edit1.Text:='';
  edit2.Text:='';
  edit3.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

end;


end.

