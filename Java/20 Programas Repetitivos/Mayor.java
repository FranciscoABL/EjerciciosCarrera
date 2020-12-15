//Programa para calcular el mayor de edad de todos
//Autor Francisco Antonio Barraza
import java.util.Scanner;
public class Mayor {
     public static void main(String[] args) {
     Scanner leer = new Scanner(System.in);
     String[]nombre=new String[3];
     int[]Edad=new int[3];
     String n;
     int men=18;
     for (int i=0; i<3; i++){
           n=leer.nextLine();
           System.out.println("Ingrese su nombre");
           nombre[i]=leer.nextLine();
           System.out.println("Ingrese su edad");
           Edad[i]=leer.nextInt();
           if(Edad[i]>men){
           men=Edad[i];
         }
       }
          System.out.println("el mayor es "+nombre[i]);
 }
}