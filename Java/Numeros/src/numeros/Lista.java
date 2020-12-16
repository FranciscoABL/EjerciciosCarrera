/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package numeros;

public class Lista<T>  {
	private Nodo<T> Frente;
	private Nodo<T> Fin;

	public T        Dr;
	
	public Lista(){
		Frente=Fin=null;
		Dr=null;
	}
	
    public Nodo<T> DameFrente(){
       return Frente;
    }                    
    public Nodo<T> DameFin(){
	return Fin;
    }
	
        
	public boolean InsertaDato(T Dato){
            Nodo<T> Nuevo=new Nodo<T>(Dato);
		if(Nuevo==null)
			return false;
		if(Frente==null){
			Frente=Fin=Nuevo;
			return true;
		}
		Nuevo.setSig(Frente);
		Frente=Nuevo;
		return true;
	}
	
	public int contar(){
            Nodo<T> Aux  = Frente;
            int contador=0;
		while(Aux!=null){
			Aux=Aux.DameSig();
                        contador++;
		}
                return contador;
        }
        public boolean Retira(T dato){
            Nodo<T>Tra=Frente,Ant=null;
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
                    return true;
                }
            }
                if(Fin==Tra){
                  Fin=Ant; 
                  Fin.setSig(null);
                  return true;
                }
                Ant.setSig(Tra.DameSig());
                return true;
            }
        }
	public boolean buscar(T dato){
            Nodo<T> Aux  = Frente;
          boolean bandera=false;
		while(Aux!=null){
                    if(Aux.Info.equals(dato)){
                        bandera=true;
                        break;
                    }else{
			Aux=Aux.DameSig();
                    }
        }
                return bandera;
        }
	public boolean vacia(){
            if(Frente==null&&Fin==null){
                return true;
            }
            return false;
        }
	public boolean InsertaFin(T Dato){
		Nodo<T> Nuevo=new Nodo<T>(Dato);
		if(Nuevo==null)       ///para ver si hay memoria
			return false;
		if(Frente==null){
			Frente=Fin=Nuevo;
			return true;
		}
		Fin.setSig(Nuevo);
		Fin=Nuevo;
		return true;
		}
	// info guarda la informacion
	public void EstadoActual(){
		boolean band= false;
		Nodo<T> Aux  = Frente;
		while(Aux!=null){
			System.out.println(Aux.Info);
			Aux=Aux.DameSig();
		}
	}
        public boolean InsertarOrdenado(T Dato){
            Nodo<T> Tra,Ant;
            Nodo<T> Nuevo=new Nodo<T>(Dato);
              if(Nuevo==null){
                  return false;
          }else{       
        if (Frente==null) {
            Frente=Fin=Nuevo;
            return true;
        } else {
            ordena();
           if (Nuevo.compareTo(Frente)<0){//si el nuevo dato va antes del frente actual entonces se coloca antes del frente
                Nuevo.setSig(Frente);
                Frente=Nuevo;
                return true;//se acompleta
            } else {//si no va antes entonces es de mayor procedencia el frente
               Tra=Frente;//se inicializa los nodos con los dos apuntadores al frente
               Ant=Frente;
                  while((Nuevo.compareTo(Tra)>=0&&Tra.DameSig()!=null)) {//mientras el nuevo dato sea menos del frente y el siguiente del frente no sea nulo entonces se van intercalando el ant y el tra
                    Ant=Tra;
                    Tra=Tra.DameSig();
                }
                }
               if (Nuevo.compareTo(Tra)>0) {
                    Tra.setSig(Nuevo);//si va despues del fin el valor se inserta en el nuevo fin
                    return true;
                } else {
                    Nuevo.setSig(Tra);//si no va despues va antes en un termino medio el cual el ant y el tra ya estan recorridos hasta esa posicion donde ira ya que el while recorrio hasta encontrar un lugar para el dato asi que nuevo apunta a tra y ant a nuevo ya que esta entre los dos
                    Ant.setSig(Nuevo);
                    return true;
                }
            }
            
        }
              }
        
        public void ordena(){//Ordena los datos
            Nodo<T>Tra=Frente;
            Nodo<T>Aux=Frente.DameSig();
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

        





          

