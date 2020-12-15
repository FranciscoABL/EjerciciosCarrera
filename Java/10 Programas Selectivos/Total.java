//Programa para dar el numero de decenas de un rango
//Autor Francisco Antonio Barraza
import java.util.*;
public class Total {
    public static void main(String[] args) {
      Scanner leer = new Scanner(System.in);
      int num;
      int dec;
      System.out.println("Introduzca un numero entre el 0 y el 100: ");
      num = leer.nextInt();
      if (num >= 0 && num < 100)
          System.out.println("numero en el rango");
      else 
           System.out.println("Numero fuera de rango");
     dec=num/10;
  System.out.println("Total de decenas----> " +dec);
    }
}