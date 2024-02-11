from socket import socket, AF_INET, SOCK_STREAM
import sys
import struct

server_address = (sys.argv, int(sys.argv))
proxy_address = (sys.argv, int(sys.argv))

with socket(AF_INET, SOCK_STREAM) as proxy, socket(AF_INET,SOCK_STREAM) as server:
    server.bind(proxy_address)
    server.listen(1)

    proxy.connect(server_address)

    client, client_address = server.accept()
    data = client.recv(100)
        
    #dolgok

    client.close()