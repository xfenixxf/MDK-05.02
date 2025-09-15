type t_chs = set of Char;
const
  lett: t_chs = ['a'..'z','A'..'Z','_'];
  num: t_chs = ['0'..'9'];
var
  str: string;
  i: byte;
  fl: boolean;
begin
  writeln('Введите строку:');
  readln(str);
  fl := true;
  if not (str[1] in lett) then fl := false
  else
  begin
    for i := 2 to length(str) do
    begin
      if not (str[i] in lett + num) then
      begin
        fl := false;
        break; 
      end;
    end;
  end;
  if fl then
    writeln('Строка корректна')
  else
    writeln('Строка некорректна');
end.
