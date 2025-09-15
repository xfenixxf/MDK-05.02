begin
  var rand,w,e,r,indmax,max,i,indmin,min,kr5,indkr5:integer;
  var
  m :array [1..20] of integer;
  for w:=1 to 20 do begin
  rand:= random (-52,65);
  for e:=1 to w do begin
  if (m[e] > rand) or (m[e] < rand) then m[w] := rand ;
  end;
 end;
  r:=-100;
  i:=100;
  for e:=1 to w do begin
   if m[e] > r then begin
     r:=m[e];
     indmax:=e;
     max:=r;  
     end;
   if (i> m[e]) and (m[e]>0) then begin
     i:=m[e];
     indmin:=e;
     min:=i;
     end;
  end;
  for e:=0 to w do begin
    if (m[w-e] mod 5 =0) then begin
      kr5:=m[w-e];
      indkr5:=(w-e);
      break
    end;
   end;
   writeln ('массив:',m);
   writeln ('максимальный элемент= ',max,'   ;его индекс= ',indmax);
   writeln ('минимальный положительный элемент= ',min,'    ;его индекс=',indmin);
   writeln ('последний номер кратный 5 в массиве=',kr5,'   ;его индекс=',indkr5);
end.