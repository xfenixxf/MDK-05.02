uses GraphABC;
begin
  var q,w,e,r:integer;
  q:=100;
  w:=50;
  while w<291 do begin
    Circle(w,q,10);
    FloodFill(w,q,rgb(random(256), random(256), random(256)));
    w:=w+30;
  end;
end.