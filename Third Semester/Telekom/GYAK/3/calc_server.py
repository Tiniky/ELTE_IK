import sys
import socket
import struct

server_addr = sys.argv[1]
server_port = int(sys.argv[2])

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.bind( (server_addr, server_port) )

sock.listen(1)

ops = { '+': lambda x,y: x+y, 
	'-': lambda x,y: x-y,
	'*': lambda x,y: x*y,
	'/': lambda x,y: int(x/y)}

packer = struct.Struct('i i c')
conn, addr = sock.accept()
print("Valaki csatlakozott:", addr)
while True:
    msg = conn.recv(100)
    if not msg:
        print("A kliens lezárta a kapcsolatot")
        break
    parsed_msg = packer.unpack(msg)
    print("A kliens üzenete: %d %c %d" % (parsed_msg[0], parsed_msg[2].decode(), parsed_msg[1]))
    result = ops[parsed_msg[2].decode()](parsed_msg[0], parsed_msg[1])
    msg = packer.pack(result, 0, b'R')
    conn.sendall(msg)
    print("Elküldött válasz: %d" % result)

conn.close()
sock.close()