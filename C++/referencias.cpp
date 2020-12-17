#include <iostream>

using namespace std;
void calcular(int,int,int&,int&);
int main()
{
    int num1,num2,suma=0,producto=0;
    cout<<"Digita dos numeros"<<endl;
    cin>>num1>>num2;
    calcular(num1,num2,suma,producto);
    cout<<"Suma:"<<suma<<endl;
    cout<<"producto:"<<producto<<endl;
    return 0;
}
void calcular(int n,int n2,int& suma,int& producto){
    suma=n+n2;
    producto=n*n2;
}
