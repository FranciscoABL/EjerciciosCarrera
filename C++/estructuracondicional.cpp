//Barraza Lugo Francisco 
#include <iostream>
#include <string.h>

using namespace std;
struct Corredor{
  char nombre[20];
  int edad;
  char sexo[10];
  char club[20];
}c1;
int main() {
    char categoria[30];
        cout<<"Dame el nombre del corredor "<<endl;
        cin.getline(c1.nombre,20,'\n');
        cout<<"Dame la edad del corredor "<<endl;
        cin>>c1.edad;
        cout<<"Dame el sexo del corredor  "<<endl;
        cin>>c1.sexo;
        cout<<"Dame el club  "<<endl;
        cin>>c1.club;
        cout<<"\n";
        
        if(c1.edad<=18){
            strcpy(categoria,"Juvenil");
        }else if(c1.edad<=40){
            strcpy(categoria,"Senior");
        }else{
            strcpy(categoria,"Veterano");
        }
        cout<<"Nombre:"<<c1.nombre<<endl;
        cout<<"Edad:"<<c1.edad<<endl;
        cout<<"Sexo:"<<c1.sexo<<endl;
        cout<<"Club:"<<c1.club<<endl;
        cout<<"categoria:"<<categoria<<endl;
   return 0;
}

