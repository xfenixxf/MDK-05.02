var
  q: file of integer;
  w: file of integer;
  e: file of integer;
  i,p,r,j:integer;
  z:array [1..10] of integer;
  x:array [1..10] of integer;
  c:array [1..10] of integer;
Begin
  assign(q,'text3.txt');
  assign(w,'text323.txt');
  assign(e,'text333.txt');
  rewrite(q);
  for i:=1 to 10 do begin
    p:=random(1..100);
    write(q,p);
    z[i]:=p
  end;
  close(q);
  reset(q);
  rewrite(w);
  rewrite(e);
  i:=1;
  j:=1;
  while not eof(q) do begin
    read(q,r);
    if r mod 2 =0 then begin
       write(w,r);
       x[i]:=r;
       i:=i+1;
    end;
    if r mod 2 = 1 then begin
    write (e,r);
    c[j]:=r;
    j:=j+1;
  end;
  end;
  close(q);
  close(w);
  close(e);

  writeln('Начальный массив',z);
  writeln('кратные 2',x);
  writeln('некратные 2',c);
end. 
