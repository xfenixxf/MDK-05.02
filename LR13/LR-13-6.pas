var
  q: file of real;
  w: file of real;
  i,p,im,ix:integer;
  r,m,x:real;
  z:array [1..20] of real;
  l:array [1..20] of real;
Begin
  assign(q,'text6.txt');
  assign(w,'text66.txt');
  rewrite(q);
  for i:=1 to 20 do begin
    p:=random(-100..100);
    write(q,p);
  end;
  close(q);
  reset (q);
    for i:=1 to 20 do begin
    read(q,r);
    z[i]:=r;
    end;
    im:=0;ix:=0;
    m:=1000 ;x:=-1000;
    for i:=1 to 20 do begin
    if m>z[i] then begin
    im:=i;
    m:=z[i];
    end;
    if x<z[i] then begin
    ix:=i;
    x:=z[i];
    end;
    end;
    rewrite(w);
    for i:=1 to 20 do begin
     if (i<>im) and (i<>ix) then write(w,z[i]);
     if i=im then write(w,x);
     if i=ix then write(w,m)
    end;
    close (w);
    reset (w);
    for i:=1 to 20 do begin
      read (w,r);
      l[i]:= r;
    end;
  writeln('Начальный массив',z);
  writeln('Конечный массив',l);
end. 
