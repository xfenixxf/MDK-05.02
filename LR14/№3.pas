var x,y: integer;
function stepen (x,y: integer):integer; //параметризация x,y
var q:integer;
begin
if q=0 then q:=1;
  if y>0 then begin                     //база рекурсии y>0
    q:= stepen (x,y-1)*x;               //декомпозиция stepen (x,y-1)*x
  end;
  stepen:=q
end;
begin
  writeln('число?');
  readln(x);
  writeln('степень?');
  readln(y);
  writeln('итоговое число = ',stepen(x,y));
end.