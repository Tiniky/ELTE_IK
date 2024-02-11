import sys
import json

with open(sys.argv[1], "r") as F:
	ff = json.load(F)

foglaltak = []
id = 0

i = 0
while i < ff["simulation"]["duration"]:
    
    for elem in ff["simulation"]["demands"]:
        if(elem["end-time"] == i):
            if(elem["voltMar"] == 0):
                break
            
            else:
                for f_elem in foglaltak:
                    if(elem["voltMar"] == f_elem[len(f_elem) - 1]):
                       for e in f_elem:
                            for l_elem in ff["links"]:
                                if(e == l_elem):
                                    l_elem["capacity"] += elem["demand"]
        
            id += 1
            
            print("%d. igény felszabadítás: %s<->%s st:%d" % (id, elem["end-points"][0], elem["end-points"][1], i))
                
        elif(elem["start-time"] == i):
            elem["voltMar"] = 0
            
            lehetsegesUtvonalak = []

            for ut in ff["possible-circuits"]:
                if(elem["end-points"][0] in ut and elem["end-points"][1] in ut):
                    lehetsegesUtvonalak.append(ut)
            
            for ut in lehetsegesUtvonalak:
                
                if(elem["voltMar"] > 0):
                    break

                foglalt=[]

                j = 0
                while j < len(ut) - 1:

                    for l_elem in ff["links"]:
                        if(ut[j] in l_elem["points"] and ut[j+1] in l_elem["points"] and l_elem["capacity"] >= elem["demand"]):
                            foglalt.append(l_elem)
                    
                    j += 1

                if(len(foglalt) == len(ut) - 1):
                    for e in foglalt:
                        for l_elem in ff["links"]:
                            if(e == l_elem):
                                l_elem["capacity"] -= elem["demand"]
                                
                    elem["voltMar"] = i
                    foglalt.append(i)
                    foglaltak.append(foglalt)
             
            id += 1
            sikerOrNot = {True:"- sikeres", False:"- sikertelen"}[len(foglalt) > (len(ut)-1)]

            print("%d. igény foglalás: %s<->%s st:%d %s" % (id, elem["end-points"][0], elem["end-points"][1], i, sikerOrNot))
    i += 1
    