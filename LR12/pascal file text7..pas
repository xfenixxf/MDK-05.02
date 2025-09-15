var 
m, n, i, s, j, sum,k: integer;
q,w: text;
st:string;
begin
  assign(q,'z3in.txt');
  reset(q);
  readLn(q, st);
  val(st,n,k);
  m:=1;
  sum:=0;
  for j:=1 to n do
    begin
      s:=0;
      for i := 2 to m div 2 do
        if m mod i = 0 then
          begin
          s+=1
          end;
      m := m + 1;
      if s+2=5 then
        sum:=sum+(m-1);
    end;
    assign(w,'z3out.txt');
    rewrite(w);
    writeln(w,sum);
    close(q);
    close(w);
end.