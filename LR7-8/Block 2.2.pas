begin
  var q:string;
  var e,x1,w1:integer;
  writeln ('Введите строку');
  readln(q);
  x1:=32767;
  w1:=32767;
  for e:=1 to length(q) do begin
  if (q[e]='x') and (x1>e) then x1:=e;
  if (q[e]='w') and (w1>e) then w1:=e;
  end;  
   if not ((w1=32767) or (x1=32767)) then begin 
    if x1>w1 then writeln ('Первый встречается "w"');
    if w1>x1 then writeln ('Первый встречается "x"'); 
    end;
   if (w1=32767) then writeln ('не встречается "w"');
   if (x1=32767) then writeln ('не встречается "x"');
end.