from socket import socket, AF_INET, SOCK_STREAM
import sys
import struct

server_address = ("localhost", 10010)
proxy_address = ("localhost", 10011)

client_packer = struct.Struct('5s c I f')
server_packer = struct.Struct('? 50s')
proxy_packer = struct.Struct('I f')

name = sys.argv[1]

with socket(AF_INET, SOCK_STREAM) as server, socket(AF_INET, SOCK_STREAM) as proxy:
    server.connect(server_address)
    proxy.connect(proxy_address)

    proxy.send(name.encode())
    data = proxy.recv(100)
    data = proxy_packer.unpack(data)
    check = data[0]
    time = data[1]

    requestDB = 0

    while requestDB < 3:
        request = input("A keresett elem ID-ja: ")
        data = client_packer.pack(name.encode(), request, check, time)
        server.send(data)

        answer = server.recv(100)
        answer = server_packer.unpack(answer)

        if answer[0]:
            print(answer[1].decode())
        else:
            print("HIBA! {}".format(answer[1].decode()))

        requestDB += 1

    server.close()