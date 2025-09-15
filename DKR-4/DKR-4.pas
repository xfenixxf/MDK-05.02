uses graphABC;

var q,w:real;
var e,fl,fl1,cas,o :integer;

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
    textout(10, 30,'Введте a-начальную границу интеграла');
  readln (q);
  GraphABC.ClearWindow;
 textout(10, 50,'ведите b-конечную границу интеграла');
  readln (w);
  GraphABC.ClearWindow;
  textout(10, 70,'Введите количество разбиений этого интеграла');
  readln (e);
  GraphABC.ClearWindow;
end;

procedure casemenu(var cas:integer);
begin
  textout(10, 50,'Введите 1, чтобы расчитать интнграл');
  textout(10, 70,'Введите 2, чтобы расчитать погрешность');
  textout(10, 100,'Введите 3, чтобы расчитать интеграл с погрешностью');
  textout(10, 130,'Введите любое число, чтобы выйти');
  readln(cas);
  GraphABC.ClearWindow; 
end;

procedure vizual ();
var x,y,x0,y0,n,x2,y2,WIT,HGH:integer;
var x1,y1,a,b,k,Sh:real;
Begin
  WIT:=800;
  HGH:=600;
  setwindowsize(WIT,HGH);
  textout(405, 5, 'Y');
  textout(780, 300, 'X');
  x0:=WIT div 2;
  y0:=HGH div 2;
  line(x0,10,x0,HGH-10);
  line(10,y0,WIT-10,y0);
  textout(600, 490,'Введите a');
  readln(a);
  textout(600, 490,'Переменная a = '+a);
  textout(600, 520,'Введите b');
  readln(b);
  textout(600, 520,'Переменная b = '+b);
  textout(600, 550,'Введите кол-во разбиений');
  readln (n);
  textout(600, 550,'Количество разбиений = '+n);
  textout(600, 580,'Введите Маштаб ');
  readln(k);
  textout(600, 580,'Маштаб графика = '+k);
  x1:=a;
  Sh:=(b-a)/n;
  while x1<=b do
  begin
    y1:=qwerty(x1);
    x:=x0+round(x1*k);
    y:=y0-round(y1*k);
    setpixel(x,y,clred);
    x1+=0.001;
  end;x1:=a;
while x1<=b do begin
    y1:=qwerty(x1);
    x:=x0+round(x1*k);
    y:=y0-round(y1*k);
    line(x,y,x,y0);
    if x1<b then begin
    x2:=x0+round((x1+Sh)*k);
    y2:=y0-round((qwerty(x1+Sh)*k));
    line(x,y,x2,y2);
    end;
    x1+=Sh;
  end;
end;

Begin
  fl:=1;
  while fl=1  do begin
  textout(10, 10,'Введите 1, чтобы перейти к вычислениям');
  textout(10, 30,'Введите 2, чтобы перейти к визуализаци');
  textout(10, 50,'Введите любое число, чтобы выйти');
  readln(o);
  GraphABC.ClearWindow; 
  if (o<3) and (o>0) then begin
    case o of
 1:begin
       textout(10, 10,'Интеграл от функции: 2*t**3-2*t**2-5*t+19');
       vvod(q,w,e); 
       fl1:=1;
       while fl1=1  do begin
       casemenu(cas);
       if (cas<4) and (cas>0) then begin
         case cas of
    1:begin;
      textout(10, 10,'Площадь интеграла='+trapecia(qwerty,q,w,e));
    end;
    2:begin
      textout(10, 10,'Погрешность равна:'+pogreshnost(pervoobraznaia,q,w,trapecia));
    end;
    3:begin
      textout(10, 10,'Площадь интеграла='+trapecia(qwerty,q,w,e));
      textout(10, 30,'Погрешность равна:'+pogreshnost(pervoobraznaia,q,w,trapecia));
    end;
    end;
    end
    else fl1:=0;
     end;
     end;
2: begin
    vizual
  end;
  end;
  end 
  else  fl:=0;
end;
end.