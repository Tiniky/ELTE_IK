import struct

packer1 = struct.Struct('f?c')
packer2 = struct.Struct('c9si')
packer3 = struct.Struct('i?f')
packer4 = struct.Struct('cf9s')


with open('db1.bin', 'wb') as F:
    values = (10.27, True, 'T'.encode())
    packed_data = packer1.pack(*values)
    F.write(packed_data)

with open('db1.bin', 'rb') as F:
    data = F.read(packer1.size)
    print(packer1.unpack(data))


with open('db2.bin', 'wb') as F:
    values = ('N'.encode(), 'yareyaree'.encode(), 2002)
    packed_data = packer2.pack(*values)
    F.write(packed_data)

with open('db2.bin', 'rb') as F:
    data = F.read(packer2.size)
    print(packer2.unpack(data))


with open('db3.bin', 'wb') as F:
    values = (2002, False, 4.39)
    packed_data = packer3.pack(*values)
    F.write(packed_data)

with open('db3.bin', 'rb') as F:
    data = F.read(packer3.size)
    print(packer3.unpack(data))


with open('db4.bin', 'wb') as F:
    values = ('x'.encode(), 0.1234, 'asdasdasd'.encode())
    packed_data = packer4.pack(*values)
    F.write(packed_data)

with open('db4.bin', 'rb') as F:
    data = F.read(packer4.size)
    print(packer4.unpack(data))
