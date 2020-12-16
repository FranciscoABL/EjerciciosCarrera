#include <iostream>

using namespace std;

int main(){
    int numeros[100];
    int n;
    cout<<"Numero de elementos del arreglo"<<endl;
    cin>>n;
    for(int i=0;i<n;i++){
        cout<<"Digite un numero"<<endl;
        cin>>numeros[i];
    }
    for(int i=0;i<n;i++){
        cout<<" Posicion-> "<<i<<" Numero-> "<<numeros[i]<<endl;
    }
    
    return 0;
}