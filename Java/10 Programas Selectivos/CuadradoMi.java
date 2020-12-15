//Programa para calcular si un numero es par o impar y obtenga el cuadrado y la mitad
//Autor Francisco Barraza
import java.util.*;
public class CuadradoMi {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        int num;      
        System.out.println("Introduzca numero: ");
        num = leer.nextInt();
        if ((num%2)==0){
        System.out.println("PAR");
        double m=num/2;
         System.out.println("Mitad "+m);
        }else{
        System.out.println("IMPAR");
        double elevado=num*num;
        System.out.println("Cuadrado "+elevado);
   }
 }
}