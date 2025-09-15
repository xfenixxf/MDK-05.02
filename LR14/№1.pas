var n:integer;

procedure qwe(n: integer);   //параметризация n
  begin
       if n>1  then           //база рекурсии n>1
         qwe(n-2);   
         writeln (n);//декомпозиция
  end;
  
  begin 
    n:=25;
    qwe (n);
  end.