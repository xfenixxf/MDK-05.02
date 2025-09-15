type
  PNode = ^Node;
  Node = record
    data: integer;  
    next: PNode;    
  end;

var
  Head, Current: PNode;
  i,q,w,e: integer;


procedure AddLast(var Head: PNode; value: integer);// Процедура для добавления элемента в конец списка 
var
  NewNode, pp: PNode;
begin
  New(NewNode);          //Создаем новый узел 
  NewNode^.data := value; 
  NewNode^.next := nil; 

  if Head = nil then     // Если список пуст, новый узел становится головой 
    Head := NewNode
  else
  begin
    pp := Head;
    while pp^.next <> nil do  // Ищем последний узел 
      pp := pp^.next;
    pp^.next := NewNode;      // Добавляем новый узел в конец 
  end;
end;

procedure Find(Head: PNode;var q,w:integer);
var
  pp: PNode;
begin
  if Head = nil then
  begin
    Writeln('Список пуст!');
    Exit;
  end;

  pp := Head;
  q := pp^.data;  
  w:=pp^.data;
  while pp <> nil do
  begin
    if pp^.data > q then q := pp^.data;  
    if pp^.data < w then w := pp^.data; 
    pp := pp^.next;          
  end;
end;

procedure PrintList(Head: PNode);//Процедура для вывода всех элементов списка 
var
  pp: PNode;
begin
  pp := Head;
  while pp <> nil do
  begin
    Write(pp^.data, ' ');  
    pp := pp^.next;        
  end;
  Writeln;
end;

begin
  Head := nil; 
  writeln ('Введите колличество элементов');
  readln(e);
  for i := 1 to e do begin
    writeln ('Введите ',i ,' число');
    readln(q);
    AddLast(Head, q);
    end;

  Writeln('Весь список:');
  PrintList(Head);
Find(Head,q,w);
 writeln('Максимальное число:',q);
 writeln('Минимальное число:',w);
end.