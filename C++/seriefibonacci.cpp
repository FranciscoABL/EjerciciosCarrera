//Serie Fibonacci 
#include <iostream>
using namespace std;
int main()
{
    int numero,x=0,y=1,z=1;
    std::cout << "Ingresa el numero para la serie " << std::endl;
    cin>>numero;
    cout<<"1";
    for(int i=1;i<=numero;i++){
        z=x+y;
        cout<<" "<<z;
        x=y;
        y=z;
    }
    return 0;	
}