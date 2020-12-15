//Programa para calcular si tu calificacion es buena o mala
//Autor Francisco Antonio Barraza Lugo
import java.util.*;
public class Trabajo {
    public static void main( String[] args ){
        Scanner leer = new Scanner( System.in );
        System.out.print(" Calificacion: ");
        int trabajo = leer.nextInt();
        if (trabajo >=70 && trabajo<=100){
            System.out.println("Aprobado");
 }
        else
            System.out.println("Reprobado");

    }
}