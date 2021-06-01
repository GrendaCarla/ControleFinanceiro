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
            stmt.setString(1,a.getNome().get(a.posicao));
            stmt.setDate(2, a.getDataPagamento().get(a.posicao));
            stmt.setDate(3, a.getDataVencimento().get(a.posicao));
            stmt.setFloat(4,a.getValor().get(a.posicao));
            stmt.setDate(5, a.getMes().get(a.posicao));
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
             stmt.setString(1,a.getNome().get(a.posicao));
             stmt.setDate(2, a.getDataPagamento().get(a.posicao));
             stmt.setDate(3, a.getDataVencimento().get(a.posicao));
             stmt.setFloat(4,a.getValor().get(a.posicao));
             stmt.setDate(5, a.getMes().get(a.posicao));
             stmt.setInt(6,a.getID().get(a.posicao));
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
             stmt.setInt(1,a.getID().get(a.posicao));
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
                a.setDataPagamento(rs.getDate("DataPagamento"));
                a.setDataVencimento(rs.getDate("DataVencimento"));
                a.setValor(rs.getFloat("Valor"));
                a.setMes(rs.getDate("Mes"));
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
                    "where ID="+a.getID().get(a.posicao));
            rs.next();
            a.setID(rs.getInt("ID"));
            a.setNome(rs.getString("Nome"));
            a.setDataPagamento(rs.getDate("DataPagamento"));
            a.setDataVencimento(rs.getDate("DataVencimento"));
            a.setValor(rs.getFloat("Valor"));
            a.setMes(rs.getDate("Mes"));
         }catch(Exception e){
            System.out.println(e.getMessage());
         }
         return a;
     }
 }