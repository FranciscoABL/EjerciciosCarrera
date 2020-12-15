//Programa para contar palabras
//Autor Francisco Antonio Barraza
import java.util.Scanner;
import java.util.StringTokenizer;
public class Palabra {
    public static void main(String[] args) {
       Scanner leer = new Scanner(System.in);
       String frase;
       System.out.print("Introduce una frase: ");
       frase = leer.nextLine();
       StringTokenizer st = new StringTokenizer(frase);
       System.out.println("Número de palabras: " + st.countTokens());
    }
}
