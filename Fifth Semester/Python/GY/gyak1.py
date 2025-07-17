array = []
for i in range(100):
    array.append(i+1)
print(array)

summa = 0
for i in range(len(array)):
    summa += array[i]
print(summa)
print(sum(array))

oszthatoSzamok = []
for i in range(len(array)):
    if array[i] % 3 == 0:
        oszthatoSzamok.append(array[i])
print(oszthatoSzamok)

szorzat = 1
for i in range(len(array)):
    szorzat *= array[i]
print(szorzat)

for i in range(len(array)):
    temp = []
    for j in range(1, len(array)):
        if array[i] % j == 0:
            temp.append(j)
    if len(temp) == 2:
        print(array[i])
        
def factorial(n):
    if n < 0: return None
    elif n == 1 or n == 0: return 1
    else:
        return n * factorial(n-1)
        
print(factorial(5))

for i in range(10):
    print(factorial(i))
         
print(factorial(-1))

print(len(str(factorial(100))))