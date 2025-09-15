var 
  q,w:text;
  i,r,t:integer;
Begin
  assign(q,'input.txt');
  assign(w,'output.txt.');
  reset(q);
  rewrite(w);
   i:=-100000;
   r:=100000;
  while not Eof(q) do begin
    readln(q,t);
    if i<t then begin
      i:=t;
      end;
     if r>t then begin
      r:=t;
    end;
    end;
  close(q);
  writeln(w,'макс число = ',i);
  writeln(w,'мин число = ',r);
  close(w)
end.