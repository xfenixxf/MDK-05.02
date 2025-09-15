uses GraphABC, dr; 
var
  z, x,c,v: integer;
procedure KeyDown(k: integer);
begin
  case k of
    VK_W: x += 10; 
    VK_S: x -= 10;  
    VK_D: z -= 10; 
    VK_A: z += 10; 
    VK_Z: if v < 2000 then v += 10; 
    VK_X: if v > 50 then v -= 10;   
    VK_C: if c < 21 then c += 1;    
    VK_V: if c > 1 then c -= 1;     
  end;
  
  Window.Clear; 
  DrawDragon(z - v, x, z + v, x, c); 
  Redraw; 
end;

begin
  z := 350; 
  x := 250;
  v := 200; 
  c := 10;   
  SetWindowCaption('Кривая Хартера-Хэйтуэя');
  SetWindowSize(700, 500);
  LockDrawing;
  KeyDown(0);
  OnKeyDown += KeyDown;
end.