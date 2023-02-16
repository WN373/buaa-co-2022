#include <bits/stdc++.h>
using namespace std;
vector<int> r;
mt19937 mt(time(0));
uniform_int_distribution<int>
    u16(0, (1 << 16) - 1),
    s16(-(1 << 15), (1 << 15) - 1),
    address(0, 0x33fc),
    siz(0, 15),
    reg(0, 2),
    grf(1, 30),
    shift(0, 31),
    I(0, 24),
    J(33, 36),
    IJ(0, 27),
    one(11, 24);
int cnt, tot;
int getR()
{
    return r[reg(mt)];
}
void solve(int i)
{
    int x, X;
    int addr;
    switch (i)
    {
    case 0://lbu
        x = getR();
        addr = address(mt);
        printf("ori $%d, $0, %d\n", x, addr);
        printf("lbu $%d, %d($%d)\n", getR(), siz(mt), x);
        tot += 2;
        break;
    case 1://lb
        x = getR();
        addr = address(mt);
        printf("ori $%d, $0, %d\n", x, addr);
        printf("lb $%d, %d($%d)\n", getR(), siz(mt), x);
        tot += 2;
        break;
    case 2://lh
        x = getR();
        addr = address(mt);
        printf("ori $%d, $0, %d\n", x, addr);
        printf("lh $%d, %d($%d)\n", getR(), siz(mt) >> 1 << 1, x);
        tot += 2;
        break;
    case 3://lw
        x = getR();
        addr = address(mt);
        printf("ori $%d, $0, %d\n", x, addr);
        printf("lw $%d, %d($%d)\n", getR(), siz(mt) >> 2 << 2, x);
        tot += 2;
        break;
    case 4://sb
        x = getR();
        addr = address(mt);
        printf("ori $%d, $0, %d\n", x, addr);
        printf("sb $%d, %d($%d)\n", getR(), siz(mt), x);
        tot += 2;
        break;
    case 5://sh
        x = getR();
        addr = address(mt);
        printf("ori $%d, $0, %d\n", x, addr>>1<<1);
        printf("sh $%d, %d($%d)\n", getR(), siz(mt) >> 1 << 1, x);
        tot += 2;
        break;
    case 6://sw
        x = getR();
        addr = address(mt);
        printf("ori $%d, $0, %d\n", x, addr>>2<<2);
        printf("sw $%d, %d($%d)\n", getR(), siz(mt) >> 2 << 2, x);
        tot += 2;
        break;
    case 7://div
        x = getR();
        printf("ori $%d, $%d, 1\n", x, x);
        printf("div $%d, $%d\n", getR(), x);
        tot += 2;
        break;
    case 8://divu
        x = getR();
        printf("ori $%d, $%d, 1\n", x, x);
        printf("divu $%d, $%d\n", getR(), x);
        tot += 2;
        break;
    case 9://add
        printf("add $%d, $0, $%d\n", getR(), getR());
        tot++;
        break;
    case 10://sub
        x = getR();
        printf("sub $%d, $%d, $%d\n", getR(), getR(), getR());
        tot++;
        break;
    case 11://mult
        printf("mult $%d, $%d\n", getR(), getR());
        tot++;
        break;
    case 12://multu
        printf("multu $%d, $%d\n", getR(), getR());
        tot++;
        break;
    case 13://slt
        printf("slt $%d, $%d, $%d\n", getR(), getR(), getR());
        tot++;
        break;
    case 14://sltu
        printf("sltu $%d, $%d, $%d\n", getR(), getR(), getR());
        tot++;
        break;
    case 15://and
        printf("and $%d, $%d, $%d\n", getR(), getR(), getR());
        tot++;
        break;
    case 16://or
        printf("or $%d, $%d, $%d\n", getR(), getR(), getR());
        tot++;
        break;
    case 17://addi
        printf("addi $%d, $%d, %d\n", getR(), getR(), 0);
        tot++;
        break;
    case 18://andi
        printf("andi $%d, $%d, %d\n", getR(), getR(), u16(mt));
        tot++;
        break;
    case 19://ori
        printf("ori $%d, $%d, %d\n", getR(), getR(), u16(mt));
        tot++;
        break;
    case 20://lui
        printf("lui $%d, %d\n", getR(), u16(mt));
        tot++;
        break;
    case 21://mfhi
        printf("mfhi $%d\n", getR());
        tot++;
        break;
    case 22://mflo
        printf("mflo $%d\n", getR());
        tot++;
        break;
    case 23://mthi
        printf("mthi $%d\n", getR());
        tot++;
        break;
    case 24://mtlo
        printf("mtlo $%d\n", getR());
        tot++;
        break;
    case 25://beq
        printf("beq $%d, $%d, label%d\n", getR(), getR(), ++cnt);
        solve(I(mt));
        solve(I(mt));
        printf("label%d: ", cnt);
        solve(I(mt));
        tot++;
        break;
    case 26://bne
        printf("bne $%d, $%d, label%d\n", getR(), getR(), ++cnt);
        solve(I(mt));
        solve(I(mt));
        printf("label%d: ", cnt);
        solve(I(mt));
        tot++;
        break;
    case 27://jal jr
        printf("jal label%d\n", ++cnt);
        X = getR();
        printf("ori $%d, $0, 16\n", X);
        solve(one(mt));
        printf("label%d: add $%d, $%d, $31\n", cnt, X, X);
        printf("jr $%d\n", X);
        printf("%s\n","nop"); // solve(I(mt));\n
        tot += 4;
        break;
    }
}

char s[105];
int main()
{
    r.push_back(grf(mt)), r.push_back(grf(mt)), r.push_back(grf(mt));
    freopen("test.asm", "w", stdout);
    for(int i=2;i<=27;i++)    
        printf("ori $%d, $0, %d\n",i , u16(mt));

    printf("ori $28, $0, 0x1800\n");
    printf("ori $29, $0, 0x2ffc\n");
   
    while (tot < 900)
        solve(IJ(mt));
    
    freopen("handler.asm","r",stdin);
    while(gets(s)!=NULL) puts(s);

    //system("pause");
    return 0;
}
