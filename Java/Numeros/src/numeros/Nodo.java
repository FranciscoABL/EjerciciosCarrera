
package numeros;
public class Nodo<T> implements Comparable<Nodo>
{
   public T Info;
   private Nodo<T>   Sig;
   public Nodo(T d)
   {  Info=d;
      Sig=null;
   }
   public Nodo<T> DameSig(){
      return Sig; // regresa enlace o referencia, apuntador al siguiente nodo
   }
   public void setSig(Nodo<T> Ap){
	 Sig=Ap;
   }
  

    public String toString() {
        return Info.toString();
    }
    public int compareTo(Nodo o) {
        int n=0;
    
        if (o.Info instanceof String){
            n= this.Info.toString().compareToIgnoreCase(o.Info.toString());
        }
        if(o.Info instanceof Integer){
              Integer Nuevo=(Integer)o.Info;
              Integer Valor =(Integer)this.Info;
             n= Valor.compareTo(Nuevo);
                }   
        return n;
}
    
}
