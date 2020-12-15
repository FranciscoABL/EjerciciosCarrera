//Escribe un programa que lea de teclado un numero e imprima su tabla de multiplicar desde 0 hasta hasta el numero leido
//Francisco Antonio Barraza
import java.util.*;
public class Tabla {
	public static void main(String[] args) {
        Scanner leer = new Scanner (System.in);
        int a;
        System.out.println("Dime la tabla que quieres");
        a = leer.nextInt();
                            for(int i=1; i<=a; i++){
		for (int num=1; num<=10; num++){
		System.out.println(i+"x"+num+"="+num*i);
		}
                              }
	}
}