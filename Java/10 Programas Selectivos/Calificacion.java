//Programa para dar un rango de calificacion
//Autor Francisco Barraza
import java.util.*;
public class Calificacion {
    public static void main(String[] args) {
      Scanner leer = new Scanner(System.in);
      int cal;
      System.out.println("Introduzca una calificacion: ");
      cal = leer.nextInt();
      if(cal >= 0 && cal <= 5){
          System.out.println("MALO");
       }
      else {
      if(cal >= 6 && cal <= 7){
           System.out.println("REGULAR");
        }
      else {
       if(cal >= 8 && cal <= 9){
            System.out.println("BUENO");
           }
      else { 
      if(cal>=10 && cal<=10){
            System.out.println("Excelente");  
         }    
       }
     }
}


