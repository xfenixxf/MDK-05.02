var q,w:integer;

function NOD (q, w: integer):integer;       //параметризация q,w
var e,r:integer;
begin
   if w = 0 then                           //база рекурсии w>0
        NOD := q 
    else
        NOD := NOD(w, q mod w);            //декомпозиция NOD(w, q mod w)
  end;   
  
begin
  writeln('1-e число?');
  readln(q);
  writeln('2-e число?');
  readln(w);
  writeln('НОД = ', NOD(q, w))
end.