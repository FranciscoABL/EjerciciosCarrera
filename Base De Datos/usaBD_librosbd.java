
//ejemplo uno conectarse a la base de datos y 
//realizar consulta sencilla.

import java.io.*;
import java.sql.*;

public class usaBD_librosbd {
   
      Connection con = null;
      ResultSet rs = null;
      PreparedStatement stmt = null;
      LibrosBD Lb=null;
      int total_libros;

usaBD_librosbd()
{
Lb= new LibrosBD();
conectarse();
total_libros=0;
}// fin del constructor
 

public void conectarse()
  {

    try {  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
           con = DriverManager.getConnection("jdbc:odbc:ejemplo", "sa", "");
           
        } catch (Exception e) {
             System.out.println("no me puedo conectar a la base de datos.");
             }

  }

public void consultar(String titulo)
 { 	
 
   String sql= " select bookid,title,firstaname,surname,price,year,description from  libros where title=? ";
  // String sql= " select bookid,title,firstaname,surname,price,year,description from libros ";
 try{   
  stmt=con.prepareStatement(sql);
  stmt.setString(1,titulo);
  rs=stmt.executeQuery();
  while (rs.next()) {
  			total_libros++;
            String bookId = rs.getString("bookid");
            String title=rs.getString("title");
            String firstName = rs.getString("firstaname");;
 			String surname = rs.getString("surname");;;
 			float price = rs.getFloat("price");;
 			int year = rs.getInt("year");
 			String description = rs.getString("description");
 			Lb.Altas_libros(bookId,firstName,surname,title,price,year,description);
 			System.out.println(total_libros);
         }
  }//fin de try
     catch (Exception e) {
             System.out.println("error");
             }

 }

public BookDetails[] libros_ordenados()
{
	BookDetails [] books= Lb.regresa_libros_ordenados();
     return books;
}

public BookDetails datos_libro_seleccionado(String libro)
{
	return Lb.mostrar_datos_libro(libro);
}	
public int total_libros()
{
	return total_libros;
}

//public static void main(String args[])
//{usaBD_librosbd l= new usaBD_librosbd();

//l.consultar("Bases de datos");
//}
}//fin de la clase
