import re

f = open("macros.v", "r")
w = open("temp.txt", "w")

while(f.readable()):
    l = f.readline()
    if(l.find("define")!=-1):
        t = re.match("")
