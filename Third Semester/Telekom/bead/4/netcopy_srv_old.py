from socket import socket, AF_INET, SOCK_STREAM
from sys import argv, exit
import zlib


# Create a TCP/IP socket
server = socket(AF_INET,SOCK_STREAM)
proxy = socket(AF_INET, SOCK_STREAM)

# Bind the socket to the port
server.bind((argv[1], int(argv[2])))
#server.bind((localhost, 10000))
server.listen(3)

# Arrived client
client, client_addr = server.accept()

# Open file
f = open(argv[6], "w+b")
#f = open("proba.txt", "w+b")

# Variables
data = client.recv(100)
crc = 0

# Client handling
while data: 
    f.write(data)
    crc = zlib.crc32(data, crc)
    data = client.recv(100)
crc = str(crc)
client.close()

# Proxy handling
proxy.connect((argv[3], int(argv[4])))
#proxy.connect((localhost, 10001))
message = 'KI|' + argv[5]
#message = 'KI|' + '01'
proxy.sendall(message.encode('utf-8'))
data = proxy.recv(100)

message = str(data, 'utf-8').split('|')
if int(message[0]) == 0 and message[1] != crc:
	print('CSUM CORRUPTED')
else:
	print('CSUM OK')
