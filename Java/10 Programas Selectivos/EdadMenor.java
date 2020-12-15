//Programa para caluclar el menor de edad entre dos personas
//Autor Francisco Barraza Lugo
import java.util.*;
public class EdadMenor {
 public static void main(String[] args) {
      Scanner leer = new Scanner(System.in);
      int n1,n2;
      String no1,no2;
      System.out.print("Introduzca el nombre de la primera persona: ");
      no1 = leer.nextLine();
    System.out.print("Introduzca el nombre de la segunda persona: ");
      no2 = leer.nextLine();
      System.out.print("Introduzca la edad de la primera: ");
        n1 = leer.nextInt();
      System.out.print("Introduzca la edad de la segunda: ");
        n2 = leer.nextInt();
      if(n1 > n2)
         System.out.println("El o la mas pequeña es: " + no2);
           else
              System.out.println("El o la mas pequeña es:" + no1);
  }
 }