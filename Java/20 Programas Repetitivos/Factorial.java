//Programa para calcular factoriales
//Autor Francisco Antonio Barraza
import java.util.Scanner; 
public class Factorial { 
public static void main(String[] args){ 
Scanner leer =new Scanner(System.in); 
int suma=1; 
        System.out.println("Ingrese un numero"); 
int n=leer.nextInt();
if(n>0 && n<=10){ 
    for(int i=n;i>1;i--){ 
     suma=suma*i; 
  } 
     System.out.println("El factorial de "+n+" es "+suma); 
  } 
 }
}
