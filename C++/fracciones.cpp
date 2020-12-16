//Barraza Lugo Francisco
//Programa que devuelve la parte fraccionaria
#include <iostream>

using namespace std;
    void preg();
    void dev(float x, int y);

    float x;
    int y;
    float res;
    int main(){
 
        preg();
        dev(x,y);
  
        return 0;
    }
    void preg(){
        cout<<"Ingrese el numero: ";
        cin>>x;
        y=x;
    }
    void dev(float x, int y){
        res=x-y;
        cout<<"el decimal es: "<<res;
    }
