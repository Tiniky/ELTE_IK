from socket import socket, AF_INET, SOCK_STREAM
from random import randint
import sys, time, select, struct

# Create a TCP/IP socket
client = socket(AF_INET, SOCK_STREAM)

# Bind the socket to the port
hostname = sys.argv[1]
port = int(sys.argv[2])
#server_addr = ('localhost',10000)
server_addr = (hostname,port)
client.connect(server_addr)

# Variables
end = False
min = 1
max = 100
tip_num = 0
r_num = 0

# Number tips
def getTip(answer):
    global end
    global r_num
    global min
    global max
    global tip_num
    
    if answer == 'I':
        if r_num == 1:
            min = tip_num + 1
        else:
            max = tip_num - 1
    elif answer == 'N':
        if r_num == 1:
            max = tip_num
        else:
            min = tip_num
    elif answer == 'Y':
        print("I won")
    elif answer == 'K':
        print("I lost")
    elif answer == 'V':
        print("Someone else won")
    if answer == 'Y' or answer == 'K' or answer == 'V':
        end = True

# Connections handling
while not end:
    r_num = randint(0, 1)
    tip_num = int( (min + max) / 2)
    if max > min:
        if r_num == 1:
            tip=['>',tip_num]
        else:
            tip=['<',tip_num]
    else:
        tip=['=',max]

    packer = struct.Struct('ci')
    values = tip[0].encode('utf-8'), tip[1]
    print("Tip: x{}{}".format(tip[0], tip_num))
    p_tip = packer.pack(values[0],values[1])
    client.sendall(p_tip)
    
    data = client.recv(packer.size)
    unpacked_data = packer.unpack(data)
    answer = unpacked_data[0].decode('utf-8')
    getTip(answer)
    try:
        time.sleep(1)
    except:
        print("\nExit")
        sys.exit()