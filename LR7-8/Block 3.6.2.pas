Begin 
  var q,w,nac:string;
  var e,t,y,col,i:integer;
  q:='Сегодня мы с вами рассмотрели, как работать со строками. Были описаны основные операторы и методы, которые используются для работы со строками';
  for y:=1 to Length(q) do begin
    if q[y]='Б' then begin
    col:=y;
    while not(q[col]=',') do begin
      w:=w+q[col];
      col+=1;
      end;
    end;
  end;
  writeln (w);
end.