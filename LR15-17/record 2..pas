type
  anketa = record
    fio: string;
    birth: string;
    kurs: 1..5;
  end;

var
  student: array[1..5] of anketa;
  w: integer;

begin
  w := 1;
  while w <= 5 do begin
    writeln('Введите ФИО:');
    readln(student[w].fio);
    writeln('Введите дату рождения:');
    readln(student[w].birth);
    writeln('Введите курс (от 1 до 5):');
    readln(student[w].kurs);
    while (student[w].kurs < 1) or (student[w].kurs > 5) do begin
      writeln('Ошибка! Введите курс от 1 до 5:');
      readln(student[w].kurs);
    end;
    w := w + 1;
  end;

  // Вывод данных в табличном формате
  writeln('--------------------------------------------------');
  writeln('|      ФИО       | Дата рождения  | Курс |');
  writeln('--------------------------------------------------');
  for w := 1 to 5 do begin
    writeln('| ', student[w].fio:14, ' | ', student[w].birth:14, ' | ', student[w].kurs, '    |');
  end;
  writeln('--------------------------------------------------');
end.