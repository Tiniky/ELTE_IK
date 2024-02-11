from socket import socket, AF_INET, SOCK_STREAM
import sys
import struct
#import json

server_address = (sys.argv, int(sys.argv))
proxy_address = (sys.argv, int(sys.argv))

packer = struct.Struct('')

with socket(AF_INET, SOCK_STREAM) as server, socket(AF_INET, SOCK_STREAM) as proxy:
    server.connect(proxy_address)   #or fordítva idk
    proxy.connect(server_address)

    with open(sys.argv, 'rb') as f:
        data = f.read(100)

    while data:
        server.send(data)
        data = f.read(100)

    #dolgok

    server.close()
    proxy.sendall()

    data = proxy.recv(100)
    print(data)
