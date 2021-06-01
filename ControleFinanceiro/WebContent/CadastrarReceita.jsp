<%@page import="DAO.ReceitaDAO"%>
<%@page import="model.Receitas"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastrar Receita</title>
</head>
<body>

<%
	try{
		ReceitaDAO receitaDao = new ReceitaDAO();
		Receitas receitas = new Receitas();
		
	    if(request.getParameter("nome").equals("")){
	    	response.sendRedirect("PaginaPrincipal.jsp");
	    }else{
	    	receitas.setNome(request.getParameter("nome"));
	    	receitas.converteParaDataSQL(request.getParameter("data"));
	    	receitas.setValor(Float.parseFloat(request.getParameter("valor")));
	    	receitaDao.inserir(receitas);
	    	response.sendRedirect("PaginaPrincipal.jsp");
	    }
	}catch(Exception e){ out.print("Erro ao inserir!"); }
%>

</body>
</html>