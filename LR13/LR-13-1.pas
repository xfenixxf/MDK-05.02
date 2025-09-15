var
  q: file of char;
  i,w:integer;
  s:string;
  r:char;
Begin
  assign(q,'text1.txt');
  reset(q);
  while not eof(q) do begin
    read(q,r);
    s:=s+r;
  end;
  w:=0;
   for i:=1 to (length(s)) do begin
    if (s[i]=' ') and (w=0) then
      w:=i;
  end;
  delete(s,w,(length(s)-w+1));
  rewrite(q);
  for i:=1 to (length(s)) do begin
    r:=s[i];
    write(q,r);
    end;
  close(q);
end. 
