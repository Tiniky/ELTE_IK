from socket import socket, AF_INET, SOCK_STREAM
import sys
import struct
import random

breakLength = random.randint(1,5)
breakStart = random.randint(21, 31-breakLength)

server_address = ("localhost", 10007)
proxy_address = ("localhost", 10006)

packer = struct.Struct('I I')

with socket(AF_INET, SOCK_STREAM) as server, socket(AF_INET, SOCK_STREAM) as proxy:
    server.connect(server_address)
    proxy.connect(proxy_address)

    packed_data = packer.pack(breakStart, breakLength)
    server.send(packed_data)

    server.close()