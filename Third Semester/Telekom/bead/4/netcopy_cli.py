from socket import socket, AF_INET, SOCK_STREAM
import sys
import zlib

proxy_address = (sys.argv[1], int(sys.argv[2]))     //igazából ez a szerver
server_address = (sys.argv[3], int(sys.argv[4]))    //és ez a proxy

with socket(AF_INET, SOCK_STREAM) as proxy, socket(AF_INET,SOCK_STREAM) as server:
    server.connect(proxy_address)
    proxy.connect(server_address)

    with open(sys.argv[6], 'rb') as f:
        data = f.read(100)
        crc = 0

        while data:
            server.send(data)
            crc = zlib.crc32(data, crc)
            data = f.read(100)
        
        server.close()
        crc = str(crc)

        message = ('BE|' + sys.argv[5] + '|60|' + str(len(crc)) + '|' + crc).encode()
        
        proxy.sendall(message)
        data = proxy.recv(100)
        print(data)