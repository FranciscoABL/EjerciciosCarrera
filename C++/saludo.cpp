#include <iostream>
#include <string.h>
using namespace std;
int main()
{
    char nombre[]="Hola que tal";
    char nombre2[10];
    char nuevo[30];
    cout<<"Dime tu nombre"<<endl;
    cin>>nombre2;
    strcpy(nuevo,nombre);
    strcat(nuevo,nombre2);
    cout<<nuevo<<endl;
    return 0;
}
