print ('Введите количество судий')
q=int(input())
r=0
t=1000000
w=1
y=0
while (w<q) or (w==q) :
    print ('Введите оценку ',w,' 6судьи')
    e=int(input())
    if (e>r) : r=e
    if (e<t) : t=e
    y=y+e
    w=w+1
u=(y-r)-t
u=u/(q-2)
print ('Средняя оценка=  ',u)

