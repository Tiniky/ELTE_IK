print('Hanyadik Fibonacci szĂĄm:')
num = int(input())
i = 0
j = 1
for k in range(2,num+1):
    interm = i
    i = j
    j = j + interm
if(num == 0):
    print(0)
else:
    print('A', num, '. Fibonacci szĂĄm a(z) :', j)