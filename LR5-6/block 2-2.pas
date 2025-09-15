var m: array of integer;
begin
  var q,w,fl:integer;
  writeln('Введите длинну массива');
  readln(q);
  SetLength(m,q);
  for w:=0 to q-1 do begin
    writeln ('Введите ',w+1,'-й элемент массива');
    readln (m[w]);
    end;
  fl:=0;
  for w:=1 to q-1 do begin
    if m[w-1]<m[w] then begin
      fl:=1;
      writeln (m[w-1],'<',m[w]);
    end;
  end;
  if fl=1 then writeln ('Элементы массива не упорядоченны по убыванию')
  else writeln ('Элементы массива упорядоченны по убыванию');
  writeln ('Массив= ',m);
end. 