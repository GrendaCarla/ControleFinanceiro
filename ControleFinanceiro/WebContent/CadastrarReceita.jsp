<%@page import="DAO.ReceitaDAO"%>
<%@page import="model.Receitas"%>
<%@page import="model.Funcoes"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar Receita</title>
<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
<script type="text/javascript" src="Funcoes.js"></script>
</head>
<body  onload="IrParaPaginaPrincipal();">

<%
	try{
		ReceitaDAO receitaDao = new ReceitaDAO();
		Receitas receitas = new Receitas();
		Funcoes funcao = new Funcoes();
		
		
		if(request.getParameter("nome") != null && request.getParameter("data") != null && request.getParameter("valor") != null && request.getParameter("ano") != null){
			 
		    if(request.getParameter("nome").equals("") && request.getParameter("data").equals("") && request.getParameter("valor").equals("") && request.getParameter("ano").equals("")){
		    	response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		    }else{
		    	receitas.setNome(request.getParameter("nome"));
		    	receitas.setDataRecebida(funcao.converteParaDataSQL(request.getParameter("data")), 0);
		    	receitas.setValor(Float.parseFloat(request.getParameter("valor").replace(",",".")));
		    	receitas.setMes(funcao.converteParaDataSQL(request.getParameter("ano") + "-" + request.getParameter("mes") + "-01"), 0);
		    	
		    	receitaDao.inserir(receitas);
		    	
		    	
		    	out.println("<form action=\"PaginaPrincipal.jsp\"  method=\"POST\" autocomplete=\"off\">"+
					"<div class=\"modal1\">" +
					 "<input type=\"text\" value=\""+ request.getParameter("ano") +"\" name=\"ano2\" >" +
						"<input type=\"text\" value=\""+ request.getParameter("mes") +"\" name=\"mes2\" >" +
						"<input type=\"submit\" id=\"bntSubmitPaginaPrincipal\">"+
					"</div>"+
				"</form>");
		    	
		    }
		}
		else{
			response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		}
		
	}catch(Exception e){ 
		response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
	}
%>

</body>
</html>