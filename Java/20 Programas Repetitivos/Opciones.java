import java.util.*;
public class Opciones {
    public static void main(String[] args) {
        int opcion=1;
        Scanner leer = new Scanner(System.in);
          while(opcion!=0){
          System.out.println("Seleccione el area que desea sacar");
          System.out.println("Numero ---> 1  Triangulo");
          System.out.println("Numero ---> 2  Cuadrado");
          System.out.println("Numero ---> 3  Circulo");
          System.out.println("Numero ---> 4  Rectangulo");
          System.out.println("Numero ---> 0  Salir");
          
        opcion = leer.nextInt();
        switch (opcion)
        {
                case 1: System.out.println("Triangulo");
            System.out.println("Base del triangulo");
            double base =leer.nextDouble();
            System.out.println("Altura");
            double altura =leer.nextDouble();
            double area=(base*altura)/2;
            System.out.println("El area del triangulo es---->"+area);
            break;
                case 2: System.out.println("Cuadrado");
               System.out.println("Lado del cuadrado");
               double lado =leer.nextDouble();
               double area2=lado*lado;
            System.out.println("El area del cuadrado es---->"+area2);
                           break;
                case 3: System.out.println("Circulo");
    System.out.println("radio del circulo");
            double radio =leer.nextDouble();
            double area3=(3.1416*(radio*radio));
            System.out.println("El area del triangulo es---->"+area3);
                           break;
                case 4: System.out.println("Rectangulo");
    System.out.println("Base del Rectangulo");
            double base4 =leer.nextDouble();
            System.out.println("Altura");
            double altura4 =leer.nextDouble();
            double area4=(base4*altura4);
            System.out.println("El area del triangulo es---->"+area4);
                           break;
          }                      
       }
    }
}