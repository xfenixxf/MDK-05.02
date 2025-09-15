begin
  var q,w,e,r,t,y:real;
  read (q,w,e);
 if (q>w) and (q>e) then begin 
 r:=q;
 t:=w;
 y:=e;
 end;
 if (w>q) and (w>e) then begin
 r:=w;
 t:=q;
 y:=e;
 end;
 if (e>q) and (e>w) then begin
 r:=e;
 t:=w;
 y:=q;
 end;
 r:= ((r*r)-((t*t)+(y*y)))/(2*t*y);
 if ((q+w<e)or (q+w=e)) or ((w+e<q)or (w+e=q)) or ((q+e<w)or (q+e=w)) then writeln ('impossible')
 else if (r>0) then writeln ('acute')
 else if (r=0) then writeln ('rectangular')
 else if (r<0) then writeln ('obtuse');
end.