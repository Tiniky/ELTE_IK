print("The itsy bitsy spider climbed up the waterspout.")
print()
print("Down came the rain and washed the spider out.")

print("My", "name", "is", sep="_", end="*")
print("Monty", "Python.", sep="*", end="*\n")

print("    *")
print("   * *")
print("  *   *")
print(" *     *")
print("***   ***")
print("  *   *")
print("  *   *")
print("  *****")

print("     *", "\n", "   * *", "\n", "  *   *", "\n", " *     *", "\n", "***   ***", "\n", "  *   *", "\n", "  *   *", "\n", "  *****")
print()

print("    *     " * 2)
print("   * *    "  * 2)
print("  *   *   "  * 2)
print(" *     *  "  * 2)
print("***   *** "  * 2)
print("  *   *   "  * 2)
print("  *   *   "  * 2)
print("  *****   "  * 2)

print("+" + 10 * "-" + "+")
print(("|" + " " * 10 + "|\n") * 5, end="")
print("+" + 10 * "-" + "+")

print("I'm")
#print(""learning"") <- syntax error
print("""Python""")

print(0o123)
print(0x123)

print(2 ** 3) 
print(2 ** 3.)
print(2. ** 3) 
print(2. ** 3.)
print()
print(2 * 3 % 5)
print((5 * ((25 % 13) + 100) / (2 * 13)) // 2)
print((2 ** 4), (2 * 4.), (2 * 4))
print((-2 / 4), (2 / 4), (2 // 4), (-2 // 4))
print((2 % -4), (2 % 4), (2 ** 3 ** 2), (2 ** 9))

print()
kilometers = 12.25
miles = 7.38
miles_to_kilometers = miles * 1.61
kilometers_to_miles = kilometers / 1.61
print(miles, "miles is", round(miles_to_kilometers, 2), "kilometers")
print(kilometers, "kilometers is", round(kilometers_to_miles, 2), "miles")

print()
x = 0
x = float(x)
y = 3* x **3 - 2*x**2 + 3*x - 1
print("y =", y)

print()
x = 1
x = float(x)
y = 3* x **3 - 2*x**2 + 3*x - 1
print("y =", y)

print()
x = -1
x = float(x)
y = 3* x **3 - 2*x**2 + 3*x - 1
print("y =", y)

print()
#this program computes the number of seconds in a given number of hours
# this program has been written two days ago
a = 2 # number of hours
seconds = 3600 # number of seconds in 1 hour
print("Hours: ", a) #printing the number of hours
print("Seconds in Hours: ", a * seconds) # printing the number of seconds in a given number of hours
#here we should also print "Goodbye", but a programmer didn't have time to write any code
#this is the end of the program that computes the number of seconds in 3 hour

print()
hour = int(input("Starting time (hours): "))
mins = int(input("Starting time (minutes): "))
dura = int(input("Event duration (minutes): "))
mins += dura
while(mins > 60):
    if hours == 23:
        hours = 0
    else:
        hour+=1
    mins -= 60
print(str(hour) + ":" + str(mins))