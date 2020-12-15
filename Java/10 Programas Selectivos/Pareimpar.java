//Programa para calcular si un numero es par o impar
//Autor:Francisco Antonio Barraza
import java.util.*;
public class Pareimpar {
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        int num;      
        System.out.println("Introduzca numero: ");
        num = leer.nextInt();
        if ((num%2)==0)
           System.out.println("PAR");
        else
            System.out.println("IMPAR");
    }
}