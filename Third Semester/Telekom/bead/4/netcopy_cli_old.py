from socket import socket, AF_INET, SOCK_STREAM
from sys import argv, exit
import zlib

# Create a TCP/IP socket
server = socket(AF_INET, SOCK_STREAM)
proxy = socket(AF_INET, SOCK_STREAM)

# Bind the socket to the port
server.connect((argv[1], int(argv[2])))
#server.connect((localhost, 10000))
proxy.connect((argv[3], int(argv[4])))
#proxy.connect((localhost, 10001))
# Open file
f = open(argv[6], "r+b")
#f = open("proba.txt", "rb")

# Variables
data = f.read(100)
crc = 0
# Sending to server
while data:
		server.send(data)
		crc = zlib.crc32(data, crc)
		data = f.read(100)
server.close()
# Sending to proxy
crc = str(crc)
message = ('BE|' + argv[5] + '|60|' + str(len(crc)) + '|' + crc).encode('utf-8')
#message = ('BE|' + '01' + '|60|' + str(len(crc)) + '|' + crc).encode('utf-8')
proxy.sendall(message)
data = proxy.recv(100)
print(data)