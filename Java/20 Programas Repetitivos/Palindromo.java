//programa para ver si una cadena es palindromo
//Autor Francisco Antonio Barraza
import java.util.*;
public class Palindromo {
        public static void main(String[] args) {
        Scanner leer= new Scanner(System.in);
        System.out.print("Introduce una frase : ");
        String cadena=leer.nextLine();
        
        cadena=cadena.replace(" ", "");
        cadena=cadena.replace(",", "");
        cadena=cadena.replace(".", "");
        System.out.println(cadena);
        int fin = cadena.length()-1;
        int ini=0;
        boolean espalin=true;
        
        while(ini < fin){
            if(cadena.charAt(ini)!=cadena.charAt(fin)){
                espalin=false;
            }
        ini++;
        fin--;
        }
        if(espalin)
            System.out.println("Es palindromo.");
        else
            System.out.println("No es palindromo.");
        
    }
}