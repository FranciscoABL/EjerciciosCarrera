//Programa para fechas y estacion del año
//Autor Francisco Antonio Barraza Lugo
import java.util.*;
public class Estacion {
    public static void main(String[] args) {
        int mes;
        Scanner leer = new Scanner(System.in);
        System.out.print("Introduzca un numero de mes: ");
        mes = leer.nextInt();
        switch (mes)
        {
                case 1: System.out.println("Que dia de enero es");
                 int a = leer.nextInt();
                 if (a>=1 && a<=31){             
                System.out.println("Es el dia "+a+" De Enero del 2016 Y es Invierno");
                 }
                else { 
                System.out.println("Dia no valido");
                }
                           break;
                case 2: System.out.println("Que dia de febrero es");
                 int b = leer.nextInt();
                 if (b>=1 && b<=29){             
                System.out.println("Es el dia "+b+" De Febrero del 2016 Y es Invierno");
                 }
                else { 
                System.out.println("Dia no valido");
                }
                           break;
                case 3: System.out.println("Que dia de Marzo es");
                 int c = leer.nextInt();
                if (c>=21 && c<=31){
                System.out.println("Es el dia "+c+" De Marzo Del 2016 Y es Primavera");
                }
                else { 
                System.out.println("Es el dia "+c+" De Marzo Del 2016 Y es Invierno");
                }
                           break;
                case 4: System.out.println("Que dia de Abril es");
                int d = leer.nextInt();
                if (d>=1 && d<=30){
                System.out.println("Es el dia "+d+" De Abril Del 2016 Y es Primavera");
                 }
                else { 
                System.out.println("Dia no valido");
                }
                           break;
                case 5: System.out.println("Que dia de mayo es");
                int e = leer.nextInt();
                System.out.println("Es el dia "+e+" De Mayo Del 2016 Y es Primavera");
                           break;
                case 6: System.out.println("Que dia de Junio es");
                int f = leer.nextInt();
                  if (f>=21 && f<=30){
                System.out.println("Es el dia "+f+" De Junio Del 2016 Y es Verano");
                }
                else { 
                System.out.println("Es el dia "+f+" De Junio Del 2016 Y es Primavera");
                }
                           break;
                case 7: System.out.println("Que dia de Julio es");
                int g= leer.nextInt();
                if(g>=1 && g<=31){
                System.out.println("Es el dia "+g+" De Julio Del 2016 Y es Verano");
                } 
                else{
                System.out.println("Dia no valido");
                }                
                break;
                case 8: System.out.println("Que dia de Agosto es");
                int h= leer.nextInt();
                if(h>=1 && h<=31){
                System.out.println("Es el dia "+h+" De Agosto Del 2016 Y es Verano");
                }
                else {
                System.out.println("Dia no valido");
                }
                           break;
                case 9: System.out.println("Que dia de Septiembre es");
                int i= leer.nextInt();
                if(i>=1 && i<=30){
                System.out.println("Es el dia "+i+" De Septiembre Del 2016 Y es Verano");
                }
                else {
                System.out.println("Dia no valido");
                }
                           break;
                case 10: System.out.println("Que dia de Octubre es");
                int j = leer.nextInt();
                if (j>=21 && j<=31){
                System.out.println("Es el dia "+j+" De Marzo Del 2016 Y es Otoño");
                }
                else { 
                System.out.println("Es el dia "+j+" De Marzo Del 2016 Y es Verano");
                }
                             break;
                case 11: System.out.println("Que dia de Noviembre es");
                 int k= leer.nextInt();
                if(k>=1 && k<=30){
                System.out.println("Es el dia "+k+" De Agosto Del 2016 Y es Otoño");
                }
                else {
                System.out.println("Dia no valido");
                }
                             break;
                case 12: System.out.println("Que dia de Diciembre es");
                int l = leer.nextInt();
                if (l>=21 && l<=31){
                System.out.println("Es el dia "+l+" De Marzo Del 2016 Y es Invierno");
                }
                else { 
                System.out.println("Es el dia "+l+" De Marzo Del 2016 Y es Otoño");
                }
                             break;
                default : System.out.println("Mes no válido");                       
        }
    }
}