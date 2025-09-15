begin
  var q,r:string;
  var w,e:integer;
  writeln ('Введите строку');
  readln(q);
  w:= Length(q) div 3;
  for e:=1 to w do begin
    writeln (q[3*e]);
    r:=r+q[3*e];
  end;
  writeln (r)
end.