type
  PNode = ^Node;
  Node = record
    data: integer;  
    next: PNode;    
  end;

var
  Head, Current: PNode;
  i,q: integer;


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

procedure PrintEvenElements(Head: PNode);
var
  pp: PNode;
begin
  pp := Head;
  while pp <> nil do
  begin
    if pp^.data mod 2 = 0 then  
      Write(pp^.data, ' ');     
    pp := pp^.next;             
  end;
  Writeln;
end;

begin
  Head := nil; 
  for i := 1 to 10 do begin
    writeln ('Введите ',i ,' число');
    readln(q);
    AddLast(Head, q);
    end;

  Writeln('Весь список:');
  PrintList(Head);

  Writeln('Четные элементы списка:');
  PrintEvenElements(Head);
end.