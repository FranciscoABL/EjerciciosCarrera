//Programa para saber si un numeo es primo o no
//autor Francisco Barraza Lugo
import java.util.*;
public class Primo {
     public static void main(String[] args) {
          Scanner leer = new Scanner(System.in);
         int a=0;
         int i,n;
         System.out.println("Ingrese numero");
         n=leer.nextInt();
         for(i=1;i<(n+1);i++){
         if(n%i==0){
             a++;
            }
         }
         if(a!=2){
              System.out.println("No es Primo");
            }else{
                System.out.println("Si es Primo");
         }
     }
}
