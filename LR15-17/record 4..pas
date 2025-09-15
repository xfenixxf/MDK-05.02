type toy = record
    name: string;
    price: string;
    age: string;
  end;

var
  q: array[1..5] of toy;
  q1: array[1..5] of toy;
  e: text;
  w,t: integer;
  r:string;
  
begin
  with q[1] do
  begin
    name := 'Конструктор Lego';
    price := '1500';
    age := '6-12 лет';
  end;
  with q[2] do
  begin
    name := 'Мяч';
    price := '500';
    age := '3-8 лет';
  end;
  with q[3] do
  begin
    name := 'Кукла Barbie';
    price := '1200';
    age := '4-10 лет';
  end;
  assign(e,'111');
  for w := 1 to 3 do begin
  rewrite(e);
    with q[w] do write(e, name, ' ', price, ' ', age);
  close(e);
  reset(e); 
    while not eof(e) do begin 
     with q1[w] do begin
      read(e, name);
      read(e, price); 
      read(e, age); 
    end;
     end;  
     close(e);
  end;
 
  for w:=1 to 3 do begin
    with q1[w] do
    begin
       writeln(name,price, age);
    end;
  end;
end.

