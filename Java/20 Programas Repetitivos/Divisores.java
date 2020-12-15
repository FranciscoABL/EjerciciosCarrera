//Programa Para Saber cuantos divisores tiene un numero
//Autor:Francisco Antonio Barraza
import java.util.*;
public class Divisores {
        public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);
        System.out.println ("Introduzca un Numero: ");
        int n =leer.nextInt();
        int contador=0;
        for (int i = 1 ; i <= n ; i++)
        {
            if (n % i == 0)
            {
                System.out.println (i);
                contador++;
            }
        }
        System.out.println("Hay un total de "+contador+" numeros divisisores");
    }
}
        