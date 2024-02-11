import sys, select, socket, struct
available = {} # elérhető fejlesztők száma, naponként
if ((len(sys.argv) - 1) % 2 == 1):
    print("A parancssori argumentumok száma nem jó!")
    sys.exit(1)
for i in range(21, 32):
    available[i] = 10 # alapból 10 ember érhető el naponta
if (len(sys.argv) > 1):
    for i in range(1, len(sys.argv)):
        if i % 2 == 1:
            day, count = int(sys.argv[i]), int(sys.argv[i + 1])
            if day < 21 or day > 31:
                print("Érvénytelen nap! ({})".format(day))
                sys.exit(1)
            elif count < 5:
                print("Érvénytelen szám! ({})".format(count))
                sys.exit(1)
            available[day] = count
packer = struct.Struct('I I')
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(('localhost', 1000))
server.listen(1)
server.settimeout(1)
hr = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
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
                    start, length = data[0], data[1]
                    possible = True
                    for i in range(start, start + length):
                        possible = available[i] > 5 and possible
                    if possible:
                        hr.sendto('ELEGENDO'.encode(), ('localhost', 1001))
                        data = hr.recv(32)
                        data = data.decode()
                        if data == 'IGEN':
                            print('IGEN')
                            for i in range(start, start + length):
                                available[i] -= 1
                            sock.sendall(packer.pack(1, 0))
                        else:
                            print('NEM')
                            sock.sendall(packer.pack(0, 0))
                    else:
                        print('NEM')
                        sock.sendall(packer.pack(0, 0))
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        server.close()