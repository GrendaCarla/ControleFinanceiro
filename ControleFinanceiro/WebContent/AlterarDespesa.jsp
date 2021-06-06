<%@page import="DAO.DespesasDAO"%>
<%@page import="model.Despesas"%>
<%@page import="model.Funcoes"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alterar Despesa</title>
<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
<script type="text/javascript" src="Funcoes.js"></script>
</head>
<body  onload="IrParaPaginaPrincipal();">

<%
	try{
		DespesasDAO despesasDao = new DespesasDAO();
		Despesas despesas = new Despesas();
		Funcoes funcao = new Funcoes();
		
    	
		
		if(request.getParameter("idAlterar2") != null && request.getParameter("nomeAlterar2") != null && request.getParameter("dataAlterar2") != null && request.getParameter("dataAlterar3") != null  && request.getParameter("valorAlterar2") != null  && request.getParameter("mesAlterar2") != null){
			
		    if(!request.getParameter("idAlterar2").equals("") && !request.getParameter("nomeAlterar2").equals("") && !request.getParameter("dataAlterar2").equals("") && !request.getParameter("dataAlterar3").equals("") && !request.getParameter("valorAlterar2").equals("") && !request.getParameter("mesAlterar2").equals("")){
				
		    	despesas.setID(Integer.parseInt(request.getParameter("idAlterar2")));
		    	despesas.setNome(request.getParameter("nomeAlterar2"));
		    	despesas.setDataPagamento(funcao.converteParaDataSQL(request.getParameter("dataAlterar2")), 0);
		    	despesas.setDataVencimento(funcao.converteParaDataSQL(request.getParameter("dataAlterar3")), 0);
		    	despesas.setValor(Float.parseFloat(request.getParameter("valorAlterar2").replace(",",".")));
		    	despesas.setMes(funcao.converteParaDataSQL(request.getParameter("mesAlterar2")), 0);
		    	
		    	despesasDao.alterar(despesas);
		    	despesasDao.buscarId(despesas);

		    	out.println("<form action=\"PaginaPrincipal.jsp\"  method=\"POST\" autocomplete=\"off\">"+
						"<div class=\"modal1\">" +
						 "<input type=\"text\" value=\""+ (despesas.getMes()+"").substring(0, 4) +"\" name=\"ano2\" >" +
							"<input type=\"text\" value=\""+ (despesas.getMes()+"").substring(5, 7) +"\" name=\"mes2\" >" +
							"<input type=\"text\" value=\"1\" name=\"despesaOUreceita\" >" +		
							"<input type=\"submit\" id=\"bntSubmitPaginaPrincipal\">"+
						"</div>"+
					"</form>");
		    }
		    else{
		    	response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		    }
		    
		}else{
			response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		}
	}catch(Exception e){response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");}
%>

</body>
</html>