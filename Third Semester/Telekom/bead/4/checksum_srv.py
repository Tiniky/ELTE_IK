from socket import socket, AF_INET, SOCK_STREAM
import sys
import datetime
import zlib
import select
import struct

chsum_address = (sys.argv[1], int(sys.argv[2]))

with socket(AF_INET, SOCK_STREAM) as checkSum:
    checkSum.bind(chsum_address)
    checkSum.listen(1)

    inputs = [checkSum]
    message = []

    while True:
        try:
            r, w, e = select.select(inputs, inputs, inputs, 1)

            if not (r or w or e):
                continue

            for sock in r:
                if sock is checkSum:
                    client, client_address = sock.accept()
                    inputs.append(client)

                else:
                    data = sock.recv(100)
                    if data:
                        message = str(data, 'utf-8').split('|')
                        if message[0] == "BE":
                            time = int(message[2])
                            len = int(message[3])
                            crc = message[4]
                            msgTime = datetime.datetime.now()
                            sock.send('OK'.encode())
                        
                        elif message[0] == "KI":
                            if len != 0 and datetime.datetime.now() - msgTime < datetime.timedelta(seconds=time):
                                message = str(len) + '|' + crc

                            else:
                                message = '0|'
                            sock.sendall(message.encode())
                    
                    else:
                        inputs.remove(sock)
                        sock.close()

        except KeyboardInterrupt:
            print("System closing...")
            for input in inputs:
                input.close()
            inputs = []
            print("DONE")
            sys.exit()