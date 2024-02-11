import select, socket, struct, sys, random

medicine = dict()
if (len(sys.argv) > 1):
    for i in range(1, len(sys.argv), 2):
        medicine[sys.argv[i][0:16]] = sys.argv[i+1][0:16] # [0:16] jelentése: a szövegből legfeljebb 16 karakter maradjon meg
else:
    medicine['adhd'] = 'ritalin'
    medicine['depression'] = 'seroxat'
    medicine['hereserv'] = 'tanga'
    medicine['0123456789abcdef'] = '0123456789abcdef'
print(medicine)

client_packer = struct.Struct('16s')
server_packer = struct.Struct('16s i')

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
                    data = data.decode()
                    print("'{}'".format(data)) #debug
                    if data in medicine:
                        sock.sendall(server_packer.pack(medicine[data][1].encode(), random.randint(1, 3)))
                    else:
                        sock.sendall(server_packer.pack('NINCS'.encode(), 0))
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        server.close()