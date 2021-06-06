<%@page import="DAO.DespesasDAO"%>
<%@page import="model.Despesas"%>
<%@page import="model.Funcoes"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar Despesas</title>
<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
<script type="text/javascript" src="Funcoes.js"></script>
</head>
<body onload="IrParaPaginaPrincipal();">


<%
	try{
		DespesasDAO despesasDao = new DespesasDAO();
		Despesas despesas = new Despesas();
		Funcoes funcao = new Funcoes();
		
		
		if(request.getParameter("nome2") != null && request.getParameter("data2") != null && request.getParameter("data3") != null && request.getParameter("valor2") != null && request.getParameter("ano") != null && request.getParameter("mes") != null){
			 
		    if(request.getParameter("nome2").equals("") && request.getParameter("data2").equals("") && request.getParameter("data3").equals("") && request.getParameter("valor2").equals("") && request.getParameter("ano").equals("") && request.getParameter("mes") != null){
		    	response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		    	
		    }else{
		    	despesas.setNome(request.getParameter("nome2"));
		    	despesas.setDataPagamento(funcao.converteParaDataSQL(request.getParameter("data2")), 0);
		    	despesas.setDataVencimento(funcao.converteParaDataSQL(request.getParameter("data3")), 0);
		    	despesas.setValor(Float.parseFloat(request.getParameter("valor2").replace(",",".")));
		    	despesas.setMes(funcao.converteParaDataSQL(request.getParameter("ano") + "-" + request.getParameter("mes") + "-01"), 0);
		    	
		    	despesasDao.inserir(despesas);
		    	
		    	out.println("<form action=\"PaginaPrincipal.jsp\"  method=\"POST\" autocomplete=\"off\">"+
						"<div class=\"modal1\">" +
						 "<input type=\"text\" value=\""+ request.getParameter("ano") +"\" name=\"ano2\" >" +
							"<input type=\"text\" value=\""+ request.getParameter("mes") +"\" name=\"mes2\" >" +
							"<input type=\"text\" value=\"1\" name=\"despesaOUreceita\" >" +	
							"<input type=\"submit\" id=\"bntSubmitPaginaPrincipal\">"+
						"</div>"+
					"</form>");
		    	
		    }
		}
		else{
			response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		}
		
	}catch(Exception e){ response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo"); }
%>

</body>
</html>