procedure CountingSort(var data: array of Integer; count: Integer; comparator: function(a, b: Integer): Integer);
var
  i, j, Range, MinValue, MaxValue: Integer;
  CountArray: array of Integer;
begin
  if count = 0 then Exit;
  MinValue := data[0];
  MaxValue := data[0];
  // Находим минимальное и максимальное значение
  for i := 1 to count - 1 do
  begin
    if data[i] < MinValue then MinValue := data[i];
    if data[i] > MaxValue then MaxValue := data[i];
  end;
  Range := MaxValue - MinValue + 1;
  SetLength(CountArray, Range);
  // Инициализация массива подсчета
  for i := 0 to High(CountArray) do
    CountArray[i] := 0;
  // Подсчет количества вхождений каждого элемента
  for i := 0 to count - 1 do
    Inc(CountArray[data[i] - MinValue]);
  // Заполнение исходного массива отсортированными элементами
  j := 0;
  for i := 0 to High(CountArray) do
    while CountArray[i] > 0 do
    begin
      data[j] := i + MinValue;
      Inc(j);
      Dec(CountArray[i]);
    end;
end;

procedure CountingSortForRadix(var data: array of Integer; count: Integer; exp: Integer);
var
  output: array of Integer;
  CountArray: array of Integer;
  i: Integer;
begin
  SetLength(output, count);
  SetLength(CountArray, 10); // Для цифр от 0 до 9

  // Инициализация массива подсчета
  for i := 0 to 9 do
    CountArray[i] := 0;

  // Подсчет количества вхождений
  for i := 0 to count - 1 do
    Inc(CountArray[(data[i] div exp) mod 10]);

  // Преобразование CountArray так, чтобы он содержал позиции
  for i := 1 to 9 do
    CountArray[i] := CountArray[i] + CountArray[i - 1];

  // Построение выходного массива
  for i := count - 1 downto 0 do
  begin
    output[CountArray[(data[i] div exp) mod 10] - 1] := data[i];
    Dec(CountArray[(data[i] div exp) mod 10]);
  end;

  // Копируем выходной массив в data
  for i := 0 to count - 1 do
    data[i] := output[i];
end;



procedure RadixSort(var data: array of Integer; count: Integer);
var
  maxVal, exp: Integer;
begin
  // Находим максимальное значение
  maxVal := data[0];
  for var i := 1 to count - 1 do
    if data[i] > maxVal then
      maxVal := data[i];

  // Применяем CountingSort для каждого разряда
  exp := 1;
  while (maxVal div exp) > 0 do
  begin
    CountingSortForRadix(data, count, exp);
    exp := exp * 10;
  end;
end;


procedure ReadDataFromFile(const filename: string; var data: array of Integer; var count: Integer);
var
  f: Text;
begin
  AssignFile(f, filename);
  Reset(f); 
  count := 0;
  while not Eof(f) do
  begin
    Read(f, data[count]);
    Inc(count);
    SetLength(data, count + 1); // Увеличиваем размер массива для следующего числа.
  end;
  CloseFile(f);
end;


procedure WriteDataToFile(const filename: string; const data: array of Integer; count: Integer);
var
  f: Text;
begin
  AssignFile(f, filename);
  Rewrite(f);
  for var i := 0 to count - 1 do
    WriteLn(f, data[i]);
  CloseFile(f);
end;


function CompareAscending(a, b: Integer): Integer;
begin
  if a > b then
  Result := -1
  else if a < b then
  Result := 1
  else
    Result := 0;
end;


var
  inputData: array of Integer; 
  countingData: array of Integer; 
  radixData: array of Integer; 
  count, i, time1, time2, time3, time4, countingTime, radixTime: Integer;
begin
  SetLength(inputData, 1000); 
  ReadDataFromFile('input.txt', inputData, count);
  
   // Сортировка подсчетом
   time1 := Milliseconds;
   SetLength(countingData, count); 
   for i := 0 to count - 1 do
     countingData[i] := inputData[i];
   CountingSort(countingData, count, CompareAscending);
   WriteDataToFile('output1.txt', countingData, count); 
   time2 := Milliseconds;

   // Поразрядная сортировка (Radix Sort)
   time3 := Milliseconds;
   SetLength(radixData, count); 
   for i := 0 to count - 1 do
     radixData[i] := inputData[i];
   RadixSort(radixData, count);
   time4 := Milliseconds; 
   WriteDataToFile('output2.txt', radixData, count);
   
   countingTime := time2 - time1; 
   radixTime := time4 - time3;
   WriteLn('Для сортировки данных методом подсчета потребовалось: ', countingTime, ' миллисекунд. А для поразрядной сортировки: ', radixTime, '.');
   WriteLn('Результат можно посмотреть в соответствующих файлах.');
end.
