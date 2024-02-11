from random import randint
from socket import socket, AF_INET, SOCK_DGRAM, SOCK_STREAM,SOL_SOCKET,SO_REUSEADDR,timeout
import select,sys,struct

# Create a TCP/IP socket
server = socket(AF_INET,SOCK_STREAM)

# Bind the socket to the port
hostname = sys.argv[1]
port = int(sys.argv[2])
#server_addr = ('localhost', 10000)
server_addr = (hostname,port)
server.bind(server_addr)

# Listen for incoming connections
n = 3
server.listen(n)

# Variables
#rnumber = randint(1, 100)
rnumber = 50
inputs = [server]
end = False
answer = ""
#act_n = 1

print("The number :{}".format(rnumber))

# Answer handling
def getAnswer(operator, number):
    if operator == '>':
        if rnumber > number:
            answer = 'I'
        else:
            answer = 'N'
    elif operator == '<':
        if rnumber < number:
            answer = 'I'
        else:
            answer = 'N'
    elif operator == '=':
        if rnumber == number:
            answer = 'Y'
        else:
            answer = 'K'
    return answer

# The endings  
def sendEnd(sock):
    values2 = ('V'.encode('utf-8'), 27)
    sock.sendall(packer.pack(*values2))
    #print(str(sock.getpeername()) + ' is gone')
    inputs.remove(sock)
    sock.close()

# Connections handling
#while not end:
while True:
    try:
        timeout = 1
        r, w, e = select.select(inputs,inputs,inputs,timeout)
        if not (r or w or e):
            continue
        for sock in r:
            if sock is server:
                #print("Client is arrived")
                client, client_addr = sock.accept()
                inputs.append(client)
            else:
                data = sock.recv(100)
                if data:
                    if end:
                        #act_n += 1
                        sendEnd(sock)
                    else:
                        packer = struct.Struct('ci')
                        unpacked_data = packer.unpack(data)
                        answer = getAnswer(unpacked_data[0].decode('utf-8'), unpacked_data[1])
                        values1 = (answer.encode('utf-8'), 27)
                        p_answer = packer.pack(*values1)
                        sock.sendall(p_answer)
                        if answer == 'Y' and end == False:
                            #print(str(sock.getpeername()) + " won!")
                            end = True
                        if end or answer == 'K':
                            #act_n += 1
                            sendEnd(sock)
                else:
                    print(str(sock.getpeername()) + ' quited!')
                    inputs.remove(sock)
                    sock.close()
                        
    except KeyboardInterrupt:
        print("Close the system")
        for s in inputs:
            s.close()
        inputs = []