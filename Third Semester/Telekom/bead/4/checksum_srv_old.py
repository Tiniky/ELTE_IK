from socket import socket, AF_INET, SOCK_STREAM
from sys import argv, exit
from datetime import datetime, timedelta
import zlib, select, struct

# Create a TCP/IP socket
server = socket(AF_INET,SOCK_STREAM)

# Bind the socket to the port
#server_addr = ('localhost', 10000)
server_addr = (argv[1],int(argv[2]))
server.bind(server_addr)

# Listen for incoming connections
n = 3
server.listen(n)

# Variables
inputs = [server]
message = []

# Connections handling
while True:
    try:
        timeout = 1
        r, w, e = select.select(inputs,inputs,inputs,timeout)
        if not (r or w or e):
            continue
        for sock in r:
            if sock is server:
                client, client_addr = sock.accept()
                inputs.append(client)
            else:
                data = sock.recv(100)
                if data:
                    message = str(data, 'utf-8').split('|')
                    #message[0] be vagy ki, message[1] az id
                    if message[0] == 'BE':
                        time = int(message[2])
                        crc_len = int(message[3])
                        crc = message[4]
                        d_time = datetime.now()
                        sock.send(b'OK')

                    elif message[0] == 'KI':
                        if crc_len != 0:
                            if datetime.now() - d_time < timedelta(seconds=time):
                                message = str(crc_len) + '|' + crc
                            else:
                                message = '0|'
                        else:
                            message = '0|'
                        sock.sendall(message.encode('utf-8'))
                else:
                    inputs.remove(sock)
                    sock.close()
                        
    except KeyboardInterrupt:
        print("Close the system")
        for s in inputs:
            s.close()
        inputs = []
        