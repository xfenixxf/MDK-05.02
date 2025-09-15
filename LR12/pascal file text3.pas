var 
  q:text;
  s:string;
  i:integer;
Begin
  assign(q,'d:\1111\LR12\text2.txt');
  append(q);
  writeln('Введите строку ');
  readln(s);
  write(q,s,',');
  close(q);
end.