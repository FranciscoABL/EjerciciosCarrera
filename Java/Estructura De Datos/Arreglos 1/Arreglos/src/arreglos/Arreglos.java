package arreglos;

import java.util.Arrays;

/*
Autor: Francisco Antonio Barraza Lugo
Fecha: 27/08/2017
Se pide la implementación de un programa para rellenar un arreglo de 10 números enteros sin que se repita ningún valor.
El programa deberá controlar que cuando el usuario introduzca un nuevo valor éste no haya sido introducido previamente; 
si dicho valor ya existe en el arreglo el programa deberá volver a pedir otro hasta que el que se introduzca no exista. 
Al final presentar el arreglo por pantalla.

 */
public class Arreglos {

    public static void main(String[] args) {
        int[] arreglo = new int[10];
        Arreglos a = new Arreglos();
        a.llenarArregloSinRepetir(arreglo);
    }

    public void llenarArregloSinRepetir(int[] arreglo) {
        int contador = 0;
        int numero;
        while (contador < arreglo.length) {
            System.out.println("Teclea un numero en la posicion #" + (contador + 1));
            numero = Keyboard.readInt();//Se guarda en una variable para luego compararla con el arreglo y verificar si existe o no
            for (int i = 0; i < arreglo.length; i++) {
                while ((numero == arreglo[i])) {//mientras el numero introducido sea igual al mismo numero si se llega a encontrar en el arreglo se debera ingresar de nuevo
                    System.out.println("El numero ya existe Introduzca de nuevo");
                    numero = Keyboard.readInt();

                }
            }
            arreglo[contador] = numero;//Si no es igual el numero a alguno de los que esten en el arreglo se guarda,asi hasta que se llene el arreglo
            contador++;
        }
        System.out.println("---------------Lista de numeros----------------");
        System.out.println(Arrays.toString(arreglo));  //Impresion del arreglo
    }
}
