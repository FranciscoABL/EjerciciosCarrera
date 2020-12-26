/*
Autor: Paco  - Repasando Tablas Hash
 */
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Scanner;
public class Practica {
    public static void main(String[]args){
        Scanner leer=new Scanner(System.in);
        int numControl;
        Hashtable<Integer,String>tabla=new Hashtable<Integer,String>();
        tabla.put(16171290,"Francisco");
        tabla.put(16171291,"Juan");
        tabla.put(16171292,"Pepe");
        tabla.put(16171293,"Maria");
        System.out.println("Dame el numero de control");
        numControl=leer.nextInt();
        if(tabla.containsKey(numControl)){
            System.out.println("Si esta ->"+ tabla.get(numControl));
        }else{
            System.out.println("No se encuentras");
        }
        Enumeration<Integer> llaves=tabla.keys();
        while(llaves.hasMoreElements()){
            int llave=llaves.nextElement();
            System.out.println("NumControl ->"+ llave + "\n Nombre:"+tabla.get(llave));
        }
    }
}
