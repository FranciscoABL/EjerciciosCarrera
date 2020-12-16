//Barraza Lugo Francisco 
#include <iostream>

using namespace std;
template <class T>
void convertirAbsoluto(T numero);
int main() {
    int numero=5;
    float numero2=-5.5;
    double numero3=6.256;
    convertirAbsoluto(numero);
    convertirAbsoluto(numero2);
    convertirAbsoluto(numero3);
    
    return 0;
}
template <class T>
void convertirAbsoluto(T numero){
    if(numero<0){
      numero*=-1;
    }
    cout<<numero<<endl;
}
