//Barraza Lugo Francisco 
#include <iostream>
#include<math.h>
using namespace std;
float n1,n2;
void pedirDatos();
void mult(float x,float y);
void cuadrado(float n);
int main() {
    pedirDatos();
    mult(n1,n2);
    cuadrado(n1);
    return 0;
}
void pedirDatos(){
    cout<<"Dame dos numeros"<<endl;
    cin>>n1>>n2;
}
void mult(float x,float y){
    float multiplicacion;
    multiplicacion=x*y;
    cout<<"La multiplicacion es :"<<multiplicacion<<endl;
}
void cuadrado(float n){
    float cuad;
    //cuad=n*n;
    cuad=pow(n,2);
    cout<<"EL cuadrado de "<<n<<" es:"<<cuad<<endl;
}

