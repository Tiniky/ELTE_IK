from socket import socket, AF_INET, SOCK_DGRAM, timeout
import struct
import time
import sys
from random import randint
import time

serverIp = sys.argv[1]
serverPort = sys.argv[2]

packer = struct.Struct('7s I')

with socket(AF_INET, SOCK_DGRAM) as client:
    server_addr = (str(serverIp), int(serverPort))

    while True:
        # Szállító címet kér
        packed_data = packer.pack("HOVA".encode(), 0)
        client.sendto(packed_data, server_addr)

        # Szállító választ kap
        data, server = client.recvfrom(packer.size)
        unpacked_data = packer.unpack(data)
        print("Received:", unpacked_data, "From:", server)
        uzenet = unpacked_data[0].decode().strip("\x00")
        if uzenet == "SEHOVA":
            # nincs cím
            print("Nincs több cím")
            break
        # Várakozó idő
        ido = randint(1, 10)
        print("Ido:", str(ido))
        #time.sleep(ido)
        packed_data = packer.pack("KESZ".encode(), ido)
        client.sendto(packed_data, server_addr)

        # Szállító várja a nyugtázást kap
        data, server = client.recvfrom(packer.size)
        unpacked_data = packer.unpack(data)
        print("Received:", unpacked_data, "From:", server)
        uzenet = unpacked_data[0].decode().strip("\x00")
        if uzenet == "KIRUGVA":
            print("Ki lettem rugva")
            break