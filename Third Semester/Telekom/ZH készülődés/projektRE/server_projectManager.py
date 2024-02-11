from socket import socket, AF_INET, SOCK_STREAM
import sys
import struct
import select

server_address = ("localhost", 10007)
proxy_address = ("localhost", 10006)

packer = struct.Struct('I I')
packer2 = struct.Struct('8s')
packer3 = struct.Struct('I')

available = {}
if(len(sys.argv) == 1 or (len(sys.argv) - 1) % 2 == 1):
    print("A parancssori argumentumok száma nem jó!")
    sys.exit(1)
else:
    for i in range(1, len(sys.argv), 2):
        if i%2 == 1:
            day = int(sys.argv[i])
            count = int(sys.argv[i+1])
            if day < 21 or day > 31:
                print("Érvénytelen nap! ({})".format(day))
                sys.exit(1)
            elif count < 5:
                print("Érvénytelen szám! ({})".format(count))
                sys.exit(1)
            available[day] = count

with socket(AF_INET, SOCK_STREAM) as proxy, socket(AF_INET,SOCK_STREAM) as server:
    server.bind(server_address)
    server.listen(1)

    proxy.connect(proxy_address)

    inputs = [server]

    while True:
        try:
            r, w, e = select.select(inputs, inputs, inputs, 1)

            if not (r or w or e):
                continue

            for sock in r:
                if sock is server:
                    client, client_address = sock.accept()
                    inputs.append(client)

                else:
                    data = sock.recv(100)
                    if not data:
                        inputs.remove(sock)
                        sock.close()

                    else:
                        data = packer.unpack(data)

                        allGood = True
                        for i in range(data[0], data[0] + data[1]):
                            if available[i]-1 < 5:
                                allGood = False
                                break
                        
                        if allGood:
                            answer = packer2.pack("ELEGENDO".encode())
                            proxy.sendall(answer)

                            answerRE = proxy.recv(100)
                            answerRE = packer3.unpack(answerRE)
                            if(answerRE[0] == 1):
                                print("ELFOGAD")
                                for i in range(data[0], data[0] + data[1]):
                                    available[i] -= 1
                            else:
                                print("ELUTASIT")
                        else:
                            print("ELUTASIT")

        except KeyboardInterrupt:
            print("System closing...")
            for input in inputs:
                input.close()
            inputs = []
            print("DONE")
            sys.exit()