import random, socket, struct, select
packer = struct.Struct('I I')
server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server.bind(('localhost', 1001))
server.settimeout(1)
sockets = [server]
while True:
    try:
        data, address = server.recvfrom(32)
        if data:
            data = data.decode()
            if data == 'ELEGENDO':
                print('ELEGENDO')
                server.sendto('IGEN'.encode() if random.randint(0, 1) == 1 else 'NEM'.encode(), address)
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        server.close()