package model;

import java.sql.Date;

public class Despesas {
	
	private int ID;
	private String Nome;
    private Date DataPagamento;
    private Date DataVencimento;
    private Float Valor;
    private Date Mes;
    
    public int posicao;
    
  //------------------------------------------------------------//

    public int getID() {
        return ID;
    }
    
    public void setID(int id) {
        this.ID =id;
    }
    
    public String getNome() {
        return Nome;
    }
    
    public void setNome(String nome) {
        this.Nome = nome;
    }
    
    public Date getDataPagamento() {
        return DataPagamento;
    }
    
    public void setDataPagamento(Date dataPagamento, int valor) {
    	
    	Funcoes funcao = new Funcoes();
    	
        this.DataPagamento = funcao.converteParaDataSQL(funcao.AdicionarDia(dataPagamento, valor));
    }
    
    public Date getDataVencimento() {
        return DataVencimento;
    }
    
    public void setDataVencimento(Date dataVencimento, int valor) {
    	
    	Funcoes funcao = new Funcoes();
    	
        this.DataVencimento = funcao.converteParaDataSQL(funcao.AdicionarDia(dataVencimento, valor));
    }
    
    public Float getValor() {
        return Valor;
    }
    
    public void setValor(Float valor) {
        this.Valor = valor;
    }
    
    public Date getMes() {
        return Mes;
    }
    
    public void setMes(Date mes, int valor) {
    	
    	Funcoes funcao = new Funcoes();
    	
        this.Mes = funcao.converteParaDataSQL(funcao.AdicionarDia(mes, valor));
    }
    

}