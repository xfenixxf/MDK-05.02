var i,n,q:integer;

procedure fib (i,n,q: integer);      //параметризация i,n,q
  begin
       writeln(i + n, ' ');  
    if q < 10 then                  // база рекурсии q < 10
        fib(n, i + n, q + 1);       // декомпозиция fib(n, i + n, q + 1)
  end;
begin
  fib(0, 1, 1);
end.