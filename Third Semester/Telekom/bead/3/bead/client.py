from socket import socket, AF_INET, SOCK_STREAM
from random import randint
import sys, time, select, struct

client = socket(AF_INET, SOCK_STREAM)

host = sys.argv[1]
port = int(sys.argv[2])
address = (host,port)
client.connect(address)

minNum = 1
maxNum = 100
canGuessAgain = True
ops = ['<', '>']

while canGuessAgain:
    guess = int( (minNum + maxNum) / 2)
    index = randint(0,1)
    op = ops[index]

    if maxNum > minNum:
        currentGuess = [op, guess]
    else:
        currentGuess = ['=', maxNum]

    packer = struct.Struct('ci')
    values = (currentGuess[0].encode(), currentGuess[1])
    print( "%s %d" % (currentGuess[0], currentGuess[1]))
    packedData = packer.pack(*values)
    client.sendall(packedData)
    
    data = client.recv(packer.size)
    unpackedData = packer.unpack(data)
    answer = unpackedData[0].decode()

    if answer == 'I':
        if op == '>':
            minNum = guess + 1
        else:
            maxNum = guess - 1
    elif answer == 'N':
        if op == '>':
            maxNum = guess
        else:
            minNum = guess
    elif answer == 'Y':
        canGuessAgain = False
        print("Nyertél!")
    elif answer == 'K':
        canGuessAgain = False
        print("Kiestél!")
    elif answer == 'V':
        canGuessAgain = False
        print("VÉGE!")

    random = randint(1,5)
    time.sleep(random)