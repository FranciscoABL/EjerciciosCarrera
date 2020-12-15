//Escribe un programa que lea de teclado un numero e imprima su tabla de multiplicar 
//Autor Francisco Antonio Barraza
import java.util.*;
public class TablaMult {
	public static void main(String[] args) {
        Scanner leer = new Scanner (System.in);
        int a;
        System.out.println("Dime la tabla que quieres");
        a = leer.nextInt();
		for (int num=0; num<=12; num++){
		System.out.println(a+"x"+num+"="+num*a);
		}
                              }
	}