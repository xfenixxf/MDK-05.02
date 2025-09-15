begin
  var q,w,e,r:real;
  writeln ('Введите вес 3 гантель');
  readln (q,w,e);
  if ((q>w) or (q = w)) and (q>e) and ((w>e) or (w = e))  then begin
  r:= q-e;
  writeln ('Расгость весов=  ',r);
  end;
  if (q>w) and (q>e) and (e>w) then begin
  r:= q-w; 
  writeln ('Разность весов=   ',r);
  end;
  if (q>w) and ((e>q) or (e = q)) and (e>w) then begin
  r:= e-w;
  writeln ('Разность весов=   ',r);
  end;
  if (w>q) and (w>e) and (q>e) then begin
  r:= w-e;
  writeln ('Разность весов=  ',r);
  end;
  if (w>q) and ((w>e) or ( w = e)) and ((e>q) or (e =q)) then begin
  r:= w-q;
  writeln ('Разность весов=   ',r);
  end;
  if ((w>q) or (w =q)) and (e>w) and ((e>q)  or (e = q )) then begin
  r:= e-q;
  writeln ('Разность весов=  ',r); 
  end;
  if (q=w) and (w=e) and (q=e) then begin
    r:= q-q;
    writeln ('Разность весов=  ',r);
  end;
end.