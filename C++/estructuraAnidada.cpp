//Barraza Lugo Francisco 
#include <iostream>
#include <stdio.h>

using namespace std;
struct direccion{
  char direccion[30];
  char ciudad[20];
  char provincia[20];
};
struct empleado{
    char nombre[20];
    struct direccion dirEmpleado;
    double salario;
}empleado[2];
int main() {
    
   for(int i=0;i<2;i++)
   {
        fflush(stdin);
        cout<<"Dame el nombre del empleado "<<i+1<<endl;
        cin.getline(empleado[i].nombre,20,'\n');
        cout<<"Dame la direccion del empleado  "<<i+1<<endl;
        cin.getline(empleado[i].dirEmpleado.direccion,30,'\n');
        cout<<"Dame la ciudad del empleado  "<<i+1<<endl;
        cin.getline(empleado[i].dirEmpleado.ciudad,20,'\n');
        cout<<"Dame la provincia del empleado  "<<i+1<<endl;
        cin.getline(empleado[i].dirEmpleado.provincia,20,'\n');
        cout<<"Dame el salario del empleado  "<<i+1<<endl;
        cin>>empleado[i].salario;
        cout<<"\n";
   }
   for(int i=0;i<2;i++)
   {
        cout<<"Empleado-->"<<i+1<<endl,
        cout<<"Nombre:"<<empleado[i].nombre<<endl;
        cout<<"Direccion:"<<empleado[i].dirEmpleado.direccion<<endl;
        cout<<"Ciudad:"<<empleado[i].dirEmpleado.ciudad<<endl;
        cout<<"Provincia:"<<empleado[i].dirEmpleado.provincia<<endl;
        cout<<"Salario:"<<empleado[i].salario<<endl;
        cout<<"\n";
   }
    return 0;
}
