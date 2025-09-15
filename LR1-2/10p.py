q = float(input('Введите 1-ю сторону'))
w = float(input('Введите 2-ю сторону'))
e = float(input('Введите 3-ю сторону'))
if (q>w) and (q>e) :
 r=q;
 t=w;
 y=e;
if (w>q) and (w>e) :
 r=w;
 t=q;
 y=e;
if (e>q) and (e>w) :
 r=e;
 t=w;
 y=q;
 r= (r*r-t*t-y*y)/(2*t*y);
if ((q+w<e)or (q+w==e)) or ((w+e<q)or (w+e==q)) or ((q+e<w)or (q+e==w)) : print ('impossible')
elif (r>0) : print ('acute')
elif (r==0) : print ('rectangular')
elif (r<0) : print ('obtuse');
