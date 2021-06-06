<%@page import="DAO.ReceitaDAO"%>
<%@page import="model.Receitas"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Excluir Receita</title>
	<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
	<script type="text/javascript" src="Funcoes.js"></script>
	</head>
		
	<body onload="IrParaPaginaPrincipal();">

<%
	try{
		ReceitaDAO receitaDao = new ReceitaDAO();
		ArrayList<Receitas> receitas = receitaDao.buscarTodos();
		
		for(int i=0; i < receitas.size(); i++){
			if(request.getParameter("BotaoX"+i) != null){
				
				receitaDao.excluir(receitas.get(i));
				receitaDao.buscarId(receitas.get(i));

		    	out.println("<form action=\"PaginaPrincipal.jsp\"  method=\"POST\" autocomplete=\"off\">"+
						"<div class=\"modal1\">" +
						 "<input type=\"text\" value=\""+ (receitas.get(i).getMes()+"").substring(0, 4) +"\" name=\"ano2\" >" +
							"<input type=\"text\" value=\""+ (receitas.get(i).getMes()+"").substring(5, 7) +"\" name=\"mes2\" >" +
							"<input type=\"submit\" id=\"bntSubmitPaginaPrincipal\">"+
						"</div>"+
					"</form>");
			}
		}
		
		
	}catch(Exception e){ response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");}
	
%>

</body>

</html>