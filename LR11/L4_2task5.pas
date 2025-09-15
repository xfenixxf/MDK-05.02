uses GraphABC;
Begin
  SetWindowSize(600, 500);
  var q,w,i,e:integer;
  q:=50;
  w:=50;
  e:=10;
  for i:=1 to 8 do begin
    Circle(w,q,e);
    FloodFill(w,q,rgb(random(256), random(256), random(256)));
    w:=w+50;
    q:=q+50;
    e:=e+10;
  end;
end.