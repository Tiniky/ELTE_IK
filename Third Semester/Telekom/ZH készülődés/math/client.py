import socket, struct, sys, json, random, time

client_packer = struct.Struct('c i')  # szervernek küldött adatok
server_packer = struct.Struct('4s i') # szervertől érkező adatok

client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('localhost', 1000))

if (len(sys.argv) > 1):
    with open(sys.argv[1]) as f:
        numbers = json.load(f)
else:
    numbers = [ 
        ['f', 3],
        ['g', 9],
        ['f', 25],
        ['g', 31],
        ['f', -5]
    ]

for number in numbers:
    try:
        client.sendall(client_packer.pack(number[0].encode(), number[1]))
        data = client.recv(server_packer.size)
        data = server_packer.unpack(data)
        print(data[0].decode(), data[1])
        time.sleep(random.randint(1, 3))
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        client.close()