def szokoev(ev):
	if ev % 4 == 0:
		if ev % 100 == 0:
			if ev % 400 == 0:
				return True
			else:
				return False
		else:
			return True
	else:
		return False
		
with open ('evszamok.txt') as f:
	for ev in f:
		ev = ev.strip()
		print(ev,":",szokoev(int(ev)))
        
print('\n')