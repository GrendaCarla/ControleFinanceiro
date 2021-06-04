package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    private static final String URL =
            "jdbc:mysql://127.0.0.1:3306/ControleFinanceiro?useTimezone=true&serverTimezone=UTC"; 
    // se der erro coloca o nome do servidor em minusculo
    public Connection retornaConexao(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL,
                "root","Doctor Who1");
        }catch(ClassNotFoundException 
            | SQLException e){
            System.out.println("Erro de Conexão: "+e.getMessage());
            return null;
        }
    }
}