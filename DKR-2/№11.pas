begin
  var q,w,e,fl,o:integer;
  writeln ('Введите длинну начального массива');
  readln (q);
  var m:array of integer;
  SetLength(m,q);
  for w:=0 to q-1 do begin
    writeln ('Введите ',w+1,'-й элемент массива');
    readln (m[w]);
  end;
  writeln ('Введите длинну последовательности');
  readln (e);
  var r:array of integer;
  SetLength(r,e);
  for w:=0 to e-1 do begin
    writeln ('Введите ',w+1,'-й элемент массива');
    readln (r[w]);
  end;
  if length(m)<length(r) then fl:=-1
  else begin
    fl:=0;
    for w:=0 to q-1 do begin
    if m[w]=r[0] then begin
    for o:=0 to e-1 do begin
    if (w+o+1)>length(m) then Break
    else begin
    if (r[o]=m[w+o]) then fl+=1;
    end;
    end;
    if fl=length(r) then break
    else fl:=0
   end;
  end;
  end;
  if fl=length(r) then writeln ('Данная последовательность есть в массиве')
  else writeln ('Данной последовательности нет в массиве');
end.