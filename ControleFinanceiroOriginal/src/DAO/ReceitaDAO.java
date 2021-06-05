package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Receitas;
import util.Conexao;

public class ReceitaDAO {
    private final Connection conn;
    public ReceitaDAO(){
       conn=new Conexao().retornaConexao();
    }
     public void inserir(Receitas a){
        PreparedStatement stmt;
        try{
            stmt=conn.prepareStatement(
              "insert into Receitas(Nome, DataRecebimento, Valor, Mes) values(?,?,?,?)");
            stmt.setString(1,a.getNome());
            stmt.setDate(2, a.getDataRecebimento());
            stmt.setFloat(3,a.getValor());
            stmt.setDate(4, a.getMes());
            stmt.execute();
            stmt.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
     
     public void alterar(Receitas a){
         PreparedStatement stmt;
         try{
             stmt=conn.prepareStatement(
               "update Receitas set Nome=?, DataRecebimento=?,"+
               "Valor=?, Mes=? where ID=?");
             stmt.setString(1,a.getNome());
             stmt.setDate(2, a.getDataRecebimento());
             stmt.setFloat(3,a.getValor());
             stmt.setDate(4, a.getMes());
             stmt.setInt(5,a.getID());
             stmt.execute();
             stmt.close();
         }catch(Exception e){
             System.out.println(e.getMessage());
         }
     }
     
     public void excluir(Receitas a){
         PreparedStatement stmt;
         try{
             stmt=conn.prepareStatement(
               "delete from Receitas where ID=?");
             stmt.setInt(1,a.getID());
             stmt.execute();
             stmt.close();
         }catch(Exception e){
             System.out.println(e.getMessage());
         }
     }
     
     public ArrayList<Receitas> buscarTodos(){
         ArrayList<Receitas> lista = new ArrayList<>();
         ResultSet rs;
         Statement st;
         try{
            st=conn.createStatement();
            rs=st.executeQuery("select * from Receitas");
            while(rs.next()){
                Receitas a = new Receitas();
                a.setID(rs.getInt("ID"));
                a.setNome(rs.getString("Nome"));
                a.setDataRecebida(rs.getDate("DataRecebimento"));
                a.setValor(rs.getFloat("Valor"));
                a.setMes(rs.getDate("Mes"));
                lista.add(a);
            }
         }catch(Exception e){
            System.out.println(e.getMessage());
         }
         return lista;
     }
     
     public Receitas buscarId(Receitas a){
         ResultSet rs;
         Statement st;
         try{
            st=conn.createStatement();
            rs=st.executeQuery("select * from Receitas "+
                    "where ID="+a.getID());
            rs.next();
            a.setID(rs.getInt("ID"));
            a.setNome(rs.getString("Nome"));
            a.setDataRecebida(rs.getDate("DataRecebimento"));
            a.setValor(rs.getFloat("Valor"));
            a.setMes(rs.getDate("Mes"));
         }catch(Exception e){
            System.out.println(e.getMessage());
         }
         return a;
     }
 }