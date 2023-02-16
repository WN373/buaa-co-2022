#include <bits/stdc++.h>
#define maxn 100086
using namespace std;
vector<string> v, w;
char s[maxn];
int main()
{
    freopen("v.out", "r", stdin);
    gets(s); gets(s);
    while (gets(s) != NULL)
    {
        //string S = s;
        v.push_back(s+20);
    }
    freopen("v.out", "w", stdout);

    for(int i=0;i<v.size()-1;i++){
        string a,b;
        a=v[i].substr(1,8);
        b=v[i+1].substr(1,8);
        if(a>="00003000"&&a<="00003ffc"&&b>="00003000"&&b<="00003ffc"&&a>=b){
            swap(v[i],v[i+1]);
            i++;
        }
        if(a>="00004100"&&a<="000041fc"&&b>="00004100"&&b<="000041fc"&&a>=b){
            swap(v[i],v[i+1]);
            i++;
        }
        if(a>="00004200"&&a<="000042fc"&&b>="00004200"&&b<="000042fc"&&a>=b){
            swap(v[i],v[i+1]);
            i++;
        }
    }

    //sort(v.begin(), v.end());

    for (int i = 0; i < v.size(); i++)
        printf("%s\n", v[i].c_str());

    printf("\n");
    //system("pause");
    //getchar();
    return 0;
}
