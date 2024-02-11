class Hallgato:
	nev = ''
	ZHpont = 0
	
	def __init__(self,_name,_point):
		self.nev = _name
		self.ZHpont = _point
	
	def __str__(self):
		return self.nev+"("+str(self.ZHpont)+")"
	
	def __repr__(self):
		return "custom representation in list "+self.nev+"("+str(self.ZHpont)+")"
	
p = Hallgato("Ford",20)

print(p)	# Ford(20)
print([p])	# [custom representation in list Ford(20)]