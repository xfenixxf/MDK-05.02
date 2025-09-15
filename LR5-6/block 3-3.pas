begin
  var w,e:integer;
  var
  m :array [1..20] of integer;
  for e:=1 to 20 do begin
    m[e]:=random(-32768,32767);
  end;
  w:=0;
  for e:=1 to 20 do begin
    if (m[e] mod 2=0) then begin
      w:=w+1;
      if w>1 then m[e]:=w;
    end;
  end;
   writeln (m);
end.