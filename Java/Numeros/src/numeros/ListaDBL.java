/*
Autor:Francisco Antonio Barraza Lugo
 */
package numeros;
public class ListaDBL<T> {
      private NodoDBL<T> Frente;
	private NodoDBL<T> Fin;
	public T Dr;

	public ListaDBL() {
		Frente = Fin = null;
		Dr = null;
	}

	public NodoDBL<T> DameFrente() {
		return Frente;
	}

	public NodoDBL<T> DameFin() {
		return Fin;
	
        }
        public int contar(){
            NodoDBL<T> Aux  = Frente;
            int contador=0;
		while(Aux!=null){
			Aux=Aux.DameSig();
                        contador++;
		}
                return contador;
        }
	public boolean InsertaFre(T Dato) {
		NodoDBL<T> Nuevo = new NodoDBL<T>(Dato);
		if (Nuevo == null)
			return false;
		
		if (Frente == null) {
			Frente = Fin = Nuevo;
			return true;
		}
		Nuevo.setSiguiente(Frente);
		Frente.setAnterior(Nuevo);
		Frente = Nuevo;
		return true;
	}

	public boolean InsertaFin(T Dato) {
		NodoDBL<T> Nuevo = new NodoDBL<T>(Dato);
		if (Nuevo == null)
			return false;
		
		if (Frente == null) {
			Frente = Fin = Nuevo;
			return true;
		}
		
		Nuevo.setAnterior(Fin);
		Fin.setSiguiente(Nuevo);
		Fin = Nuevo;
		return true;
	}
         public boolean vacia(){
            if(Frente==null&&Fin==null){
                return true;
            }
            return false;
        }
         public void EstadoActual(){
		boolean band= false;
		NodoDBL<T> Aux  = Frente;
		while(Aux!=null){
			System.out.println(Aux.Info);
			Aux=Aux.DameSig();
		}
	}
	public boolean Retira(T dato){
            NodoDBL<T>Tra=Frente,Ant=null;
            boolean bandera=false;
            if(vacia()){
                return false;
            }else{
            while(Tra!=null){
                if(Tra.Info.equals(dato)){
                    bandera=true;
                    Dr=dato;
                    break;
                }
                Ant=Tra;
                Tra=Tra.DameSig();
            }
            if(bandera==false){
                return false;
            }
            if(Tra==Frente){
                if(Frente==Fin){
                    Frente=Fin=null;
                    return true;
                }else{
                    Frente=Frente.DameSig();
                    Frente.setAnterior(null);
                    return true;
                }
            }
                if(Fin==Tra){
                  Fin=Ant; 
                  Fin.setSiguiente(null);
                  Fin.setAnterior(Fin.DameAnt());
                  return true;
                }
                
                Ant.setSiguiente(Tra.DameSig());
                Tra.DameSig().setAnterior(Ant);
                Tra.setSiguiente(Tra.DameSig());
                Tra.setAnterior(null);
                return true;
            }
        }
        public boolean insertaordeando(T Dato){
            NodoDBL<T> Tra,Ant;
            NodoDBL<T> Nuevo=new NodoDBL<T>(Dato);
              if(Nuevo==null){
                  return false;
          }else{       
        if (Frente==null) {
            Frente=Fin=Nuevo;
            return true;
        } else {
            ordena();
             if (Nuevo.compareTo(Frente)<0){//si el nuevo dato va antes del frente actual entonces se coloca antes del frente
                Nuevo.setSiguiente(Frente);
		Frente.setAnterior(Nuevo);
                Frente=Nuevo;
                return true;//se acompleta
            } else {//si no va antes entonces es de mayor procedencia el frente
               Tra=Frente;//se inicializa los nodos con los dos apuntadores al frente auque podria ser el ant null
               Ant=Frente;
                  while((Nuevo.compareTo(Tra)>=0&&Tra.DameSig()!=null)) {//mientras el nuevo dato sea menos del frente y el siguiente del frente no sea nulo entonces va intercalando el ant y el tra cambiando los valores
                    Ant=Tra;
                    Tra=Tra.DameSig();
                }
                }
               if(Nuevo.compareTo(Tra)>0) {//si el nuevo dato va despues del dato donde apunta el Tra quiere decir que este ira al fin asi que se inserta al fin
                Tra.setSiguiente(Nuevo);
                Nuevo.setAnterior(Tra);
                Fin=Nuevo;
                    return true;
                } else {
                    Nuevo.setSiguiente(Tra);//Este paso ya es por si va antes del fin en un termino medio donde el ant y el tra apuntan al nuevo y el nuevo a ambos estara en medio de los dos
                    Nuevo.setAnterior(Ant);
                    Ant.setSiguiente(Nuevo);
                    Tra.setAnterior(Nuevo);
                    return true;
                }
            }
            
        }
              }
        
	public boolean Busca(T Dato) {
		String IdBusco = Dato.toString();
		NodoDBL<T> Aux = Frente;
		NodoDBL<T> Ant = null;
		boolean Band = false;

		while (Aux != null) {
			if (IdBusco.compareTo(Aux.Info.toString()) == 0) {
				Band = true;
				Dr = Aux.Info;
				break;
			}
			Ant = Aux;
			Aux = Aux.DameSig();
		}
		return Band;
}
        public void recorre(int n){
           NodoDBL<T>Aux=Frente;
           if(n==2)
              Aux=Fin;
           while(Aux!=null){
               String valor=Aux.Info.toString();
               System.out.println(valor);
               if(n==1)
                   Aux=Aux.DameSig();
               else
                   Aux=Aux.DameAnt();
           }
        }
              
        public void ordena(){//Ordena los datos
            NodoDBL<T>Tra=Frente;
            NodoDBL<T>Aux=Frente.DameSig();
            T Tem;
            while(Aux!=null){
                while(Aux!=null){
                   if(Tra.compareTo(Aux)>0){
                        Tem=Tra.Info;//Guardo la informacion del Frente que se esta comparando
                        Tra.Info=Aux.Info;//Como el dato se debe cambiar la informacion del frente pasa a ser la siguiente informacion a la que apunta
                        Aux.Info=Tem;//Y la informacion que contiene el nodo siguiente es ahora el anteriorior es como un intercambio entre ellos
                    }
                    Aux=Aux.DameSig();
                }
                Tra=Tra.DameSig();
                Aux=Tra.DameSig();      
            }
        }
  

         
}

