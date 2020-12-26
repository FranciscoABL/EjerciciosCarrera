/*
Barraza Lugo Francisco 
 */
package numeros;

import java.util.Random;

public class Implementa {

    Lista<Integer> listasimple;
    ListaDBL<Integer> listadoble;
    int n = 0;
    Integer[] valor;
    int tamaño = 0;

    public static void main(String[] args) {
        Implementa objeto = new Implementa();
        objeto.menu();

    }

    public void menu() {
        while (n != 4) {
            System.out.println("-------------Menu---------------");
            System.out.println("Opcion 1:Generar Lista Simple");
            System.out.println("Opcion 2:Mostrar");
            System.out.println("Opcion 3:ListaDoble");
            System.out.println("Opcion 4:Salir");
            n = Keyboard.readInt();
            System.out.println("Opcion----> " + n);
            if (n > 4 || n < 0) {
                System.out.println("Esa Opcion no esta digite de nuevo");
            }
            switch (n) {
                case 1:
                    GenerarLista();
                    break;
                case 2:
                    imprimir();
                    break;
                case 3:
                    listadoble();
                    break;
            }
        }
    }

    public void GenerarLista() {
        listasimple = new Lista<Integer>();//cada vez que ingrese a generar sera una nueva lista con nodos ya que estos no se acumularan
        listadoble = new ListaDBL<Integer>();
        System.out.println("De cuantos Nodos Sera su lista");
        tamaño = Keyboard.readInt();
        while (tamaño <= 0 || tamaño > 30) {//Solo se permitiran de 1 a 30 nodos
            System.out.println("De cuantos Nodos Sera su lista");
            tamaño = Keyboard.readInt();
        }
        System.out.println("Rango de Valores A tomar");
        System.out.println("Valor inicial");//Valor del rango
        int numero = Keyboard.readInt();
        while (numero <= 0 || numero > 100) {
            System.out.println("Valor inicial");//validacion
            numero = Keyboard.readInt();
        }
        System.out.println("Valor Final");
        int numerofinal = Keyboard.readInt();
        while (numerofinal <= 0 || numerofinal > 100) {//valor final validacion
            System.out.println("Valor final");
            numerofinal = Keyboard.readInt();
        }
        if ((numerofinal - numero) < tamaño) {//si la resta del intervalo de nuemeros es menor al tamaño no se podra poner los numeros ya que al no repetirse numeros no encontrara que poner
            System.out.println("Numero Que se Generara Por Default");
            System.out.println("Inicial  1");
            System.out.println("Final    50");
            numero = 1;
            numerofinal = 50;
        }

        while (numero > numerofinal) {//Si el numero inferior es superior al final se tomara por default un rango para evitar estar tecleando
            System.out.println("Numero Que se Generara Por Default");
            System.out.println("Inicial  1");
            System.out.println("Final    50");
            numero = 1;
            numerofinal = 50;
        }
        Random rnd = new Random();
        int valores = rnd.nextInt(numerofinal - numero + 1) + numero;//Generacion de numeros aleatorios
        valor = new Integer[tamaño];
        for (int i = 0; i < tamaño; i++) {
            while (listasimple.buscar(valores)) {//Validacion para que no se repitan NOTA:si hace una lista con pocos nodos y que los numeros vayan en un intervalo corto no encontrara que numeros poner
                valores = rnd.nextInt(numerofinal - numero + 1) + numero;
            }
            valor[i] = valores;//Guardo los valores en un arreglo ya que se pasaran a la lista doble
            listasimple.InsertarOrdenado(valores);//se insertan ordenado en la lista simple
        }
    }

    public void imprimir() {
        int nume = 0;
        while (nume != 4) {
            System.out.println("Lista a Imprimir");
            System.out.println("Opcion 1:Lista Sencilla");
            System.out.println("Opcion 2:Lista Doble Ascendente");
            System.out.println("Opcion 3:Lista Doble Descendente");
            System.out.println("Opcion 4:Salir");
            nume = Keyboard.readInt();
            switch (nume) {
                case 1:
                    if (listasimple.vacia()) {
                        System.out.println("No se a creado esta vacia");
                    } else {
                        System.out.println("--------Lista Sencilla----");
                        listasimple.EstadoActual();//Estatus de la lista de menor a mayor
                    }
                    break;
                case 2:
                    if (listadoble.vacia()) {
                        System.out.println("No se a creado");
                    } else {
                        System.out.println("---------Lista Doble Ascendente---------");
                        listadoble.recorre(1);//Se mostrara de Frente a Fin de Menor A Mayor
                    }
                    break;
                case 3:
                    if (listadoble.vacia()) {
                        System.out.println("No se a creado");
                    } else {
                        System.out.println("---------Lista Doble Descendente---------");
                        listadoble.recorre(2);//Se mostrara de Fin a Frente De Mayor A menor

                    }
                    break;
            }
        }
    }

    public void listadoble() {
        if (listasimple.vacia()) {//si no se a creado la lista sencilla no tiene caso crear la lista doble
            System.out.println("No se puede crear");
        } else {
            if (!listadoble.vacia()) {//si ya se creo la lista doble para que no haya duplicados de datos solo sera una vez hasta que se genere de nuevo los datos
                System.out.println("Ya se a creado");
            } else {
                for (int i = 0; i < tamaño; i++) {
                    listadoble.insertaordeando(valor[i]);//se insertan los valores de lista sencilla en la listadoble en forma ordenada
                }
                System.out.println("Lista Simple Copiada");
            }
        }
    }
}
//Nota:
/*Para arreglar lo de comparar con el compareTo al ser String el compareTo compara solo los codigo Ascci mostrando un 40 primero ante un 5 ya que empieza
por 5 lo que pense hacer primero fue el metodo ordenar convertir los String a enteros y asi compararlos de forma mas facil luego mejor
implemente un compareTo en la clase nodo para que la clase lista la pudiera utilizar preguntando si era un String comparara normalmente
si es Integer convertira a objeto Integer y usara el compareTo con el instance of ,que ya esta asignado en esos objetos asi usandolo en los dos en String e Integer*/
