const
  MAX_SIZE = 100; // Максимальный размер списка,(т.к. данный список реализован на статической памяти то память для неё выделяется до начала выполнения самой программы)

type
  TNode = record
    Data: Integer;
    Next: Integer; // Индекс следующего элемента
    Prev: Integer; // Индекс предыдущего элемента
  end;

var
  Nodes: array[1..MAX_SIZE] of TNode; // Массив для хранения узлов
  Head: Integer; // Индекс головы списка
  FreeList: Integer; // Индекс первого свободного узла
  Count: Integer; // Количество элементов в списке

// Инициализация списка
procedure InitializeList;
var
  i: Integer;
begin
  Head := -1; // Список пуст
  FreeList := 1; // Начинаем с первого узла
  Count := 0;

  // Инициализация свободного списка
  for i := 1 to MAX_SIZE - 1 do
  begin
    Nodes[i].Next := i + 1;
    Nodes[i].Prev := i-1;
  end;
  Nodes[MAX_SIZE].Next := -1; // Конец свободного списка
  Nodes[MAX_SIZE].Prev := MAX_SIZE -1;
end;

// Выделение нового узла
function AllocateNode: Integer;
begin
  if FreeList = -1 then
  begin
    WriteLn('Ошибка: список полон');
    AllocateNode := -1;
    Exit;
  end;
  AllocateNode := FreeList;
  FreeList := Nodes[FreeList].Next; 
end;

// Освобождение узла
procedure FreeNode(Index: Integer);
begin
  Nodes[Index].Next := FreeList;
if FreeList <> -1 then Nodes[FreeList].Prev := Index;
  FreeList := Index;
  Dec(Count);
end;

// Добавление элемента в список
procedure AddElement(Data: Integer);
var
  NewNode, Current: Integer;
begin
  NewNode := AllocateNode; 
  if NewNode = -1 then Exit;

  Nodes[NewNode].Data := Data;

  if Head = -1 then
  begin
    Head := NewNode;
    Nodes[NewNode].Next := NewNode; 
    Nodes[NewNode].Prev := NewNode;
  end
  else
  begin
    Current := Head;
    while Nodes[Current].Next <> Head do
    begin
      Current := Nodes[Current].Next;
    end;
    Nodes[Current].Next := NewNode;
    Nodes[NewNode].Prev := Current;
    Nodes[NewNode].Next := Head;
    Nodes[Head].Prev := NewNode;
  end;

  Writeln('Элемент ', Data, ' добавлен в список.');
  Inc(Count); // Увеличиваем количество элементов
end;

// Удаление элемента из списка
procedure DeleteElement(Data: Integer);
var
  Current, Previous, NextNode: Integer;
begin
  if Head = -1 then
  begin
    Writeln('Список пуст.');
    Exit;
  end;

  Current := Head;
  repeat
    if Nodes[Current].Data = Data then
    begin
      Writeln('Элемент ', Data, ' удален из списка.');
      Writeln('Соседи: [', Nodes[Nodes[Current].Prev].Data, '] <-> [удалён:', Nodes[Current].Data, ':удалён] <-> [', Nodes[Nodes[Current].Next].Data, ']');
      if Nodes[Current].Next = Current then
      begin
        Head := -1; // Список стал пустым
      end
      else
      begin
        Previous := Nodes[Current].Prev;
        NextNode := Nodes[Current].Next;
        Nodes[Previous].Next := NextNode;
        Nodes[NextNode].Prev := Previous;

        if Current = Head then
          Head := NextNode;
      end;

      FreeNode(Current);
      Exit; // Выходим после удаления
    end;

    Current := Nodes[Current].Next;
  until Current = Head;

  Writeln('Элемент ', Data, ' не найден в списке.');
end;

// Поиск элемента в списке
procedure FindElement(Data: Integer);
var
  Current: Integer;
begin
  if Head = -1 then
  begin
    Writeln('Список пуст.');
    Exit;
  end;

  Current := Head;
  repeat
    if Nodes[Current].Data = Data then
    begin
      Writeln(Nodes[Current].Data,'Элемент ', Data, ' найден в списке.');
      Writeln('Соседи: [', Nodes[Nodes[Current].Prev].Data, '] <-> [', Nodes[Current].Data, '] <-> [', Nodes[Nodes[Current].Next].Data, ']');;
      Exit;
    end;
    Current := Nodes[Current].Next;
  until Current = Head;

  Writeln('Элемент ', Data, ' не найден в списке.');
end;

// Вывод списка
procedure PrintList;
var
  Current: Integer;
begin
  if Head = -1 then
  begin
    Writeln('Список пуст.');
    Exit;
  end;

  Writeln('Содержимое списка:');
  Current := Head;
  repeat
    Write(Nodes[Current].Data, ' <-> ');
    Current := Nodes[Current].Next;
  until Current = Head;
  Writeln('(начало<->',Nodes[Head].Data,'<->...)');
end;

procedure ShowMenu;
begin
  Writeln('1. Добавить элемент');
  Writeln('2. Удалить элемент');
  Writeln('3. Найти элемент');
  Writeln('4. Вывести список');
  Writeln('5. Выход');
end;

var
  Choice, Data: Integer;
begin
  InitializeList;

  repeat
    ShowMenu;
    Write('Выберите действие: ');
    Readln(Choice);

    case Choice of
      1:
        begin
          Write('Введите значение элемента: ');
          Readln(Data);
          AddElement(Data);
        end;
      2:
        begin
          Write('Введите значение элемента для удаления: ');
          Readln(Data);
          DeleteElement(Data);
        end;
      3:
        begin
          Write('Введите значение элемента для поиска: ');
          Readln(Data);
          FindElement(Data);
        end;
      4:
        begin
          PrintList;
        end;
      5:
        begin
          Writeln('Выход из программы.');
          Exit;
        end;
      else
        Writeln('Неверный выбор. Попробуйте снова.');
    end;
  until False;
end.