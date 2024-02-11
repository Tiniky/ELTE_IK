import socket
server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server.bind(('localhost', 10001))
server.settimeout(1)
while True:
    try:
        data = server.recvfrom(32)
        if data:
            print(data.decode())
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        server.close()