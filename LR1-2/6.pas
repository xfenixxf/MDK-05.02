begin
  var q,w,e:integer;
  writeln ('Введите № квартиры');
  readln (q);
  w:=(q div 36) div 4 +1;
  e:=q div 36 +1;
  if (q mod 4) =0 then begin
    e:=e-1;
    w:=w+8;
    end;
  writeln ('Подъезд    ',e, '    этаж   ',w);
end.