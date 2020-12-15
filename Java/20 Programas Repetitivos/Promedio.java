//Escribe un programa que lea de teclado la edad de 10 personas y obtén como resultado el promedio de las edades
//Autor Francisco Antonio Barraza Lugo
import java.util.*;
public class Promedio {
	public static void main(String[] args) {
        Scanner leer = new Scanner (System.in);
        double promedio;
        int sum,n;
        sum=0;
		for (int num=1; num<=10; num++){
		System.out.println("Dime tu edad");
            n=leer.nextInt();
             sum=sum+n;
		}
         promedio=sum/10;
         System.out.println("El promedio de la edad es----->"+ promedio);
	}
}