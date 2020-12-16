#include <iostream>
using namespace std;
//1-2+3-4+5 
int main()
{
    int numero,signo=1,suma=0;
    std::cout << "Ingresa el numero  " << std::endl;
    cin>>numero;
    for(int i=1;i<=numero;i++){
     suma+=i*signo;
     signo*=-1;
    }
    cout<<"Suma -->"<<suma<<endl;
    return 0;	
}