unit unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
   var a,b,h,x,y:integer;
begin
a:=strtoint(Edit1.Text);
b:=strtoint(Edit2.Text);
h:=strtoint(Edit3.Text);
x:=a;
y:=x*x;
Memo1.Lines.add('X='+IntToStr(x)+' Y= '+IntToStr(y));
while x<=b-h do
begin
x:=x+h;
y:=x*x;
Memo1.Lines.add('X='+IntToStr(x)+' Y= '+IntToStr(y));
end;
end;
end.
