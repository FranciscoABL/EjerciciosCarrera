#include <iostream>
using namespace std;
int main(){
    char sexo;
    int edad;
    cout<<"Dame el sexo de la persona (F)-(M)"<<endl;
    cin>>sexo;
    cout<<"Dame la edad de la persona"<<endl;
    cin>>edad;
    sexo=toupper(sexo);
    if(edad<12 && sexo=='F'){
        cout<<"Niña"<<endl;
    }else if(edad>12 &&edad<18 &&sexo=='F'){
        cout<<"Jovencita"<<endl;
    }else if(edad>18 && sexo=='F'){
        cout<<"Dama"<<endl;
    }else if(edad<12 && sexo=='M'){
        cout<<"Chamaco"<<endl;
    }else if(edad>12 &&edad<18 &&sexo=='M'){
        cout<<"Adolecente"<<endl;
    }else if(edad>18 && sexo=='M'){
        cout<<"Listo para el servico Militar"<<endl;
    }
    return 0;
}
   