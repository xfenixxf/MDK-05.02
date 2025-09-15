var
  q: file of integer;
  w: file of integer;
  i,p,r,sum:integer;
  z:array [1..10] of integer;
Begin
  assign(q,'text4.txt');
  assign(w,'text44.txt');
  rewrite(q);
  for i:=1 to 10 do begin
    p:=random(1..100);
    write(q,p);
  end;
  close(q);
  reset(q);
  i:=1;sum:=0;
  while i<11 do begin
    read(q,r);
    if i mod 2 = 0 then sum:=sum+r; 
    z[i]:=r;
    i:=i+1;
  end;
  writeln('Количество кратных 2 = ',sum);
  rewrite(w);
  write(w,sum);
  close(w);
  writeln('Начальный массив',z)
end. 
