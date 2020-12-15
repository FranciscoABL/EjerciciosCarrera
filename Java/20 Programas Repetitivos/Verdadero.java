//Autor francisco Antonio Barraza
import java.util.*;
public class Verdadero {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        int num;      
        System.out.println("Introduzca numero: ");
        num = leer.nextInt();
        if ((num%2)==0){
           System.out.println("PAR");
           System.out.println("VERDADERO");
        }else 
             {
            System.out.println("IMPAR");
            System.out.println("FALSO");
       }
    }
}