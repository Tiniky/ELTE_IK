import struct
import sys

#Feladat1
packer1 = struct.Struct('f?c')
packer2 = struct.Struct('c9si')
packer3 = struct.Struct('i?f')
packer4 = struct.Struct('cf9s')

with open(sys.argv[1], 'rb') as F:
    data1 = F.read(packer1.size)
    print(packer1.unpack(data1))

with open(sys.argv[2], 'rb') as F:
    data2 = F.read(packer2.size)
    print(packer2.unpack(data2))

with open(sys.argv[3], 'rb') as F:
    data3 = F.read(packer3.size)
    print(packer3.unpack(data3))

with open(sys.argv[4], 'rb') as F:
    data4 = F.read(packer4.size)
    print(packer4.unpack(data4))

#Feladat2
packer5 = struct.Struct('10si?')
values1 = ("elso".encode(), 68, True)
packed_data1 = packer5.pack(*values1)
print(packed_data1)

packer6 = struct.Struct('f?c')
values2 = (71.5, False, 'X'.encode())
packed_data2 = packer6.pack(*values2)
print(packed_data2)

packer7 = struct.Struct('i8sf')
values3 = (59, "masodik".encode(), 78.9)
packed_data3 = packer7.pack(*values3)
print(packed_data3)

packer8 = struct.Struct('ci11s')
values4 = ('Z'.encode(), 90, "harmadik".encode())
packed_data4 = packer8.pack(*values4)
print(packed_data4)