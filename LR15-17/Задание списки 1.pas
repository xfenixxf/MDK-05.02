type
  PNode = ^Node;
  Node = record
    word: string;
    count: integer;
    next: PNode; //указатель на следующий узел в списке
  end;

var
  Head: PNode;
  F: Text;
  Word: string;
  UniqueWordCount: integer;

function CreateNode(NewWord: string): PNode; //создание нового узла
var
  NewNode: PNode;//создаём новый узел
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  CreateNode := NewNode;
end;

procedure AddFirst(var Head: PNode; NewNode: PNode);//добавление узла в начало
begin
  NewNode^.next := Head;//указываем на голову списка
  Head := NewNode;// указываем голову списка на новый узел
end;

procedure AddAfter(p, NewNode: PNode);//добавление узла после узла p
begin
  NewNode^.next := p^.next;//указатель нового узла устанавливаем на следующий узел на который ссылался указатель p
  p^.next := NewNode;// Узел p устанавливаем на новый узел
end;

procedure AddLast(var Head: PNode; NewNode: PNode);//добавление узла в конец списка
var
  pp: PNode;
begin
  if Head = nil then
    AddFirst(Head, NewNode)//Если список пуст, добавляем в начало
  else
  begin
    pp := Head; 
    while pp^.next <> nil do //пока указатель pp не ссылаеется на nil ищем последний узел
      pp := pp^.next;//переходим к следующему узлу
    AddAfter(pp, NewNode);//добавляем новый узел в конец
  end;
end;

procedure AddBefore(var Head: PNode; p, NewNode: PNode);//добавить перед узлом
var
  pp: PNode;
begin
  pp := Head;
  if p = Head then
    AddFirst(Head, NewNode)//Если p — голова списка, добавляем в начало
  else
  begin
    while (pp <> nil) and (pp^.next <> p) do //пока указатель pp не ссылаеется на nil и не равен узлу p ищем последний узел
      pp := pp^.next;//переходим к следующему узлу
    if pp <> nil then// если рр ссылается на конец списка то
      AddAfter(pp, NewNode);//добавляем последний в конец списка
  end;
end;

function Find(Head: PNode; NewWord: string): PNode;//поиск слова по списку
var
  pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord <> pp^.word) do //пока рр не ссылается на конец и новое слово не совпадает со словом в узле
    pp := pp^.next;//переходим на следующий узел
  Find := pp;
end;

function FindPlace(Head: PNode; NewWord: string): PNode;//поиск места узла 
var
  pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do //пока рр не ссылается на конец и новое слово бльше чем слово в узле
    pp := pp^.next;//переходим на следующий узел
  FindPlace := pp;
end;

function TakeWord(var F: Text): string;
var
  c: char;
begin
  Result := '';
  c := ' ';
  while not eof(F) and (c <= ' ') do
    read(F, c);
  while not eof(F) and (c > ' ') do
  begin
    Result := Result + c;
    read(F, c);
  end;
end;

procedure PrintList(Head: PNode);
var
  pp: PNode;
begin
  pp := Head;
  while pp <> nil do
  begin
    writeln(pp^.word, ': ', pp^.count);
    pp := pp^.next;
  end;
end;

procedure CountUniqueWords(Head: PNode; var UniqueWordCount: integer);
var
  pp: PNode;
begin
  UniqueWordCount := 0;
  pp := Head;
  while pp <> nil do
  begin
    UniqueWordCount := UniqueWordCount + 1;
    pp := pp^.next;
  end;
end;

begin
  Head := nil;
  Assign(F, 'input.txt');
  Reset(F);

  while not eof(F) do
  begin
    Word := TakeWord(F);
    if Word <> '' then
    begin
      if Find(Head, Word) <> nil then
        Find(Head, Word)^.count := Find(Head, Word)^.count + 1
      else
      begin
        AddBefore(Head, FindPlace(Head, Word), CreateNode(Word));
      end;
    end;
  end;

  Close(F);

  PrintList(Head);
  CountUniqueWords(Head, UniqueWordCount);
  writeln('Количество различных слов: ', UniqueWordCount);
end.