package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	private String db="";
    private String user="";
    private String senha="";
    private String servidor=""; //"localhost";
    
    private final String URL =
            "jdbc:mysql://"+ this.servidor +"/"+ this.db +"?useTimezone=true&serverTimezone=UTC"; 
    
    public Connection retornaConexao(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL,
            		this.user,this.senha);
        }catch(ClassNotFoundException 
            | SQLException e){
            System.out.println("Erro de Conexão: "+e.getMessage());
            return null;
        }
    }
}