from socket import socket, AF_INET, SOCK_DGRAM, timeout, SOL_SOCKET, SO_REUSEADDR
from random import randint
import time
import struct
import sys
from select import select

server_addr = ('localhost', 10000)
cimek = []
for i in range(1, len(sys.argv)):
    cimek.append(int(sys.argv[i]))

packer = struct.Struct('7s I')

with socket(AF_INET, SOCK_DGRAM) as server:
    server.bind(server_addr)
    server.settimeout(1.0)
    server.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)

    socketek = [ server ]

    while True:
        try:
            r,w,e = select(socketek, [], [],1)

            if not (r or w or e):
                continue

            for s in r:
                # Szállító címet kér
                data, client = s.recvfrom(packer.size)
                if data:
                    unpacked_data = packer.unpack(data)
                    print("Received:", unpacked_data, "From:", client)
                    if len(cimek) > 0:
                        # Cég címet küld
                        packed_data = packer.pack("CIM".encode(), cimek.pop())
                        s.sendto(packed_data, client)

                        # Szállító elkészült
                        data, client = s.recvfrom(packer.size)
                        unpacked_data = packer.unpack(data)
                        print("Received:", unpacked_data, "From:", client)

                        # Cég nyugtázza vagy kirúg
                        uzenet = "OK"
                        if unpacked_data[1] > 5:
                            uzenet = "KIRUGVA"
                        packed_data = packer.pack(uzenet.encode(), 0)
                        s.sendto(packed_data, client)
                    else:
                        # Nincs több cím
                        packed_data = packer.pack("SEHOVA".encode(), 0)
                        s.sendto(packed_data, client)
                else:
                    pass
        except timeout:
            pass