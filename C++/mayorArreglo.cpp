#include <iostream>

using namespace std;

int main(){
    int numeros[100];
    int n,mayor=0;
    cout<<"Digite el tamaño del arreglo"<<endl;
    cin>>n;
    for(int i=0;i<n;i++){
        cout<<" Digite Numero "<<endl;
        cin>>numeros[i];
    }
    for(int i=0;i<n;i++){
        if(numeros[i]>mayor){
            mayor=numeros[i];
        }   
    }
    cout<<"El Mayor es -->"<<mayor<<endl;
    return 0;
}