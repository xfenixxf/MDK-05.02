uses graphABC;
var i, x1, x2, y1, y2, N,q,w,e: integer;
   h, x,y: real;
begin   
  SetWindowSize(801, 801);
  Line(0, 0, 0, 800);
  x1 := 0; y1 := 0;
  x2 := 100; y2 := 800;
  N := 8;
  h := (x2 - x1);
  x := x1 + h;
  for i:=1 to N do begin
    Line(round(x), y1, round(x), y2);
    x := x + h;
  end;
  Line(0, 0, 800,0);
  x1 := 0; y1 := 0;
  x2 := 800; y2 := 100;
  N := 8;
  h := (y2 - y1);
  y := y1 + h;
  for i:=1 to N do begin
    Line(x1,round(y) ,x2 ,round(y) );
    y := y + h;
  end;
end.