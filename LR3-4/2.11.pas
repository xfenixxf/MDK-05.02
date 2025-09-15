begin
var q,w,e:integer;
q:=1;
w:=1;
e:=0;
while (w<10) or (w=10) do
begin
  e:=e+q;
  q:=q*2;
  w:=w+1;
end;
writeln(e);
end.