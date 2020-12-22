package proyectobanco;

/**
 *
 * @author Francisco Antonio Barraza Lugo
 */
public class ColaCircular<T> {

    private int Frente;
    private int Fin;
    private int Max;
    public T Dr;
    private T[] C;

    public ColaCircular() {
        this(10);
    }

    public ColaCircular(int Tam) {
        Max = Tam;
        Frente = Fin = -1;
        C = (T[]) new Object[Tam];
    }

    public boolean Inserta(T Dato) {
        if (Llena()) {
            return false;
        }
        if (Fin == Max - 1) {
            Fin = 0;
        } else {
            Fin++;
        }
        C[Fin] = Dato;
        if (Frente == -1) {
            Frente = 0;
        }
        return true;

    }

    public void mostrartodos(ColaCircular co, ColaCircular aux) {
        if (co.Vacia()) {
            System.out.println("Cola Vacia");
        } else {

            while (!co.Vacia()) {
                co.Retira();
                aux.Inserta(co.Dr);
                System.out.println(co.Dr);
            }

            while (!aux.Vacia()) {
                aux.Retira();
                co.Inserta(aux.Dr);

            }
        }
    }

    public boolean Retira() {
        if (Vacia()) {
            return false;
        }
        Dr = C[Frente];
        C[Frente] = null;
        if (Frente == Fin) {
            Frente = Fin = -1;
        } else if (Frente == Max - 1) {
            Frente = 0;
        } else {
            Frente++;
        }
        return true;
    }

    public boolean Llena() {
        return Frente == 0 && Fin == Max - 1 || Fin + 1 == Frente;
    }

    public boolean Vacia() {
        return Frente == -1;
    }

    public T consultaFrente() {
        if (Frente == -1) {
            return null;
        }
        return C[Frente];
    }
}
