<%@page import="DAO.DespesasDAO"%>
<%@page import="model.Despesas"%>

<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Excluir Despesa</title>
	<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
	<script type="text/javascript" src="Funcoes.js"></script>
	</head>
		
	<body  onload="IrParaPaginaPrincipal();">

<%
	try{
		DespesasDAO despesaDao = new DespesasDAO();
		ArrayList<Despesas> despesas = despesaDao.buscarTodos();
		
		for(int i=0; i < despesas.size(); i++){
			if(request.getParameter("DBotaoX"+i) != null){
				
				despesaDao.excluir(despesas.get(i));
				despesaDao.buscarId(despesas.get(i));

		    	out.println("<form action=\"PaginaPrincipal.jsp\"  method=\"POST\" autocomplete=\"off\">"+
						"<div class=\"modal1\">" +
						 "<input type=\"text\" value=\""+ (despesas.get(i).getMes()+"").substring(0, 4) +"\" name=\"ano2\" >" +
							"<input type=\"text\" value=\""+ (despesas.get(i).getMes()+"").substring(5, 7) +"\" name=\"mes2\" >" +
							"<input type=\"text\" value=\"1\" name=\"despesaOUreceita\" >" +	
							"<input type=\"submit\" id=\"bntSubmitPaginaPrincipal\">"+
						"</div>"+
					"</form>");
			}
		}
		
		
	}catch(Exception e){response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");}
%>

</body>

</html>