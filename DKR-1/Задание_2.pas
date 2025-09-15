Begin
  var q,w,e,r:real;
  r:=-12;
  while (r<8) or (r=8) do begin
  if (r<-10) then begin 
  e:=exp(r); 
  w:=r*r;
  q:=w+e;
  end;
  if ((-10<r)or(-10=r)) and (r<1) then begin
  w:=Power((1/3), r);
  e:=(sin(r)/cos(r));
  q:=(70/w)+e;
  end;
  if (1<r)or(1=r) and (r<6) then begin
  w:=r**(0.1*r);
  e:=1/cos(r);
  q:=((r*r*r)/w)*e
  end;
  if (r=6) or (r>6) then q:=(sin(r)/cos(r));
  writeln ('X=  ',r,'  Y=  ',q:0:2);
  r:=r+0.1; 
  r:=(Round(r*10))/10;
  end;
end.