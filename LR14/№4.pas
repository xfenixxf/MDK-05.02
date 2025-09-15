var q,w:integer;

procedure LoopFor(q, w: integer);     //параметризация q,w
begin
  if q>w-1 then begin                 //база рекурсии q>w-1
    LoopFor(q-1,w);                   //декомпозиция  LoopFor(q-1,w)
    writeln ('привет');
  end;                 
end;
begin
  w:=1;
  writeln('колличество приветов');
  readln(q);
  LoopFor(q,w);              
end.