package control_escolar;

/*Autor Francisco Antonio Barraza Lugo*/
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Metodos {

    protected AlumPrimaria[] arregloPrim = new AlumPrimaria[10];
    protected int cont = 0;
    protected String clave, nombre;
    protected int grado;

    public Metodos(String mensaje)//NO CONSTRUCTORES POR DEFAULT
    {
        mensaje = "Esto es un Objeto";
    }

    public void alta() {
        System.out.println("-------Alta De Alumnos-----");
        validarclave();//Metodo para ingresar la clave sin letras y con la longitud adecuada
        boolean encontro = buscarClave(clave);
        if (encontro) {
            System.out.println("Clave ya existente prueba con otra");
        } else {
            validarNombre();//Metodo para ingresar el nombre sin numeros y sin espacios
            System.out.println("Ingresa el Grado (1-6)");
            grado = Keyboard.readInt();
            while (grado < 1 || grado > 6) {
                System.out.println("Solo de 1-6 Acepto");
                grado = Keyboard.readInt();
            }
            arregloPrim[cont] = new AlumPrimaria(clave, nombre, grado);
            cont++;
        }
    }

    public void impresionBoletaAlumno() {
        System.out.println("Dame la clave a buscar");
        validarclave();
        boolean encontro = buscarClave(clave);
        if (encontro) {
            System.out.println("-----------------------Boleta-------------------------------");
            System.out.printf("%-25s%-15s%-15s%-15s%-15s%-15s%-15s\n", "Nombre", "Clave", "Grado", "Español", "Matematicas", "Ciencias", "Promedio");
            for (int i = 0; i < cont; i++) {
                if (clave.equals(arregloPrim[i].getClave())) {
                    System.out.println(arregloPrim[i].toString());
                }
            }
        } else {
            System.out.println("No se encuentra");
        }
    }

    public void capturarCalificaciones() {
        System.out.println("Dame la clave a buscar");
        validarclave();
        int posicion = buscaPosicion(clave);
        if (posicion == -1) {
            System.out.println("Alumno No Registrado Intente De Nuevo");
        } else {
            System.out.println("Dame la calificacion de Español");
            int cales = Keyboard.readInt();

            while (cales < 1 || cales > 100) {
                System.out.println("Calificacion Erronea Vuelva a Ingresar");
                cales = Keyboard.readInt();
            }
            arregloPrim[posicion].setCalEspañol(cales);
            System.out.println("Dame la calificacion de Ciencias");
            int calci = Keyboard.readInt();
            while (calci < 1 || calci > 100) {
                System.out.println("Calificacion Erronea Vuelva a Ingresar");
                calci = Keyboard.readInt();
            }
            arregloPrim[posicion].setCalCiencias(calci);
            System.out.println("Dame la calificacion de Matematicas");
            int calma = Keyboard.readInt();
            while (calma < 1 || calma > 100) {
                System.out.println("Calificacion Erronea Vuelva a Ingresar");
                calma = Keyboard.readInt();
            }
            arregloPrim[posicion].setCalMatematicas(calma);
        }
    }

    public boolean buscarClave(String clave) {
        boolean bandera = false;
        for (int i = 0; i < cont; i++) {
            if (arregloPrim[i].getClave().equals(clave)) {
                bandera = true;
                break;
            }
        }
        return bandera;
    }

    public void cambiarNombre() {
        System.out.println("Dame la clave a buscar");
        validarclave();
        boolean encontro = buscarClave(clave);
        int posicion = buscaPosicion(clave);
        if (encontro) {
            System.out.println("Nombre Nuevo para: " + arregloPrim[posicion].getNombre());
            validarNombre();
            arregloPrim[posicion].setNombre(nombre);
        } else {
            System.out.println("NO se encontro");
        }

    }

    public void impresiondetodos() {
        System.out.println("-------------------------------Alumnos Registrados Boletas------------------------------------------");
        System.out.printf("%-25s%-15s%-15s%-15s%-15s%-15s%-15s\n", "Nombre", "Clave", "Grado", "Español", "Matematicas", "Ciencias", "Promedio");
        for (int i = 0; i < cont; i++) {

            System.out.println(arregloPrim[i].toString());
        }
    }

    public int buscaPosicion(String clave) {
        int posicion = -1;
        for (int i = 0; i < cont; i++) {
            if (arregloPrim[i].getClave().equals(clave)) {
                posicion = i;
            }
        }
        return posicion;
    }

    public void reprobadosAprobados() {
        System.out.println("----------Reprobados----------");
        for (int i = 0; i < cont; i++) {
            if (arregloPrim[i].promedio() < 70) {
                System.out.println(arregloPrim[i].getNombre() + " " + " Promedio  " + arregloPrim[i].promedio());
            }
        }
        System.out.println("-----------Aprobados----------");
        for (int i = 0; i < cont; i++) {
            if (arregloPrim[i].promedio() > 70) {
                System.out.println(arregloPrim[i].getNombre() + " " + " Promedio  " + arregloPrim[i].promedio());
            }

        }
    }

    public String validarclave() {
        boolean res;
        Pattern patron = Pattern.compile("[0-9]{5,8}");
        Matcher me;
        do {
            System.out.println("Ingresa La Clave Del Alumno (SOLO NUMEROS DE 5 A 8 NUMEROS SOLAMENTE EJEMPLO 16171290)");
            clave = Keyboard.readString();
            me = patron.matcher(clave);
            if (me.matches()) {
                res = true;
            } else {
                res = false;
            }
        } while (!res);
        return clave;
    }

    public String validarNombre() {
        Pattern patron = Pattern.compile("[a-zA-z\\s]*[a-zA-z]");
        Matcher me;
        boolean res;
        do {
            System.out.println("Ingresa El Nombre Del Alumno (SOLO LETRAS NO SE ACEPTAN NUMEROS O ESPACIOS EN BLANCO");
            nombre = Keyboard.readString();
            me = patron.matcher(nombre);
            if (me.matches()) {
                res = true;

            } else {
                res = false;
            }
        } while (!res);
        return nombre;
    }
}
