/*Autor Francisco Antonio Barraza Lugo*/
package proyectobanco;

public class ProyectoBanco {

    ColaCircular<Cliente> cola = new ColaCircular<Cliente>();//cola principal
    ColaCircular<Cliente> auxiliar = new ColaCircular<Cliente>();//cola auxiliar para clientes
    ColaCircular<Cliente> Prefe = new ColaCircular<Cliente>();//cola para los clientes con preferencia
    int turno = 0, preferencia = 0, normal = 0, deposito = 0, retiro = 0, movimientos = 0;
    double importedeposito = 0, importeretiro = 0;
    int n = 0;
    boolean bandera = false;//bandera para terminar el programa

    public static void main(String[] args) {
        ProyectoBanco p = new ProyectoBanco();
        p.menu();
    }

    public void menu() {
        while (!bandera) {
            System.out.println("-----------------Banco---------------");
            System.out.println("Opcion 1:Registro de Clientes (Hacer cola)");
            System.out.println("Opcion 2:Atender Clientes");
            System.out.println("Opcion 3:Mostrar Clientes en la Cola");
            System.out.println("Opcion 4:Cerrar Banco");
            n = Keyboard.readInt();
            System.out.println("Opcion----> " + n);
            if (n > 5 || n < 0) {
                System.out.println("Esa Opcion no esta digite de nuevo");
            }
            switch (n) {
                case 1:
                    registroDeClientes();
                    break;
                case 2:
                    atender();
                    break;
                case 3:
                    mostrar();
                    break;
                case 4:
                    cerrarbanco();
                    break;

            }
        }
    }

    public void registroDeClientes() {
        if (cola.Llena()) {
            System.out.println("Cola Llena");
        } else {

            String tipodecliente = " ";
            String movimiento = " ";
            double importe = 0;
            turno++;
            System.out.println("Turno: " + turno);
            System.out.println("Tipo De Cliente: 1-Normal  2-Preferencial");
            int tipo = Keyboard.readInt();
            while (tipo <= 0 || tipo > 2) {
                System.out.println("Tipo De Cliente: 1-Normal  2-Preferencial");
                tipo = Keyboard.readInt();
            }
            if (tipo == 1) {
                tipodecliente = "Normal";
            } else {
                tipodecliente = "Preferencial";
            }
            System.out.println("Movimiento: 1-Deposito 2-Retiro");
            int movi = Keyboard.readInt();
            while (movi <= 0 || movi > 2) {
                System.out.println("Movimiento: 1-Deposito 2-Retiro");
                movi = Keyboard.readInt();
            }
            if (movi == 1) {
                movimiento = "Deposito";
            } else {
                movimiento = "Retiro";
            }
            System.out.println("Cantidad A Retirar o Depositar (Maximo 10000)");
            importe = Keyboard.readDouble();
            while (importe <= 0 || importe > 10000) {
                System.out.println("Cantidad A Retirar o Depositar (Maximo 10000)");
                importe = Keyboard.readDouble();
            }
            Cliente c = new Cliente(turno, tipodecliente, movimiento, importe);
            cola.Inserta(c);

            System.out.println("Cliente Registrado espere en la cola porfavor");
        }
    }

    public void preferencia() {//Ordeno La cola de clientes si existe un cliente con tarjeta preferencial pues el se coloca primero en la cola si no hay nadie todo sigue normal
        while (!cola.Vacia()) {
            cola.Retira();
            if (cola.Dr.getTipoDeCliente().equals("Preferencial")) {//si es preferencial lo guardo en una tercera cola para, como diciendo vengan para aca en una caja especial
                Prefe.Inserta(cola.Dr);//se inserta en la cola de preferentes
            } else {
                auxiliar.Inserta(cola.Dr);//si no es preferencial continua normal
            }
        }
        while (!Prefe.Vacia()) {//si hay datos en la cola con clientes preferentes se colocan primero en la cola principal si no llega a ver no pasa nada todo sigue igual
            Prefe.Retira();
            cola.Inserta(Prefe.Dr);
        }
        while (!auxiliar.Vacia()) {//los clientes normales se colocan despues de los clientes con preferencia 
            auxiliar.Retira();
            cola.Inserta(auxiliar.Dr);
        }
    }

    public void atender() {
        if (cola.Vacia()) {
            System.out.println("No Hay Clientes");
        } else {
            preferencia();//se ordena si llega a ver clientes con preferencia
            cola.Retira();
            movimientos++;
            System.out.println("Atendiendo  a:" + cola.Dr);
            if (cola.Dr.getMovimiento().equals("Retiro")) {
                retiro++;
                importeretiro += cola.Dr.getImporte();
            }
            if (cola.Dr.getMovimiento().equals("Deposito")) {
                deposito++;
                importedeposito += cola.Dr.getImporte();
            }
            if (cola.Dr.getTipoDeCliente().equals("Preferencial")) {
                preferencia++;
            }
            if (cola.Dr.getTipoDeCliente().equals("Normal")) {
                normal++;
            }

        }
    }

    public void mostrar() {
        if (cola.Vacia()) {
            System.out.println("No hay clientes");
        } else {
            System.out.println("--------------Cola De Clientes--------------");
            cola.mostrartodos(cola, auxiliar);
        }
    }

    public void cerrarbanco() {
        if (cola.Vacia()) {
            System.out.printf("%-30s\n%-30s\n ", "TotalDeMovimientos", movimientos);
            System.out.printf("%-30s%-30s\n", "Depositos", "ImporteDepositos");
            System.out.printf("%-30s%-30s\n", deposito, importedeposito);
            System.out.printf("%-30s%-30s\n", "Retiro", "ImporteRetiro");
            System.out.printf("%-30s%-30s\n", retiro, importeretiro);
            System.out.printf("%-60s\n", "Cantidad De Preferentes Atendidos");
            System.out.printf("%-60s\n", preferencia);
            System.out.println("Para Salir teclee 1:Salir | Para Continuar Teclee cualquier numero:Continuar....");
            int salir = Keyboard.readInt();
            if (salir == 1) {
                bandera = true;
            } else {
                System.out.println("Continua...");
            }
        } else {
            System.out.println("Aun quedan clientes no puedes cerrar");  //si no esta vacia la cola debera atender a los clientes ya formados
        }
    }
}
