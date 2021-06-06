package model;

import java.sql.Date;

public class Receitas {
	
	private int ID;
	private String Nome;
    private Date DataRecebimento;
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
    
    public Date getDataRecebimento() {
        return DataRecebimento;
    }
    
    public void setDataRecebida(Date dataRecebimento, int valor) {
    	
    	Funcoes funcao = new Funcoes();
    	
        this.DataRecebimento = funcao.converteParaDataSQL(funcao.AdicionarDia(dataRecebimento, valor));
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