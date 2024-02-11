from socket import socket, AF_INET, SOCK_STREAM
import sys
import struct
import json
import select

server_address = ("localhost", 10010)
proxy_address = ("localhost", 10011)

client_packer = struct.Struct('5s c')
server_packer = struct.Struct('? 50s')

tartalom = {
    "1" : "Nagyon izgalmas könyv tartalma",
    "2" : "Ajándék",
    "3" : "Népszámlálási adatok"
}

with socket(AF_INET, SOCK_STREAM) as proxy, socket(AF_INET,SOCK_STREAM) as server:
    server.bind(server_address)
    server.listen(1)

    proxy.connect(proxy_address)

    client, client_address = server.accept()
    data = client.recv(100)
        
    with open(sys.argv[1]) as f:
        privs = json.load(f)
    
    inputs = [server]

    while True:
        try:
            r, w, e = select.select(inputs, inputs, inputs, 1)

            if not (r or w or e):
                continue

            for sock in r:
                if sock is proxy:
                    client, client_address = sock.accept()
                    inputs.append(client)

                else:
                    data = sock.recv(100)
                    if not data:
                        inputs.remove(sock)
                        sock.close()

                    else:
                        data = client_packer.unpack(data)

                        if(data[1] in privs):
                            for elem in privs[data[1]]:
                                if elem == data[0].decode():
                                    so = True
                                    answer = "Hozzáférés engedélyezése"
                                else:
                                    so = False
                                    answer = "Hozzéférés megtagadva"
                        else:
                            so = False
                            answer = "Hozzéférés megtagadva"
                        answer = server_packer.pack(so, answer.encode())
                        client.send(answer)
        except KeyboardInterrupt:
            print("System closing...")
            for input in inputs:
                input.close()
            inputs = []
            print("DONE")
            sys.exit()