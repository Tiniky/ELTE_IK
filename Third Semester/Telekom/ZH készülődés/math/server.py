import select, socket, struct

def f(x):
    return 3 * x + 4

def g(x):
    return 2 ** x - 1

client_packer = struct.Struct('c i')  # klienstől érkező adatok
server_packer = struct.Struct('4s i') # kliensnek küldött adatok

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('localhost', 1000))
server.listen(1)
server.settimeout(1)

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
                data = sock.recv(client_packer.size)
                if not data:
                    sock.close()
                    sockets.remove(sock)
                else:
                    data = client_packer.unpack(data)
                    print(data[0].decode(), data[1]) #debug
                    if data[1] < 0 or data[1] > 30:
                        print('HIBA', 0) #debug
                        sock.sendall(server_packer.pack('HIBA'.encode(), 0))
                    else:
                        if data[0] == b'f':
                            print('OK', f(data[1])) #debug
                            sock.sendall(server_packer.pack('OK'.encode(), f(data[1])))
                        else:
                            print('OK', g(data[1])) #debug
                            sock.sendall(server_packer.pack('OK'.encode(), g(data[1])))
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        server.close()