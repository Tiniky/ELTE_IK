from random import randint
from socket import socket, AF_INET, SOCK_DGRAM, SOCK_STREAM,SOL_SOCKET,SO_REUSEADDR,timeout
import select,sys,struct

server = socket(AF_INET,SOCK_STREAM)

host = sys.argv[1]
port = int(sys.argv[2])
address = (host,port)
server.bind(address)

server.listen()

num = randint(1, 100)
input = [server]
gameOver = False

print("A szam: %d" % num)

while True:
    r, w, e = select.select(input, [], [], 1)

    if not (r or w or e):
        continue

    for sock in r:
        if sock is server:
            client, clientAdress = sock.accept()
            input.append(client)
            packer = struct.Struct('ci')
        else:
            data = sock.recv(packer.size)

            if data:
                unpackedData = packer.unpack(data)

                answer = ''
                op = unpackedData[0].decode()
                guessedNum = unpackedData[1]
                
                if op == '>':
                    if num > guessedNum:
                        answer = 'I'
                    else:
                        answer = 'N'
                elif op == '<':
                    if num < guessedNum:
                        answer = 'I'
                    else:
                        answer = 'N'
                elif op == '=':
                    if num == guessedNum:
                        answer = 'Y'
                    else:
                        answer = 'K'

                values = (answer.encode(), 1027)
                packedAnswer = packer.pack(*values)
                sock.sendall(packedAnswer)

                if answer == 'Y':
                    gameOver = True

                if gameOver or answer == 'K':
                    valuesVege = ('V'.encode(), 1027)
                    sock.sendall(packer.pack(*valuesVege))
                    input.remove(sock)
                    sock.close()
            else:
                input.remove(sock)
                sock.close()