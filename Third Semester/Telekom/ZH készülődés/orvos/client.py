import socket, struct, sys

client_packer = struct.Struct('16s')
server_packer = struct.Struct('16s i')

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('localhost', 1000))

illness = [ 'adhd', 'depression', 'hereserv' ]

for i in illness:
    try:
        client.sendall(client_packer.pack(i.encode()))
        data = client.recv(server_packer.size)
        data = server_packer.unpack(data)
        print(data[0].decode(), data[1])
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        client.close()