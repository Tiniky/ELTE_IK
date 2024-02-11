from socket import socket, AF_INET, SOCK_STREAM
import sys
import zlib

proxy_address = (sys.argv[1], int(sys.argv[2]))     //igazából ez a szerver
server_address = (sys.argv[3], int(sys.argv[4]))    //és ez a proxy

with socket(AF_INET, SOCK_STREAM) as proxy, socket(AF_INET,SOCK_STREAM) as server:
    server.bind(proxy_address)
    server.listen(1)

    proxy.connect(server_address)

    client, client_address = server.accept()
    data = client.recv(100)
    crc = 0

    with open(sys.argv[6], 'wb') as f:
        while data:
            f.write(data)
            crc = zlib.crc32(data, crc)
            data = client.recv(100)
        
        client.close()
        crc = str(crc)

        message = 'KI|' + sys.argv[5]
        proxy.sendall(message.encode())
        
        data = proxy.recv(100)
        message = str(data, 'utf-8').split('|')
        if int(message[0]) == 0:
            print('CSUM CORRUPTED')

        else:
            print('CSUM OK')