//Programa para contar mujeres,diga el promedio y la mas joven
//Autor Francisco Antonio Barraza Lugo
import java.util.Scanner;
public class MujeresMenor {
     public static void main(String[] args) {
     Scanner leer = new Scanner(System.in);
     int Edad=1,men=18,sumh=0,summ=0,conteomujeres=0,conteohombres=0,sexo;
     String nom=" ";
     for (int num=1; num<=10; num++){
         nom=leer.nextLine();
         System.out.println("Ingrese su Nombre");
         nom=leer.nextLine();
         System.out.println("Ingrese su edad");
         Edad=leer.nextInt();
         if(Edad<men){
         men=Edad;
         }
          System.out.println("Ingrese su sexo");
          System.out.println("0---> Femenino");
          System.out.println("1---> masculino");
          sexo=leer.nextInt();
          if(sexo==1){
              sumh=sumh+Edad;
              conteohombres++;
          }else{
              summ=summ+Edad;
              conteomujeres++;
         }
   }
     System.out.println("Numero de mujeres:  " + conteomujeres);
     System.out.println("promedio de edad de mujeres : " +summ / conteomujeres);
     System.out.println("la mas joven es : " +men);
     } 
}