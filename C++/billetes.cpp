#include <iostream>

using namespace std;

    void cambio(int numero, int&, int&,int&,int&,int&,int&);

    int main() {
        int numero, cien = 100, cincuenta = 50, veinte = 20, diez = 10, cinco = 5, uno = 1;
        cout << "Ingrese el valor -> "; cin >> numero;
        cambio(numero,cien,cincuenta,veinte,diez,cinco,uno );
        return 0;
    }

    void cambio(int numero, int& cien, int& cincuenta, int& veinte, int& diez, int& cinco, int& uno ) {
        int i=0 ,j=0 ,k=0 , c=0 , n=0 , m=0;
        do{
            if (numero >= cien ){
                numero -= cien;
                i++; 
            } else if (numero >= cincuenta){
                numero -= cincuenta;
                j++; 
            } else if (numero >= veinte) {
                numero -= veinte;
                k++; 
            } else if (numero >= diez) {
                numero -= diez;
                c++; 
            } else if (numero >= cinco){
                numero -= cinco;
                n++; 
            } else if (numero >= uno){
                numero -= uno;
                m++; 
   
            } 
        } while (numero != 0);
   
        cout << "\n \t .:Los valores utilizado:. " << endl;
        cout << "Billete de cien -> " << i << endl;
        cout << "Billete de cincuenta -> " << j << endl; 
        cout << "Billete de veinte -> " << k << endl; 
        cout << "Billete de diez -> " << c << endl;
        cout << "Billete de cinco -> " << n << endl; 
        cout << "Billete de uno -> " << m << endl;
    }