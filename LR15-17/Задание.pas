type
  PNode = ^Node; 
  Node = record
    data: integer; 
    next: PNode;   
  end;

var
  InputFile, OutputFile: Text;
  Stack: PNode;
  e: integer;


procedure Push(var Head: PNode; w: integer);//Процедура для добавления элемента в стек 
var
  NewNode: PNode;
begin
  New(NewNode);          
  NewNode^.data := w;   
  NewNode^.next := Head; 
  Head := NewNode;       
end;


function Pop(var Head: PNode): integer;// Функция для извлечения элемента из стека 
var
  q: PNode;
begin
  if Head = nil then
  begin
    Result := -1; // Ошибка: стек пуст 
    Exit;
  end;
  Result := Head^.data; // Берем данные из вершины стека 
  q := Head;            // Запоминаем вершину 
  Head := Head^.next;   // Удаляем вершину 
  Dispose(q);           // Освобождаем память 
end;


begin
  Stack := nil;
  Assign(InputFile, '171.txt');
  Reset(InputFile);
  while not Eof(InputFile) do
  begin
    Readln(InputFile, e);
    Push(Stack, e);
  end;
  Close(InputFile);
  Assign(OutputFile, '172.txt');
  Rewrite(OutputFile);

  while Stack <> nil do
  begin
    e := Pop(Stack);
    Writeln(OutputFile, e);
  end;
  Close(OutputFile);
end.