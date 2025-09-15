type Matrix = array [1..6,1..8] of integer;
var m :Matrix;
var n:array [1..6] of integer;
var q:integer;

procedure asdfgh (var m:Matrix);
var a,s:integer;
Begin
 for a:=1 to 6 do begin
    for s:=1 to 8 do begin
      m[a,s]:=random(-100,100);
   end;
  end; 
end;

function qwert(var m:Matrix;q:integer):integer;
var c,b:integer;
begin
  for b:=1 to 8 do begin
    if ((m[q,b]>4) or (m[q,b]<-4))and (c=0) then begin
    qwert:=m[q,b];
    c:=m[q,b];
    end;
    end;
  end;
  
procedure trewq(var m:Matrix);
  var g,h:integer;
  begin
    writeln ('Матрица:'); 
     for g := 1 to 6 do
  begin
    for h := 1 to 8 do
      write(m[g,h]:3,',{',g,'},[',h,'],');
    writeln;
  end;  
  end;  
  
begin
  asdfgh(m);
 for q:=1 to 6 do begin
  n[q]:=qwert(m,q);
  end;
 writeln ('массив:',n);
 trewq(m);
end.
