var
  q: file of real;
  w: file of real;
  i,r:integer;
  p,e,m:real;
  z:array [1..20] of real;
Begin
  assign(q,'text5.txt');
  assign(w,'text55.txt');
  rewrite(q);
  for i:=1 to 20 do begin
    p:=random(-100..100);
    write(q,p);
  end;
  close(q);
  reset(q);
  for i:=1 to 20 do begin
    read(q,e);
    z[i]:=e;
  end;
  i:=1;m:=0;
for i:=2 to 19 do begin
    if (z[i]>z[i+1]) and (z[i]>z[i-1]) then begin
      m:=z[i];
      r:=i
      end;
  end;
  writeln('Последний локальный максимум= ',m,'    с индексом   ',r);
  rewrite(w);
  write(w,m);
  close(w);
  writeln('Начальный массив',z)
end. 
