/*Programa que lea 5 numeros en un arreglo
los copie a otro arreglo y los multiplique por dos y muestre el segundo arreglo
Autor:Barraza Lugo Francisco Antonio
*/
#include <iostream>
using namespace std;
int main(){
    int n,mayor=0;
    cout<<"Digite el tamaño del arreglo"<<endl;
    cin>>n;
    int numeros[n];
    int numeroscopia[n];
    for(int i=0;i<n;i++){
        cout<<" Digite Numero "<<endl;
        cin>>numeros[i];
    }
    for(int i=0;i<n;i++){
        numeroscopia[i]=numeros[i]*2;
    }
    for(int i=0;i<n;i++){
        cout<<"Numero arreglo copia["<<i<<"]"<<"="<<numeroscopia[i]<<endl;
    }

    return 0;
}
   