var
  y,e: set of byte;
  q,r,t:byte;
begin
  while true do begin
     read(q);
     t:=q;
y:=[2..4];
e:=[11,12,13,14];
  r:= q mod 10; 
  t := q mod 100; 
    if t in e then writeln(q, ' лет')
    else if r = 1 then writeln(q, ' год')
    else if r in y then writeln(q, ' года')
    else writeln(q, ' лет');
  end;
end.