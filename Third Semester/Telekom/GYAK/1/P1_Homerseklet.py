def fahrenheit(T):
	return ((float(9)/5)*T + 32)
	
def celsius(T):
	return (float(5)/9)*(T-32)
	
temperatures = (36.5, 37, 37.5, 38, 39)

F = map(fahrenheit, temperatures) #map(function, iterable data)
C = map(celsius, F)

temperatures_in_F = list(map(fahrenheit, temperatures))
temperatures_in_C = list(map(celsius, temperatures_in_F))

print('Eredeti Celsius:\t',temperatures)			# (36.5, 37, 37.5, 38, 39)
print('Fahrenheit:\t\t',temperatures_in_F) 			# [97.7, 98.60000000000001, 99.5, 100.4, 102.2]
print('Vissza Celsiusba:\t',temperatures_in_C) 	# [36.5, 37.00000000000001, 37.5, 38.00000000000001, 39.0]

print('\n')