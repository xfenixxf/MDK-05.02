begin
  var w,fl,o:integer;
  var q,r:string;
  writeln ('Введите исходную строку');
  readln (q);
  writeln ('Введите подстроку');
  readln (r);
  if length(q)<length(r) then fl:=-1
  else begin
    fl:=0;
    for w:=1 to (length(q)) do begin
    if q[w]=r[1] then begin
    for o:=1 to (length(r)) do begin
    if (w+o-1)>length(q) then Break
    else begin
    if (r[o]=q[w+o-1]) then begin
    fl+=1;
    end;
    end;
    end;
    end;
    if fl=length(r) then break
    else fl:=0
  end;
  end;
  if fl=length(r) then writeln ('Данная подстрока есть в строке')
  else writeln ('Данной подстрокии нет в строке');
end.