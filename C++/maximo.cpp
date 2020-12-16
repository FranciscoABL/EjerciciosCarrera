//Barraza Lugo Francisco
#include <iostream>

using namespace std;
 template <class T>          
 T maximo(T dato, T dato2,T dato3);

int main(){
	//char dato1='H',dato2='h',dato3='a';   
	int dato1=1,dato2=-5,dato3=5;
	cout<<"El valor maximo es: "<<maximo(dato1,dato2,dato3)<<endl;
	
	return 0;
}

template<class T>    
T maximo(T t1, T t2,T t3){
T mayor; 
if(t1>t2&&t1>t3){
		mayor=t1;
	}
	else if(t2>t1&&t2>t3){
		mayor=t2;
	}
	else{
	mayor=t3;
	}
	return mayor;
}
