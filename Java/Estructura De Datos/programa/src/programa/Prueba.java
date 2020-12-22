/*
Francisco Antonio Barraza Lugo
 */
package programa;

import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Prueba {

    int elem = 0;
    Stack<Programa> pila = new Stack<Programa>();
    String nombre;
    int memoriadisponible = 1000;  //memoria definida 
    double porcentaje = 100;
    Pattern patron = Pattern.compile("[a-zA-z\\S]*[a-zA-z]");
    Matcher me;

    public static void main(String[] args) {
        int n = 0;
        Prueba p = new Prueba();

        while (n != 6) {

            System.out.println("-------------Menu---------------");
            System.out.println("Opcion 1:Agregar Programa");
            System.out.println("Opcion 2:Eliminar Programa");
            System.out.println("Opcion 3:Programa en ejecucion(tope)");
            System.out.println("Opcion 4:Mostrar Programas Pendientes(Recorrer Programa)");
            System.out.println("Opcion 5:Estatus de Memoria Y Porcentaje");
            System.out.println("Opcion 6:Salir");
            n = Keyboard.readInt();
            System.out.println("Opcion----> " + n);
            if (n > 6 || n < 0) {
                System.out.println("Esa Opcion no esta digite de nuevo");
            }
            switch (n) {
                case 1:
                    p.ingresar();
                    break;
                case 2:
                    p.terminar();
                    break;
                case 3:
                    p.verificarprogramaenejecucion();
                    break;
                case 4:
                    p.recorrer();
                    break;
                case 5:
                    p.estatus();
                    break;
                case 6:
                    System.out.println("Hasta Pronto");
                    break;
            }

        }
    }

    public void ingresar() {
        if (memoriadisponible == 0 || porcentaje == 0) {
            System.out.println("Espacio Para ejecucion Llena Elimina un programa Si no ,no podras agregar");
        } else {
            validanombre();
            System.out.println("Memoria que usara Libre->" + memoriadisponible + "mb");
            int memoria = Keyboard.readInt();
            while (memoria > memoriadisponible || memoria <= 0) {
                System.out.println("Memoria No aceptada No hay suficiente espacio o es mayor a la actual");
                memoria = Keyboard.readInt();
            }
            System.out.println("Procesador:Porcentaje Libre->" + porcentaje + "%");
            double procesador = Keyboard.readDouble();
            while (procesador > porcentaje || procesador <= 0) {
                System.out.println("Porcentaje Erroneo No hay suficiente espacio o es mayor a la actual para el programa ||Numero Negativo||INGRESE DE NUEVO|");
                procesador = Keyboard.readDouble();
            }
            Programa p = new Programa(nombre, memoria, procesador);
            pila.push(p);
            memoriadisponible -= memoria;
            porcentaje -= procesador;

        }
    }

    public void terminar() {
        if (pila.empty()) {
            System.out.println("No puedes terminar ningun programa pila de ejecucion vacia");
            System.out.println("Memoria Disponible " + memoriadisponible + "mb");
            System.out.println("Porcentaje de Procesador " + porcentaje + "%");
        } else {
            System.out.println("Terminar Programa");
            System.out.println("Prgrama terminado: " + pila.peek());
            memoriadisponible += pila.peek().getMemoria();
            porcentaje += pila.peek().getPorcentajeAsignado();
            pila.pop();

        }
    }

    public void verificarprogramaenejecucion() {
        if (pila.empty()) {
            System.out.println("Pila Vacia No puedo Mostrar nada");
        } else {
            System.out.println(pila.peek());
        }

    }

    public void estatus() {
        System.out.println("Memoria Disponible--> " + memoriadisponible + "mb");
        System.out.println("Porcetnaje de Procesador.--> " + porcentaje + "%");
    }

    public void recorrer() {
        Stack<Programa> auxiliar = new Stack();

        if (pila.empty()) {
            System.out.println("Pila Vacia no hay nada");
        } else {

            System.out.println("Lista");
            while (!pila.empty()) {
                auxiliar.push(pila.peek());  //Paso de pila a pila para ir mostrando los elementos sin mover los datos actuales
                System.out.println(pila.peek());
                pila.pop();
            }

            while (!auxiliar.empty()) {
                pila.push(auxiliar.peek());
                auxiliar.pop();
            }
        }
    }

    public String validanombre() {
        boolean bandera;
        do {
            System.out.println("Nombre del programa");
            nombre = Keyboard.readString();
            me = patron.matcher(nombre);
            if (me.matches()) {
                bandera = true;
            } else {
                bandera = false;
            }
        } while (!bandera);
        return nombre;
    }
}
