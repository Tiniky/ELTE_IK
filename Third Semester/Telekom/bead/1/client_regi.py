import sys,json

with open(sys.argv[1], "r") as file:
	json_file = json.load(file)
   
duration=json_file["simulation"]["duration"]
demands=json_file["simulation"]["demands"]
circuits=json_file["possible-circuits"]
links=json_file["links"]

all_busy_links=[]
num=0

for d in range(1, duration+1):
    for demand in demands:
        
        if(demand["end-time"]==d):
            if(demand["owned"]==0):
                break
            else:
                for blinks in all_busy_links:
                    if(demand["owned"]==blinks[len(blinks)-1]):
                       for blink in blinks:
                            for link in links:
                                if(blink==link):
                                    link["capacity"]+=demand["demand"]
        
            num+=1
            print("%d. igény felszabadítás: %s<->%s st:%d" % 
                (num, demand["end-points"][0], demand["end-points"][1], d))
                
        elif(demand["start-time"]==d):
            demand["owned"]=0
            
            p_circuits=[circle for circle in circuits 
                if(demand["end-points"][0] in circle 
                    and demand["end-points"][1] in circle)]
            
            for circle in p_circuits:
                
                if(demand["owned"]>0):
                    break

                busy_links=[]
                for i in range(0,(len(circle)-1)):
                    for link in links:
                        if(circle[i] in link["points"] and circle[i+1] in link["points"] and link["capacity"]>=demand["demand"]):
                            busy_links.append(link)
                if(len(busy_links)==len(circle)-1):
                    for blink in busy_links:
                        for link in links:
                            if(blink==link):
                                link["capacity"]-=demand["demand"]
                                
                    demand["owned"]=d
                    busy_links.append(d)
                    all_busy_links.append(busy_links)
             
            num+=1
            print("%d. igény foglalás: %s<->%s st:%d - %s" % (num, demand["end-points"][0],
            demand["end-points"][1], d, "sikeres" if len(busy_links)>(len(circle)-1) else "sikertelen"))
    