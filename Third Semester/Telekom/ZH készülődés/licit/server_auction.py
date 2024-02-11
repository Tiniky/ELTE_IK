import sys, select, socket, struct

price = 0
packer = struct.Struct('3s I')
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('localhost', 10000))
server.listen(1)
server.settimeout(1)
log = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sockets = [server]
while True:
    try:
        rlist, _, _ = select.select(sockets, [], [], 1)
        if not rlist:
            continue
        for sock in rlist:
            if sock is server:
                client, _ = sock.accept()
                client.setblocking(0)
                sockets.append(client)
            else:
                data = sock.recv(packer.size)
                if not data:
                    sock.close()
                    sockets.remove(sock)
                else:
                    data = packer.unpack(data)
                    if data[1] > price:
                        price = data[1]
                        log.sendto(str(data[1]).encode(), ('localhost', 1001))
                        sock.sendall(packer.pack('OK'.encode(), price))
                    else:
                        sock.sendall(packer.pack('LOW'.encode(), price))
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        server.close()