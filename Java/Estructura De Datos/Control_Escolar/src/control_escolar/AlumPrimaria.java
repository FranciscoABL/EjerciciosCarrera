/*Autor Francisco Antonio Barraza Lugo*/
package control_escolar;

public class AlumPrimaria {

    private String clave = " ";
    private String nombre = " ";
    private int grado = 0;
    private int calMatematicas, calEspañol, calCiencias;

    public AlumPrimaria(String clave, String nombre, int grado) {
        this.clave = clave;
        this.nombre = nombre;
        this.grado = grado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getGrado() {
        return grado;
    }

    public void setGrado(int grado) {
        this.grado = grado;
    }

    public int getCalMatematicas() {
        return calMatematicas;
    }

    public void setCalMatematicas(int calMatematicas) {
        this.calMatematicas = calMatematicas;
    }

    public int getCalEspañol() {
        return calEspañol;
    }

    public void setCalEspañol(int calEspañol) {
        this.calEspañol = calEspañol;
    }

    public int getCalCiencias() {
        return calCiencias;
    }

    public void setCalCiencias(int calCiencias) {
        this.calCiencias = calCiencias;
    }

    public String getClave() {
        return clave;
    }

    public double promedio() {
        int suma = 0;
        suma = calMatematicas + calCiencias + calEspañol;
        return suma / 3;
    }

    public String toString() {
        return String.format("%-25s%-15s%-15s%-15s%-15s%-15s%-15s\n", nombre, clave, grado, calEspañol, calMatematicas, calCiencias, promedio());
    }

}
