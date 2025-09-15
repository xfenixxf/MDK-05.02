import math
q = int(input('Введите коэфициэнт a'))
w = int(input('Введите коэфициэнт b'))
e = int(input('Введите коэфициэнт c'))
r = (w*w)-(4*q*e);
if r<0 :
    print ('нет корней')
if r==0 :
    t = (-w)/(2*q);
    print('koren',t);
if r>0 :
    t =(-w- math.isqrt(r))/(2*q);
    y = (-w+ math.isqrt(r))/(2*q);
    print ('Корни x1=  ',t,'   и  x2= ',y);
