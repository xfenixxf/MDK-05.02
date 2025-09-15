begin
  var q,w,e,r,t,y:real;
  writeln ('Введите переменные a, b, c');
  readln (q,w,e);
  r:= (w*w)-(4*q*e);
  if r<0 then writeln ('нет корней');
  if r=0 then begin
    t:= (-w)/(2*q);
    writeln ('корень', t);
  end;
  if r>0 then begin
    t:= (-w-sqrt(r))/(2*q);
    y:= (-w+sqrt(r))/(2*q);
   writeln ('korni   ',t, '  i  ',y);
  end;
end.