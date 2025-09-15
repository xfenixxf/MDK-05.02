var 
  q: text;
   a:string;
   i,w,e:integer;
begin 
  writeln ('ведите количество строк');
  readln(w);
  writeln ('Введите количество * в строке');
  readln (e);
  assign(q,'d:\1111\LR12\text1.txt');
  rewrite(q);
  for i:=1 to w do Writeln (q,'*'*e);
  close(q);
end.