#include<iostream>
#include<cstring>
#include<algorithm>
// #include<bits/stdc++.h>
using namespace std;

typedef unsigned int UI;

unsigned a[3][3],s[3][3];
unsigned b[3][3];


void mul1(){
    memset(b,0,sizeof(b));
    for(unsigned i=1;i<=2;i++)
        for(unsigned j=1;j<=2;j++)
            for(unsigned k=1;k<=2;k++)
                b[i][j]+=s[i][k]*a[k][j];
    memcpy(s,b,sizeof(b));    
   
}
void mul2(){
    memset(b,0,sizeof(b));
    for(unsigned i=1;i<=2;i++)
        for(unsigned j=1;j<=2;j++)
            for(unsigned k=1;k<=2;k++)
                b[i][j]+=a[i][k]*a[k][j];
    memcpy(a,b,sizeof(b));    
}
void print(unsigned n){
    for(unsigned i=31;i>=24;i--) printf("%u",n>>i&1);   printf("\n");
    for(unsigned i=23;i>=16;i--) printf("%u",n>>i&1);   printf("\n");
    for(int i=15;i>=8;i--) printf("%u",n>>i&1);  printf("\n");
    for(int i=7;i>=0;i--) printf("%u",n>>i&1);  printf("\n");
    
}
void qpow(unsigned n){
    while(n){
        
        if(n&1) mul1();
        n>>=1; mul2();print(s[1][2]); printf("\n");
    }
}


int main(int argc,char *argv[])
{
    unsigned n;
    n=0x80000000;
    
    print(n);
   
    s[1][1]=s[0][0]=1;
    a[1][1]=a[1][2]=a[2][1]=1;
    qpow(n);
    
    printf("\n%u\n",s[1][2]);
    print(s[1][2]);
    system("pause");
    
    return 0;
}

