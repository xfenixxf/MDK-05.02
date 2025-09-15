type anketa = record
  fio:string;
  birth:string;
  kurs:1..5;
end;
var student: anketa;
Begin 
  writeln ('Введите фио');
  readln(student.fio);
  writeln ('Введите дату рождения');
  readln(student.birth);
  writeln ('Введите курс');
  readln(student.kurs);
  while (student.kurs<1) or (student.kurs>5) do begin
  writeln ('Введите курс');
  readln(student.kurs);
  if (student.kurs<1) or (student.kurs>5) then writeln ('такого не бывает');
  end;
  writeln('Вы-',student.fio,'   дата рождения-',student.birth,'учёба на курсе-',student.kurs);
end.