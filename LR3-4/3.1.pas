begin
var q,w,e,r,t:integer;
writeln ('ведите количество домов');
r:=0;
e:=0;
t:=1;
readln(q);
repeat 
  writeln('Введите число 1-если дом Ивановых,введите 2-если Петровых');
  readln(w);
  if (w=1) then r:=r+1;
  if (w=2) then e:=e+1;
  if (w<1) and (w>2) then writeln ('Данного значения не существует');
  t:=t+1
until (t>q) ;
writeln('Домов Ивановых=',r,' Домов Петровых=',e)
end.4