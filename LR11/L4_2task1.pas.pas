uses GraphABC;
begin
  SetWindowSize(1500, 1000);
  Circle(100,200,100);
  FloodFill(100,200,clRed);
  moveTo(200,200);
  lineTo(500,0);
  lineto(800,200);
  lineto(200,200);
  lineTo(500,400);
  lineto(800,200);
  lineto(200,200);
  Circle(900,200,100);
  FloodFill(900,200,clYellow);
  FloodFill(500,100,clBlue); 
  FloodFill(500,300,clLime); 
end.