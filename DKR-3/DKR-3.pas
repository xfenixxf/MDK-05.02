uses Crt;
var q,w:real;
var e,fl,fl1,cas,o:integer;

function qwerty (t:real):real;
Begin
  qwerty:=2*t**3-2*t**2-5*t+19
end;

function pervoobraznaia(t: real): real;
begin
  pervoobraznaia := 2*((t**4)/4)-2*((t**3)/3)-5*((t**2)/2)+19*t;
end;

function trapecia (qwerty: function(t: real): real; q, w: real; e:integer): real;
var
  i: integer;
  s, h: real;
  t: array of real;
begin
  Setlength(t,e+2);
  h := (w - q) / e;
  s:= 0;
  for i := 1 to e+1 do begin
    t[i]:=q+(h*(i-1));
  end;
  for i := 1 to e do begin
  s += h * (qwerty( t [i]) + qwerty (t [i + 1])) / 2
  end;
  trapecia:=s
end;

function pogreshnost(pervoobraznaia: function(t: real): real; q,w: real;trapecia:function (qwerty: function(t: real): real; q, w: real; e:integer): real):real;
begin
  pogreshnost :=abs(trapecia(qwerty, q, w, e)-(pervoobraznaia(w) - pervoobraznaia(q)));
end;

procedure vvod(var q,w:real;var e:integer);
begin
    Writeln('Введте a-начальную границу интеграла');
  readln (q);
  writeln ('ведите b-конечную границу интеграла');
  readln (w);
  writeln ('Введите количество разбиений этого интеграла');
  readln (e);
end;

procedure casemenu(var cas:integer);
begin
  writeln('Введите 1, чтобы расчитать интнграл');
  writeln('Введите 2, чтобы расчитать погрешность');
  writeln('Введите 3, чтобы расчитать интеграл с погрешностью');
  writeln('Введите любое число, чтобы выйти');
  readln(cas);
end;

Begin
  fl:=1;
  while fl=1  do begin
  writeln('Введите 1, чтобы перейти к вычислениям');
  writeln('Введите любое число, чтобы выйти');
  readln(o);
    if o=1 then begin
       writeln('Интеграл от функции: 2*t**3-2*t**2-5*t+19');
       vvod(q,w,e); 
       fl1:=1;
       while fl1=1  do begin
       casemenu(cas);
       if (cas<4) and (cas>0) then begin
         case cas of
    1:begin
      writeln('Площадь интеграла=',trapecia(qwerty,q,w,e));
    end;
    2:begin
      writeln('Погрешность равна:',pogreshnost(pervoobraznaia,q,w,trapecia))
    end;
    3:begin
      writeln('Площадь интеграла=',trapecia(qwerty,q,w,e));
      writeln('Погрешность равна:',pogreshnost(pervoobraznaia,q,w,trapecia))
    end;
    end;
    end
    else fl1:=0;
     end;
     end
  else fl:=0; 
  end;
end.