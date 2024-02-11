from pydoc import cli
from socket import socket, AF_INET, SOCK_STREAM
from random import randint
import sys, time, select, struct

client = socket(AF_INET, SOCK_STREAM)

host = sys.argv[1]
port = sys.argv[2]
address = (host, port)
client.connect(address)

canGuessAgain = True
minNum = 1
maxNum = 100

while canGuessAgain:
    guess = int((min-max)/2)
    
    op = randint(0,1)
    if max == min:
        if op == 0:
            currentGuess = ['<', guess]
        else:
            currentGuess = ['>', guess]
    else:
        currentGuess = ['=', guess]
    
    print("Tip" + currentGuess[0] + currentGuess[1])

    packer = struct.Struct('ci')
    values = (currentGuess[0].encode(), currentGuess[1])
    packedData = packer.pack(*values)
    client.sendall(packedData)

    data = client.recv()
    packer2 = struct.Struct('c')
    unpackedData = packer2.unpack(data)
    answer = unpackedData[0].decode()

    if answer == 'I':
        if op == 0:
            maxNum = guess
        else:
            minNum = guess
    elif answer == 'N':
        if op == 0:
            minNum = guess
        else:
            maxNum = guess
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
    try:
        time.sleep(random)
    except:
        print("EXIT")
        sys.exit()