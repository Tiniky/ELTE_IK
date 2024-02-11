from http import client
from random import randint
from re import T
from socket import socket, AF_INET, SOCK_DGRAM, SOCK_STREAM,SOL_SOCKET,SO_REUSEADDR,timeout
import select,sys,struct
from sqlite3 import connect

server = socket(AF_INET, SOCK_STREAM)

host = sys.argv[1]
port = sys.argv[2]
address = (host, port)
server.bind(address)

server.listen()

num = randint(1,100)
input = [server]
gameOver = False

print("The number: " + num)

while True:
    try:
        r, w, e = select.select(input, [], [], 1)

        if not(r or w or e):
            continue
        
        for sock in r:
            if sock == server:
                client, clientAdress = sock.accept()
                input.append(client)
            else:
                data = sock.recv()

                if data:
                    packer = struct.Struct('ci')
                    unpackedData = packer.unpack(data)

                    answer = ''
                    op = unpackedData[0].decode()
                    guess = unpackedData[1]

                    if op == '>':
                        if num > guess:
                            answer = 'I'
                        else:
                            answer = 'N'
                    elif op == '<':
                        if num < guess:
                            answer = 'I'
                        else:
                            answer = 'N'
                    elif op == '=':
                        if num == guess:
                            answer = 'Y'
                        else:
                            answer = 'K'

                    packer2 = ('c')
                    packedAnswer = packer2.pack(answer.encode[0])
                    sock.sendall(packedAnswer)

                    if answer == 'Y':
                        gameOver = True
                    
                    if gameOver:
                        sock.sendall(packer2.pack('V'.encode()))
                        input.remove(sock)
                        sock.close()
                
                else:
                    input.remove(sock)
                    sock.close()
                    

    except KeyboardInterrupt:
        print("closing")
        for s in input:
            s.close()
        input = []