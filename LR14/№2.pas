var x: integer;

   function sumto (a: integer): integer;   //параметризация а
   begin
        if (a<=1) then a:=1               // база рекурсии а>1
        else a:=a+(sumto(a-1));           //декомпозиция a+(sumto(a-1))
   sumto:=a;
end;
begin
writeln('Число?');
readln(x);
writeln('сумма чисел = ',sumto(x));
end.