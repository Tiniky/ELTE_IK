import struct

with open('db1.bin', 'wb') as F:
    packed_data = struct.pack('f?c', 10.27, True, b'T')
    F.write(packed_data)

with open('db1.bin', 'rb') as F:
    unpacked_data = struct.unpack('f?c', F)
    print(unpacked_data)