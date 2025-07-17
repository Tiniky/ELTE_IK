name = 'ABX'
type_of_company = 'XYZ'
print(f"{name} is an {type_of_company} company.")

#num = int(input('give num: '))
num = 100
print (num >= 100)

x = 4
y = 1
a = x & y
b = x | y
c = ~x # tricky!
d = x ^ 5
e = x >> 2
f = x << 2
print(a, b, c, d, e, f)

lst = [1, 2, 3, 4, 5]
lst.insert(1, 6)
del lst[0]
lst.append(1)
print(lst)

lst1 = [1, 2, 3, 4, 5]
lst_2 = []
add = 0
for number in lst1:
    add += number
lst_2.append(add)
print(lst_2)

ev = int(input("évszam "))
if (ev % 4 != 0):
    print('common year')
elif (ev % 100 != 0):
    print('leap year')
elif (ev % 400 != 0):
    print('common year')
else:
    print('leap year')
    
secret_number = 777
print(
"""
+================================+
| Welcome to my game, muggle! |
| Enter an integer number |
| and guess what number I've |
| picked for you. |
| So, what is the secret number? |
+================================+
""")

szam = int(input("Enter a secret number: "))
while szam != secret_number:
    szam = int(input("nah, give me another number: "))
else:
    print("nice u got this")
    
text = input("give me a word: ")
text = text.upper()
txt = ""
for i in range(len(text)):
    if text[i] not in ['A', 'E', 'I', 'O', 'U']:
        txt += text[i]
print(txt)