import sys
import json
from turtle import circle

with open(sys.argv[1], 'r') as F:
    ff = json.load(F)

foglaltak = []

n = 0
i = 1

sikerOrNot = ""

while i < ff["simulation"]["duration"]:
    
    for elem in ff["simulation"]["demands"]:
        if(elem["end-time"] == i):
            if(elem["owned"] == 0):
                break

            else:
                for f in foglaltak:
                    if(elem["owned"] == f[len(f)-1]):
                        for e in f:
                            for l in ff["links"]:
                                if(e == l):
                                    l["capacity"] += elem["demand"]

            n += 1
            sikerOrNot = {True:"- sikeres", False:"- sikertelen"}[len(foglaltak) > (len(kor)-1)]
            print("%d. igény foglalás: %s<->%s st:%d - %s" % n, elem["end-points"][0], elem["end-points"][1], i, sikerOrNot)

        elif(elem["start-time"] == i):
            elem["owned"] = 0
            
            aramkorok = []
            for kor in ff["possible-circuits"]:
                if(elem["end-points"][0] in kor and elem["end-points"][1] in kor):
                    aramkorok.append(kor)
            
            for kor in aramkorok:
                if(elem["owned"] > 0):
                    break

                foglalt = []
                for j in range(0, (len(kor)-1)):
                    for l in ff["links"]:
                        if(kor[j] in l["points"] and kor[j+1] in l["points"] and l["capacity"] >= elem["demand"]):
                            foglalt.append(l)

                if(len(foglalt) == len(kor)-1):
                    for e in foglalt:
                        for l in ff["links"]:
                            if(e == l):
                                l["capacity"] -= elem["demand"]

                    elem["owned"] = i
                    foglalt.append(i)
                    foglaltak.append(foglalt)
                
            n += 1
            sikerOrNot = {True:"- sikeres", False:"- sikertelen"}[len(foglaltak) > (len(kor)-1)]
            print("%d. igény foglalás: %s<->%s st:%d - %s" % n, elem["end-points"][0], elem["end-points"][1], i, sikerOrNot)

    i = i+1