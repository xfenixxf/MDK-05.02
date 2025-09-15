uses GraphABC;
var x,y,q:integer;
begin
  q:=0;
 SetWindowSize(1150, 600);
 x:=0; y:=550;
	repeat 	
	  SetPenColor(clWhite);
		Rectangle(x,y,x+50,y+50);	
		SetPenColor(clBlack);
		Rectangle(x,y,x+50,y+50);
		if (y>0)and (q=0) then y:=y-1;
		if y=0 then q:=1;
		if q=1 then y:=y+1;
		x:=x+1;
	until x>1100;
end.