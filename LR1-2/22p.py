q = float(input('Введите вес 1 гантели'))
w = float(input('Введите вес 2 гантели'))
e = float(input('Введите вес 3 гантели'))
if ((q>w) or (q == w)) and (q>e) and ((w>e) or (w ==e)):
    r= q-e;
    print ('Разность весов=   ',r);
elif (q>w) and (q>e) and (e>w) :
  r= q-w; 
  print ('Разность весов=   ',r);
elif (q>w) and ((e>q) or (e == q)) and (e>w) :
  r= e-w;
  print ('Разность весов=   ',r);
elif (w>q) and (w>e) and (q>e) :
  r= w-e;
  print('Разность весов=    ',r);
elif (w>q) and ((w>e) or ( w == e)) and ((e>q) or (e == q)):
  r= w-q;
  print ('Разность весов=   ',r);
elif ((w>q) or (w == q)) and (e>w) and ((e>q)  or (e == q )) :
  r= e-q;
  print ('Разность весов=  ',r);
elif (q==w) and (w==e) and (q==e) :
    r= q-q;
    print ('Разность весов=  ',r);
