type toy = record
    name: string;
    price: integer;
    age: string;
  end;

var
  q: array[1..5] of toy;
  w: integer;
  
begin
  with q[1] do
  begin
    name := 'Конструктор Lego';
    price := 1500;
    age := '6-12 лет';
  end;
  with q[2] do
  begin
    name := 'Мяч';
    price := 500;
    age := '3-8 лет';
  end;
  with q[3] do
  begin
    name := 'Кукла Barbie';
    price := 1200;
    age := '4-10 лет';
  end;
  for w:=1 to 3 do begin
    with q[w] do
    begin
       writeln(name,',  ',price,',  ', age);
    end;
  end;
end.

