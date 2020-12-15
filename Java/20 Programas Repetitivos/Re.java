//Programa de repeticion hasta que sea un cero terminara
//Francisco Antonio Barraza Lugo
import java.util.*;
public class Re {
	public static void main(String[] args) {
        Scanner leer = new Scanner (System.in);
          int num=0;
		while (num!=1){
			System.out.println("Dime un numero");
                       num=leer.nextInt();
			num++;
		}
        
      }
}