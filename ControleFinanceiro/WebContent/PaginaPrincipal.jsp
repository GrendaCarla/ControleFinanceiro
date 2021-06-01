<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="DAO.ReceitaDAO"%>
<%@page import="model.Receitas"%>

<%@page import="DAO.DespesasDAO"%>
<%@page import="model.Despesas"%>

<%@page import="java.util.ArrayList"%>
    
<%
	ReceitaDAO receitaDao = new ReceitaDAO();
	ArrayList<Receitas> receitas = receitaDao.buscarTodos();
	
	/*DespesasDAO despesasDao = new DespesasDAO();
	ArrayList<Despesas> despesas = despesasDao.buscarTodos(); aaaaaaaaa*/
%>
    
    
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Controle Financeiro</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
	</head>
	
	<body>
	
		<table  id="BarraSuperior" class="table">
			<tr>
				<td width="35%"></td>
				<td width="30px"><i class="seta-esquerda-data"></td>
				<td width="130px" align="center">FEVEREIRO</td>
				<td width="130px" align="center">2005</td>
				<td width="30px"><i class="seta-direita-data"></td>
				<td width="35%"></td>
			</tr>
		</table>

		</br></br></br></br>

		<table  class="Titulo table" align="center">
			<tr>
				<td>R E C E I T A</td>
			</tr>
		</table>	


		</br></br></br>
		
		<form action="CadastrarReceita.jsp" method="POST">

			<table  align="center" class="TabelaCentral">
				<tr class="Fonte1">
					<td rowspan="6" width="35px" align="center"><i class="seta-esquerda-tabela"></td>
					<td width="640px" class="FontNegrito">Nome</td>
					<td width="30px"></td>
					<td width="200px" class="FontNegrito">Data</td>
					<td width="30px"></td>
					<td  width="200px" class="FontNegrito">Valor</td>
					<td width="30px"></td>
					<td width="15px" align="right"></td>
					<td rowspan="6" width="35px" align="center"><i class="seta-direita-tabela"></td>
				</tr>
				<tr>
					<td><input class="form-control" type="text" name="nome"></td>
					<td width="30px"></td>
					<td><input class="form-control" type="date" name="data"></td>
					<td width="30px"></td>
					<td><input class="Dinheiro form-control" type="number" step="0.01" min="0" onkeydown="return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 107 && event.keyCode !== 187 && event.keyCode !== 190" placeholder="0,00" name="valor"></td>
					<td width="30px"></td>
					<td><input type="submit" class="btn btn-dark LetraBranca" value="OK" id="botaoOK"></td>
				</tr>
				<tr>
					<td colspan="7"></br></td>
				</tr>
				<tr>
					<td colspan="7">
					<table  align="center" class="Tabela table">
						<tr bgcolor="black" class="LetraBranca">
							<td>Nome</td>
							<td width="16%" align="center">Data</td>
							<td width="20%" align="center" colspan="2">Valor</td>
							<td width="6%"></td>
						</tr>
						
	<% 
						for(int i=0; i < receitas.size(); i++){
							out.println("<tr>"+
								"<td>"+receitas.get(i).getNome()+"</td>"+
								"<td align=\"center\">"+ receitas.get(i).converterData()+"</td>"+
								"<td align=\"left\">R$</td>"+
								"<td align=\"right\">"+receitas.get(i).getValor()+"</td>"+
								"<td align=\"right\"><input class=\"btn btn-sm BotaoExcluir\" type=\"button\" value=\" X \" ></td>"+
							"</tr>");
						}
	%>
						
					</table>
					</td>
				</tr>
	
				<tr>
					<td colspan="7"></br></td>
				</tr>
	
				<tr class="Fonte1">
					<td colspan="7">
					<table class="BarraValor table" >
						<tr>
							<td width="70px">Total:</td>
							<td>R$</td>
							<td align="right" class="CorReceita">
							<% 
								float total=0;
								for(int i=0; i < receitas.size(); i++){
									total = total + receitas.get(i).getValor();
								}
									out.println(total);
							 %>
							</td>
						</tr>
					</table>
					</td>
	
				</tr>
	
			</table>
		
		</form>
	
		</br></br>

		<table id="BarraTotal" class="table">
			<tr>
				<td width="2px"></td>
				<td width="110px">Saldo:</td>
				<td width="60px">R$</td>
				<td align="right">0,00</td>
				<td width="2px"></td>
			</tr>
		</table>
	
	
	</body>

    
</html>

