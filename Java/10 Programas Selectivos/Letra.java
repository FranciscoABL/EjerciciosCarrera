//Programa que pide diez numeros y los devuelve en letras
//Autor Francisco Antonio Barraza 
import java.util.*;
public class Letra {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        int num;
        System.out.print("Introduzca un numero del 1 al 10 : ");
        num = leer.nextInt();
        switch (num)
        {
                case 1: System.out.println("Uno");
                           break;
                case 2: System.out.println("Dos");
                           break;
                case 3: System.out.println("Tres");
                           break;
                case 4: System.out.println("Cuatro");
                           break;
                case 5: System.out.println("Cinco");
                           break;
                case 6: System.out.println("Seis");
                           break;
                case 7: System.out.println("Siete");
                           break;
                case 8: System.out.println("Ocho");
                           break;
                case 9: System.out.println("nueve");
                           break;
                case 10: System.out.println("Diez");
                           break;
                default : System.out.println("ese numero no te pedi vuelve a poner un numero");                       
    }
  }
}