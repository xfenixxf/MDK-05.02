program qwer;
var q,w:integer;                                                              //Глобальные переменные
var m: array of integer;
function qwert (m:array of integer):integer;                                  //Фактические переменные.Параметры, передаваемые по значению.
 var n:integer;                                                               //Локальные переменные
 b:=1;
 begin
    for n:=0 to length(m)-1 do begin                                          
   if n mod 2>0 then b:=b*m[n];                                               //n,b - Формальные параметры
 end;
    qwert:=b;                                                                 //Фактические переменные
 end;

begin 
  writeln('Введите длинну массива');
  readln(q);
  SetLength(m,q);
  for w:=0 to q-1 do begin
    writeln ('Введите ',w+1,'-й элемент массива');
    readln (m[w]);
    end;
   writeln(qwert(m));
end.