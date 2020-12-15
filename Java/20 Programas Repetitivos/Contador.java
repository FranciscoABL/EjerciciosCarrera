//Programa para contar mujeres y hombres
//Autor Francisco Antonio Barraza Lugo
import java.util.Scanner;
public class Contador{
   public static void main(String[] args) {
     Scanner leer = new Scanner(System.in);
     int conteomujeres=0,conteohombres=0,sexo;
     String nom=" ";
     for (int num=1; num<=10; num++){
         nom=leer.nextLine();
         System.out.println("Ingrese su nombre");
          nom=leer.nextLine();
          System.out.println("Ingrese su sexo 0---> Femenino  1---> masculino  ");
          sexo=leer.nextInt();
          if(sexo==1){
              conteohombres++;
          }else{
              conteomujeres++;
         }
   }
     System.out.println("Numero de mujeres:  " + conteomujeres);
     System.out.println("Numero de hombre:  " + conteohombres);
     
     } 
}