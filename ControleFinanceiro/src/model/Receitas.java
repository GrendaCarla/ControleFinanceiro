package model;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
    
    public void setDataRecebida(Date dataRecebimento) {
        this.DataRecebimento = dataRecebimento;
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
    
    public void setMes(Date mes) {
        this.Mes = mes;
    }
    
    public void converteParaDataSQL(String data) {
    	
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
    	
		try {
			java.sql.Date dataSql = new java.sql.Date(fmt.parse(data).getTime());
			
			this.DataRecebimento = dataSql;
			this.Mes = dataSql; // < --------- mudar isso, esse mes ´q o mes e ano q ta em cima da tela
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	
    }
    
    public String converterData() {
    	
    	String dataNormal = (DataRecebimento+"").substring(8, 10) + " / " + (DataRecebimento+"").substring(5, 7)  + " / " + (DataRecebimento+"").substring(0, 4);
    	
    	return dataNormal;
    }
    
}