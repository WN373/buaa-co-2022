#include <bits/stdc++.h>
using namespace std;

char s[10086];
int cnt = 0;
int main()
{
    //system("java -jar D:\\Mars\\Mars.jar a db mc CompactDataAtZero dump 0x00004180-0x00004ffc HexText handler.txt test.asm > log.txt"); //导出中断处理程序
    //system("java -jar D:\\Mars\\Mars.jar a db mc CompactDataAtZero dump 0x00004180-0x00004ffc HexText E:\\Program\\CO\\P7\\P7_simulation\\handler.txt test.asm > log.txt"); //导出中断处理程序
    do
    {
        system("data.exe");
        system("java -jar D:\\Mars\\Mars.jar lg ex db mc CompactDataAtZero nc test.asm > m.out");  
        system("java -jar D:\\Mars\\Mars.jar mc CompactDataAtZero a dump 0x00003000-0x00003ffc HexText code.txt test.asm > log.txt");
        //system("java -jar D:\\Mars\\Mars.jar mc CompactDataAtZero a dump 0x00003000-0x00003ffc HexText E:\\Program\\CO\\P7\\P7_simulation\\code.txt test.asm > log.txt");
        system("iverilog -o tb.out -y E:\\Program\\CO\\P7\\P7_code E:\\Program\\CO\\P7\\P7_code\\mips_tb.v");
        system("vvp tb.out > v.out");
        system("format.exe");
        system("fc v.out m.out > log.txt");
        freopen("log.txt", "r", stdin);
        gets(s), gets(s);
        printf("test%d:", ++cnt);
        if (s[0] != 'F')
        {
            puts("Wrong Answer!");
            break;
        }
        puts("Accepted!");
        
    }while(1);

    system("pause");
    return 0;
}