package programa;

/*
Francisco Antonio Barraza Lugo
 */
public class Programa {

    private String nombrePrograma;
    private int memoria;
    private double porcentajeAsignado;

    public Programa(String nombrePrograma, int memoria, double porcentajeAsignado) {
        this.nombrePrograma = nombrePrograma;
        this.memoria = memoria;
        this.porcentajeAsignado = porcentajeAsignado;
    }

    public String getNombrePrograma() {
        return nombrePrograma;
    }

    public void setNombrePrograma(String nombrePrograma) {
        this.nombrePrograma = nombrePrograma;
    }

    public int getMemoria() {
        return memoria;
    }

    public void setMemoria(int memoria) {
        this.memoria = memoria;
    }

    public double getPorcentajeAsignado() {
        return porcentajeAsignado;
    }

    public void setPorcentajeAsignado(double porcentajeAsignado) {
        this.porcentajeAsignado = porcentajeAsignado;
    }

    public String toString() {
        return "Programa{" + "nombrePrograma=" + nombrePrograma + ", memoria=" + memoria + ", porcentajeAsignado=" + porcentajeAsignado + '}';
    }

}
