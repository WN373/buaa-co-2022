from random import *

class mips:
    def __init__(self, source = list(range(0,32))):
        super(self)
        self.reg_list = source
        self.add_like = ["addu", "subu", "or", "and", "slt", "sltu"]
        self.lui_like = ["lui"]
        self.ori_like = ["addi", "andi", "ori"]
        self.lw_like = ["lb", "lh", "lw", "sb", "sh", "sw"]
        self.j_like = ["j", "jal"]
        self.jr_like = ["jr"]

    def rc(self):
        return choice(self.reg_list)

    def ri(self):
        return randint(-100,100)*4

    def add(self, str):
        return "{} ${}, ${}, ${}".format(str, self.rc(), self.rc(), self.rc())

    def ori (self, str, imm):
        return "{} ${}, ${}, {}".format(str, self.rc(), self.rc(), imm)

    def lw(self, str):
        return "{} ${}, {}(${})".format(str, self.rc(), self.ri(), self.rc())
    
    def j(self, str):
        return "{} {}".format(str, self.ri())

    def jr(self, str):
        return "{} ${}".format(str, self.rc())

    def lui(self, str, imm):
        return "{} ${}, {}".format(str, self.rc(), imm)
    
    def build(self, f):
        

