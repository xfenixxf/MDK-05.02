unit dr;
interface 
uses GraphABC; 
procedure DrawDragon(x1, y1, x2, y2, q: integer);
implementation 
procedure dwrn(x1, y1, x2, y2, q: integer);            //параметризация
var
  x, y: integer;
begin
  if q > 0 then                                       //база рекурсии
  begin
    x := (x1 + x2) div 2 + (y2 - y1) div 2;           //декомпозиция
    y := (y1 + y2) div 2 - (x2 - x1) div 2;
    dwrn(x1, y1, x, y, q - 1);
    dwrn(x2, y2, x, y, q - 1);
  end
  else
    Line(x1, y1, x2, y2); 
end;
procedure DrawDragon(x1, y1, x2, y2, q: integer);
begin
  dwrn(x1, y1, x2, y2, q); 
end;
end. 
  
