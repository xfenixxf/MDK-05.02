var
   filetext: text;
   a:string;
   i:integer;
   q: array of string;
begin
  setlength(q,11);
assign(filetext,'d:\1111\LR12\text.txt');
rewrite(filetext);
for i:=1 to 10 do Writeln (filetext, i);
close(filetext);
reset(filetext);
for i:=1 to 10 do begin
    readln(filetext,a);
    q[i]:=a;
end;
close(filetext);
writeln(q);
end.