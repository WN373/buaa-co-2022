# -*- coding: utf-8 -*-

import time
import random


f = open("out.asm", "wt")

li = [7,8,9,10]
def rc(l):
    # assert l in list
    return random.choice(l)

def couples(l):
    # assert l.instaceof(list)
    if(random.randint(0,1) == 1):
        if(random.randint(0,1) == 1):
            f.write("add ${}, ${}, ${}\n".format(rc(l), rc(l), rc(l)))
        else:
            f.write("lui ${}, {}\n".format(rc(l), random.randint(1,1000)))
    else:
        if(random.randint(0,1) == 1):
            f.write("ori ${}, ${}, {}\n".format(rc(l), rc(l), random.randint(1,1000)))
        else:
            f.write("sub ${}, ${}, ${}\n".format(rc(l), rc(l), rc(l)))


    
for i in range(499):
    # li.append(i)
    couples(li)



