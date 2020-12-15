//Programa para dar un saludo
import java.util.*;
public class Rango {
    public static void main(String[] args) {
      Scanner leer = new Scanner(System.in);
      int num;
      System.out.println("Introduzca un numero entre el 0 y el 100: ");
      num = leer.nextInt();
      if (num >= 0 && num < 100)
          System.out.println("numero en el rango");
      else 
           System.out.println("Numero fuera de rango");
    }
}