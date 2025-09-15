var 
  q,w:text;
  t:string;
Begin
  assign(q,'d:\1111\LR12\text6.txt');
  assign(w,'d:\1111\LR12\text61.txt');
  reset(q);
  rewrite(w);
  while not Eof(q) do begin
    readln(q,t);
    if t='' then continue;
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