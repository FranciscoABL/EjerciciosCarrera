/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numeros;
    public class NodoDBL<T> {
	private NodoDBL<T> Ant;
	public T Info;
	private NodoDBL<T> Sig;

	public NodoDBL(T D) {
		Info = D;
		Ant = null;
		Sig = null;
	}

	public NodoDBL<T> DameAnt() {
		return Ant;
	}

	public NodoDBL<T> DameSig() {
		return Sig;
	}

	public void setSiguiente(NodoDBL<T> Ap) {
		Sig = Ap;
	}

	public void setAnterior(NodoDBL<T> Ant) {
		this.Ant = Ant;
	
                
}
    public int compareTo(NodoDBL o) {
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
    public String toString() {
        return "Info= "+ Info;
    }
    }

