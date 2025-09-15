var
  q: file of char;
  i:integer;
  r:char;
Begin
  assign(q,'text7.txt');
  reset(q);
  i:=0;
  while not eof(q) do begin
    read(q,r);
    if i mod 2 <> 0 then r:='!';
    seek(q,i);
    write(q,r);
    i+=1;
  end;
    close(q);
end. 
