package model;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Despesas {
	
	private List<Integer> ID = new ArrayList<Integer>();
	private List<String> Nome = new ArrayList<String>();
    private List<Date> DataPagamento = new ArrayList<Date>();
    private List<Date> DataVencimento = new ArrayList<Date>();
    private List<Float> Valor = new ArrayList<Float>();
    private List<Date> Mes = new ArrayList<Date>();
    
    public int posicao;
    
  //------------------------------------------------------------//

    public List<Integer> getID() {
        return ID;
    }
    
    public void setID(int id) {
        this.ID.add(id);
    }
    
    public List<String> getNome() {
        return Nome;
    }
    
    public void setNome(String nome) {
        this.Nome.add(nome);
    }
    
    public List<Date> getDataPagamento() {
        return DataPagamento;
    }
    
    public void setDataPagamento(Date dataPagamento) {
        this.DataPagamento.add(dataPagamento);
    }
    
    public List<Date> getDataVencimento() {
        return DataVencimento;
    }
    
    public void setDataVencimento(Date dataVencimento) {
        this.DataVencimento.add(dataVencimento);
    }
    
    public List<Float> getValor() {
        return Valor;
    }
    
    public void setValor(Float valor) {
        this.Valor.add(valor);
    }
    
    public List<Date> getMes() {
        return Mes;
    }
    
    public void setMes(Date mes) {
        this.Mes.add(mes);
    }
    
}