/*Autor: Francisco Antonio Barraza Lugo
Fecha: 29/08/2017
Crear una clase llamada AlumPrimaria con los datos de Clave, Nombre, Grado, CalMatematicas, CalEspañol, CalCiencias.
La clase debe tener constructor para inicializar los datos del alumno excepto sus calificaciones.
Crear métodos get/set para: Nombre, Grado y las calificaciones
Crear método get para Clave
Incluir método toString 
Pueden agregar método para calcular el promedio
------------------------------------------------------------------------------------------------------------------------
Opciones a incluir:
Alta Alumnos (validando que el numero o clave del alumno no se repita)
Capturar Calificaciones
Buscar alumno e imprimir su boleta
Imprimir boletas (con todos los alumnos obteniendo el promedio)
Modificar Nombre del Alumno
Agregar otro reporte

 */
package control_escolar;

public class UsaAlumno {

    public static void main(String[] args) {
        int n = 0;
        Metodos a = new Metodos("Sistema Para Primaria");

        while (n != 7) {
            try {
                System.out.println("-------------Menu---------------");
                System.out.println("Opcion 1:Alta Alumno");
                System.out.println("Opcion 2:Capturar Calificaciones");
                System.out.println("Opcion 3:Buscar Alumno E Imprimir Su Boleta");
                System.out.println("Opcion 4:Imprimir Todas Las Boletas Existentes");
                System.out.println("Opcion 5:Modificar Nombre Del Alumno");
                System.out.println("Opcion 6:Reprobados Y Aprobados");
                System.out.println("Opcion 7:Salir");
                n = Keyboard.readInt();
                System.out.println("Opcion----> " + n);
                if (n > 7 || n < 0) {
                    System.out.println("Esa Opcion no esta digite de nuevo");
                }
                switch (n) {
                    case 1:
                        a.alta();
                        break;
                    case 2:
                        a.capturarCalificaciones();
                        break;
                    case 3:
                        a.impresionBoletaAlumno();
                        break;
                    case 4:
                        a.impresiondetodos();
                        break;
                    case 5:
                        a.cambiarNombre();
                        break;
                    case 6:
                        a.reprobadosAprobados();
                        break;
                    case 7:
                        System.out.println("Hasta Luego");
                        break;
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("EL Arreglo Ya esta lleno solo Puedo Guardar 10 Elementos (Fin De Programa");
                n = 7;
            }
        }
    }
}
