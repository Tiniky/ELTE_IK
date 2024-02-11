from socket import socket, AF_INET, SOCK_STREAM
import struct
import random
import time

proxy_address = ("localhost", 10011)

proxy_packer = struct.Struct('I f')

check = {}

with socket(AF_INET, SOCK_STREAM) as proxy:
    proxy.bind(proxy_address)
    proxy.listen(1)

    client, client_address = proxy.accept()
    data = proxy.recv(100)
    name = data.decode()

    num = random.randint(10000, 20000)

    if name not in check:
        tmp = time.time()
        check[name] = (num, tmp)
    else:
        tmp = check[name]

    data = proxy_packer.pack(num, tmp)
    client.send(data)