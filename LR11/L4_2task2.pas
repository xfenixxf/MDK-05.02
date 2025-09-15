uses GraphABC;
begin
 SetWindowSize(800, 600);
 line(100,100,200,550);
 line(100,100,285,270);
 line(350,50,200,550);
 line(350,50,500,550);
 line(600,100,415,270);
 line(600,100,500,550);
 line(200,550,500,550);
 circle(100,100,50);
 circle(350,50,50);
 circle(600,100,50);
  FloodFill(350,50,clRed);
  FloodFill(100,100,clBlue);
  FloodFill(120,160,clBlue);
  FloodFill(600,100,clLime);
  FloodFill(580,160,clLime);
  FloodFill(350,200,clRed);
  FloodFill(400,400,clRed);
  FloodFill(300,400,clRed);
  FloodFill(350,500,clRed);
end.
