from socket import socket, AF_INET, SOCK_STREAM
import sys
import select
import struct

proxy_address = (sys.argv, int(sys.argv))

with socket(AF_INET, SOCK_STREAM) as proxy:
    proxy.bind(proxy_address)
    proxy.listen(1)

    inputs = [proxy]

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
                        #dolgok
                        asd = 1

        except KeyboardInterrupt:
            print("System closing...")
            for input in inputs:
                input.close()
            inputs = []
            print("DONE")
            sys.exit()