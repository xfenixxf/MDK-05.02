uses GraphABC;
Begin
  var i,e:integer;
  e:=150;
  i:=1;
  while i<11 do begin
    Circle(200,200,e);
    e:=e-10;
    i:=i+1;
  end;
end.