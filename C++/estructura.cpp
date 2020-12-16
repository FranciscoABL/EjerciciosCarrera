//Barraza Lugo Francisco 
#include <iostream>

using namespace std;
struct persona{
  char nombre[20];
  int edad;
}
persona1,persona2;
int main()
{
   cout<<"Dame el nombre de la persona 1 "<<endl;
   cin.getline(persona1.nombre,20,'\n');
   cout<<"Dame la edad de la persona 1 "<<endl;
   cin>>persona1.edad;
   cout<<"Datos"<<endl;
   cout<<"Nombre:"<<persona1.nombre<<endl;
   cout<<"Edad:"<<persona1.edad<<endl;
   return 0;
}
