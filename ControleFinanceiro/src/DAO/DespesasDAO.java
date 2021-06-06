package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.Despesas;
import util.Conexao;

public class DespesasDAO {
    private final Connection conn;
    public DespesasDAO(){
       conn=new Conexao().retornaConexao();
    }
     public void inserir(Despesas a){
        PreparedStatement stmt;
        try{
            stmt=conn.prepareStatement(
              "insert into Despesas(Nome, DataPagamento, DataVencimento, Valor, Mes) values(?,?,?,?,?)");
            stmt.setString(1,a.getNome());
            stmt.setDate(2, a.getDataPagamento());
            stmt.setDate(3, a.getDataVencimento());
            stmt.setFloat(4,a.getValor());
            stmt.setDate(5, a.getMes());
            stmt.execute();
            stmt.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
     
     public void alterar(Despesas a){
         PreparedStatement stmt;
         try{
             stmt=conn.prepareStatement(
               "update Despesas set Nome=?, DataPagamento=?, DataVencimento=?,"+
               "Valor=?, Mes=? where ID=?");
             stmt.setString(1,a.getNome());
             stmt.setDate(2, a.getDataPagamento());
             stmt.setDate(3, a.getDataVencimento());
             stmt.setFloat(4,a.getValor());
             stmt.setDate(5, a.getMes());
             stmt.setInt(6,a.getID());
             stmt.execute();
             stmt.close();
         }catch(Exception e){
             System.out.println(e.getMessage());
         }
     }
     
     public void excluir(Despesas a){
         PreparedStatement stmt;
         try{
             stmt=conn.prepareStatement(
               "delete from Despesas where ID=?");
             stmt.setInt(1,a.getID());
             stmt.execute();
             stmt.close();
         }catch(Exception e){
             System.out.println(e.getMessage());
         }
     }
     
     public ArrayList<Despesas> buscarTodos(){
         ArrayList<Despesas> lista = new ArrayList<>();
         ResultSet rs;
         Statement st;
         try{
            st=conn.createStatement();
            rs=st.executeQuery("select * from Despesas");
            while(rs.next()){
                Despesas a = new Despesas();
                a.setID(rs.getInt("ID"));
                a.setNome(rs.getString("Nome"));
                a.setDataPagamento(rs.getDate("DataPagamento"),1);
                a.setDataVencimento(rs.getDate("DataVencimento"),1);
                a.setValor(rs.getFloat("Valor"));
                a.setMes(rs.getDate("Mes"),1);
                lista.add(a);
            }
         }catch(Exception e){
            System.out.println(e.getMessage());
         }
         return lista;
     }
     
     public Despesas buscarId(Despesas a){
         ResultSet rs;
         Statement st;
         try{
            st=conn.createStatement();
            rs=st.executeQuery("select * from Despesas "+
                    "where ID="+a.getID());
            rs.next();
            a.setID(rs.getInt("ID"));
            a.setNome(rs.getString("Nome"));
            a.setDataPagamento(rs.getDate("DataPagamento"),1);
            a.setDataVencimento(rs.getDate("DataVencimento"),1);
            a.setValor(rs.getFloat("Valor"));
            a.setMes(rs.getDate("Mes"),1);
         }catch(Exception e){
            System.out.println(e.getMessage());
         }
         return a;
     }
 }