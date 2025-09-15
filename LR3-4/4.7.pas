begin
  var q,w,e,r,t,y:integer;
  var u:real;
  writeln ('Введите количество судий');
  readln (q);
  r:=0;
  t:=1000000;
  w:=1;
  while (w<q) or (w=q) do
  begin
    writeln ('Введите оценку ',w,' судьи');
    readln (e);
    if (e>r) then r:=e;
    if (e<t) then t:=e;
    y:=y+e;
    w:=w+1;
  end;
  u:=(y-r)-t;
  u:=u/(q-2);
  writeln ('Средняя оценка=  ',u)
end.
