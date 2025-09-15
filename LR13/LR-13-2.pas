var
  q: text;
  i,p:integer;
  s,r:string;
  sn:array of string;
Begin
  assign(q,'text22.txt');
  reset(q);
  while not eof(q) do begin
    read(q,r);
    s:=s+r;
  end;
  p:=length(s);
  setlength(sn,length(s));
  i:=0;
   while i<p do begin
    sn[i]:=s[p-i];
    i:=i+1;
  end;
  close(q);
  rewrite(q);i:=0;
  while i<(length(sn)) do begin
    r:=sn[i];
    write(q,r);
    i:=i+1;
    end;
  close(q);
end. 
