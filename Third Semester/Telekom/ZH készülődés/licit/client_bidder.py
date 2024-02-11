import socket, struct, json, sys, random, time
packer = struct.Struct('3s I')
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(('localhost', 10000))
if (len(sys.argv) > 1):
    with open(sys.argv[1]) as f:
        bids = json.load(f)
        bids = bids['bids']
else:
    bids = [random.randint(10000, 25000)]
    while (bids[-1] < 1000000):
        bids.append(min(random.randint(bids[-1] + 1, bids[-1] + 250000), 1000000))
while len(bids) > 0:
    try:
        client.sendall(packer.pack('BID'.encode(), bids.pop(0)))
        data = client.recv(packer.size)
        data = packer.unpack(data)
        print(data[0].decode(), data[1])
        if data[1] == 1000000:
            break
        time.sleep(random.randint(1, 3))
    except socket.timeout:
        pass
    except KeyboardInterrupt:
        client.close()