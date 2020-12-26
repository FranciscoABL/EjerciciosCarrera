package proyectobanco;

/**
 *
 * @author Francisco Antonio Barraza Lugo - 2017
 */
public class Cliente {

    private int turno;
    private String tipoDeCliente;
    private String movimiento;
    private double importe;

    public Cliente(int turno, String tipoDeCliente, String movimiento, double importe) {
        this.turno = turno;
        this.tipoDeCliente = tipoDeCliente;
        this.movimiento = movimiento;
        this.importe = importe;
    }

    public int getTurno() {
        return turno;
    }

    public void setTurno(int turno) {
        this.turno = turno;
    }

    public String getTipoDeCliente() {
        return tipoDeCliente;
    }

    public void setTipoDeCliente(String tipoDeCliente) {
        this.tipoDeCliente = tipoDeCliente;
    }

    public String getMovimiento() {
        return movimiento;
    }

    public void setMovimiento(String movimiento) {
        this.movimiento = movimiento;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }

    public String toString() {
        return "Turno: " + turno + " Tipo De Cliente: " + tipoDeCliente + " Movimiento: " + movimiento + " Importe: " + importe;
    }
}
