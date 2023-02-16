f = open("code.txt","r")
g = open("code_handler.txt","r")
o = open("newcode.txt","w")

c = 0
while(1):
    s = f.readline()
    if not s:
        break
    o.write(s)
    c += 1

while(c < 1120):
    o.write("00000000\n")
    c += 1

while(g.readable()):
    s = g.readline()
    if not s:
        break
    o.write(s)