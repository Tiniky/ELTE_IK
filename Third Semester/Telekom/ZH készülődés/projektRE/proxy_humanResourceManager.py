from socket import socket, AF_INET, SOCK_STREAM
import sys
import select
import struct
import random

proxy_address = ("localhost", 10006)

packer = struct.Struct('I')

with socket(AF_INET, SOCK_STREAM) as proxy:
    proxy.bind(proxy_address)
    proxy.listen(1)

    server, _ = proxy.accept()
    data = server.recv(100)

    if data:
        letGo = random.randint(0,1)
        letGo = packer.pack(letGo)

        server.sendall(letGo)

    server.close()