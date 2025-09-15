var 
  q,w:text;
  s,t:string;
  i,r:integer;
Begin
  s:=('');
  assign(q,'d:\1111\LR12\text4.txt');
  assign(w,'d:\1111\LR12\text41.txt');
  writeln('Введите № строки ');
  readln(r);
  reset(q);
  rewrite(w);
  i:=0;
  while not Eof(q) do begin
    readln(q,t);
    i:=i+1;
    if i=r then begin
      writeln(w,s);
    end;
    writeln(w,t);
  end;
  close(w);
  close(q);
  reset(w);
  rewrite(q);
  while not Eof(w) do begin
    readln(w,t);
    writeln(q,t);
  end;
   close(w);
  close(q);
end.