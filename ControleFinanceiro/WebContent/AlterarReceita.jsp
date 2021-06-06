<%@page import="DAO.ReceitaDAO"%>
<%@page import="model.Receitas"%>
<%@page import="model.Funcoes"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alterar Receita</title>
<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
<script type="text/javascript" src="Funcoes.js"></script>
</head>
<body  onload="IrParaPaginaPrincipal();">

<%
	try{
		ReceitaDAO receitaDao = new ReceitaDAO();
		Receitas receitas = new Receitas();
		Funcoes funcao = new Funcoes();
		
    	
		
		if(request.getParameter("idAlterar") != null && request.getParameter("nomeAlterar") != null && request.getParameter("dataAlterar") != null  && request.getParameter("valorAlterar") != null  && request.getParameter("mesAlterar") != null){
			
		    if(!request.getParameter("idAlterar").equals("") && !request.getParameter("nomeAlterar").equals("") && !request.getParameter("dataAlterar").equals("") && !request.getParameter("valorAlterar").equals("") && !request.getParameter("mesAlterar").equals("")){
				
		    	receitas.setID(Integer.parseInt(request.getParameter("idAlterar")));
		    	receitas.setNome(request.getParameter("nomeAlterar"));
		    	receitas.setDataRecebida(funcao.converteParaDataSQL(request.getParameter("dataAlterar")), 0);
		    	receitas.setValor(Float.parseFloat(request.getParameter("valorAlterar").replace(",",".")));
		    	receitas.setMes(funcao.converteParaDataSQL(request.getParameter("mesAlterar")), 0);
		    	
		    	receitaDao.alterar(receitas);
		    	receitaDao.buscarId(receitas);

		    	out.println("<form action=\"PaginaPrincipal.jsp\"  method=\"POST\" autocomplete=\"off\">"+
						"<div class=\"modal1\">" +
						 "<input type=\"text\" value=\""+ (receitas.getMes()+"").substring(0, 4) +"\" name=\"ano2\" >" +
							"<input type=\"text\" value=\""+ (receitas.getMes()+"").substring(5, 7) +"\" name=\"mes2\" >" +
							"<input type=\"submit\" id=\"bntSubmitPaginaPrincipal\">"+
						"</div>"+
					"</form>");
		    }else{
		    	response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		    }
		   
		    
		}else{
			response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");
		}
	}catch(Exception e){ response.sendRedirect("PaginaPrincipal.jsp#ErroPreenchimentoDeCampo");}
%>

</body>
</html>