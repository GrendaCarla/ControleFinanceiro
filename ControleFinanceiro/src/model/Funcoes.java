package model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;

public class Funcoes {

	public java.sql.Date converteParaDataSQL(String data) {
	    	
		
    	DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
    	
		try {
			java.sql.Date dataSql = new java.sql.Date(fmt.parse(data).getTime());

			return dataSql;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		DateFormat fmt2 = new SimpleDateFormat("dd/MM/yyyy");
    	
		try {
			java.sql.Date dataSql = new java.sql.Date(fmt2.parse(data).getTime());
			
			return dataSql;
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return new java.sql.Date(new java.util.Date().getTime());
    	
    }

    
    
    public String AdicionarDia(Date data, int valor) {
        String DataAlterada = "";
        String FormatoDaData = "yyyy-MM-dd";
        
        
        try {
        	java.util.Date utilDate = new java.util.Date (data.getTime ());
        	
            
            Calendar ob = Calendar.getInstance();
            ob.setTime(utilDate);
            ob.add(Calendar.DATE, valor);

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(FormatoDaData);
            DataAlterada = simpleDateFormat.format(ob.getTime());
            
            
        } catch (Exception e) {
            return "Data Inválida";//caso passe a data fora do formato
        }
        
        return DataAlterada;

    }
	    

    public String FormatarValor (float valor) {

	    NumberFormat formatter = new DecimalFormat("0.00");
		
	    return formatter.format(valor);
    }
    
    public String PegarDataAtual() {
    	LocalDate dataAtual = LocalDate.now();
    	String data = dataAtual+"";
    	
    	return data;
    }
    
    
    public String converterData(java.sql.Date DataRecebimento) {
    	
    	String dataNormal = (DataRecebimento+"").substring(8, 10) + " / " + (DataRecebimento+"").substring(5, 7)  + " / " + (DataRecebimento+"").substring(0, 4);
    	
    	return dataNormal;
    }

    
    public String formatarData(java.sql.Date Data) {
    	
    	String dataNormal = (Data+"").substring(8, 10) + "/" + (Data+"").substring(5, 7)  + "/" + (Data+"").substring(0, 4);
    	
    	return dataNormal;
    }
    
}
