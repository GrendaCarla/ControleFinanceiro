<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="DAO.ReceitaDAO"%>
<%@page import="model.Receitas"%>

<%@page import="DAO.DespesasDAO"%>
<%@page import="model.Despesas"%>

<%@page import="java.util.ArrayList"%>

<%@page import="java.time.LocalDate"%>
<%@page import="model.Funcoes"%>
    
<%
	ReceitaDAO receitaDao = new ReceitaDAO();
	ArrayList<Receitas> receitas = receitaDao.buscarTodos();
	int ReceitaEscolida = -1;
	
	int despesaOUreceita = 0;
	
	DespesasDAO despesasDao = new DespesasDAO();
	ArrayList<Despesas> despesas = despesasDao.buscarTodos();
	int DespesaEscolida = -1;
	
	
	if(request.getParameter("numeroAlterar") != null){
		ReceitaEscolida = Integer.parseInt(request.getParameter("numeroAlterar"));
    }
	
	if(request.getParameter("numeroAlterar2") != null){
		DespesaEscolida = Integer.parseInt(request.getParameter("numeroAlterar2"));
    }
	
	
	if(request.getParameter("despesaOUreceita") != null && !request.getParameter("despesaOUreceita").equals("")){
		despesaOUreceita = 1;
    }
	
	
	
	LocalDate a = LocalDate.now();
	String dataAtual;
	
	if(request.getParameter("ano2") != null && request.getParameter("mes2") != null){
	    if(request.getParameter("ano2").equals("") && request.getParameter("mes2").equals("")){
	    	dataAtual = a+"";
	    }else{
	    	dataAtual = request.getParameter("ano2")+"-"+ request.getParameter("mes2") +"-01";
	    }
	}else{
		dataAtual = a+"";
	}
	
	Funcoes funcao = new Funcoes();
	
	ArrayList<String> arrayMes = new ArrayList<String>();
	ArrayList<String> arrayAno = new ArrayList<String>();
	
	for(int i=0; i < receitas.size(); i++){
		arrayMes.add((receitas.get(i).getMes()+"").substring(5, 7));
		arrayAno.add((receitas.get(i).getMes()+"").substring(0, 4));
	}
	
	
	ArrayList<String> arrayMes2 = new ArrayList<String>();
	ArrayList<String> arrayAno2 = new ArrayList<String>();
	
	for(int i=0; i < despesas.size(); i++){
		arrayMes2.add((despesas.get(i).getMes()+"").substring(5, 7));
		arrayAno2.add((despesas.get(i).getMes()+"").substring(0, 4));
	}
	
	ArrayList<Float> arrayValoresReceita = new ArrayList<Float>();
	ArrayList<Float> arrayValoresDespesa = new ArrayList<Float>();
	
	for(int i=0; i < receitas.size(); i++){
		arrayValoresReceita.add(receitas.get(i).getValor());
	}

	for(int i=0; i < despesas.size(); i++){
		arrayValoresDespesa.add(despesas.get(i).getValor());
	}
	

%>
    
    
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Controle Financeiro</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="PaginaPrincipal.css">
		<script type="text/javascript" src="Funcoes.js"></script>
		
		
	</head>
<%	
	out.println("<body  onload=\"chamarEsconderLinhasMesAno("+receitas.size()+", " + (dataAtual+"").substring(5, 7).intern() + ", "+ arrayMes +", " +despesas.size()+", " + arrayMes2 + ", "+ arrayValoresReceita +", " + arrayValoresDespesa +", "+ arrayAno +", "+ arrayAno2 +"); \">");
%>	
		
		
	<form action="CadastrarReceita.jsp" id="formCadastro"  method="POST" autocomplete="off">
	
		<table  id="BarraSuperior" class="table">
			<tr>
				<td width="35%"></td>
				<td width="140px" align="center">
<%
					out.println("<select class=\"BarraData MouseMaozinha\" name=\"mes\" id=\"mes\" onclick=\"esconderLinhasMes("+receitas.size()+", this.value, "+ arrayMes +", " +despesas.size()+", "+ arrayMes2 +", "+ arrayValoresReceita +", " + arrayValoresDespesa +")\" style=\"background-color: black; color: white; border:0px; outline:0px; cursor: pointer;\">");

					if((dataAtual+"").substring(5, 7).intern() == "01" ){
						out.println("<option value=\"01\" selected>JANEIRO</option>");
					}else{
						out.println("<option value=\"01\">JANEIRO</option>");
					}
					
					if((dataAtual+"").substring(5, 7).intern() == "02" ){
						out.println("<option value=\"02\" selected>FEVEREIRO</option>");
					}else{
						out.println("<option value=\"02\">FEVEREIRO</option>");
					}
					
					if((dataAtual+"").substring(5, 7).intern() == "03" ){
						out.println("<option value=\"03\" selected>MARÇO</option>");
					}else{
						out.println("<option value=\"03\">MARÇO</option>");
					}
					
					if((dataAtual+"").substring(5, 7).intern() == "04" ){
						out.println("<option value=\"04\" selected>ABRIL</option>");
					}else{
						out.println("<option value=\"04\">ABRIL</option>");
					}
						
					if((dataAtual+"").substring(5, 7).intern() == "05" ){
						out.println("<option value=\"05\" selected>MAIO</option>");
					}else{
						out.println("<option value=\"05\">MAIO</option>");
					}
					
					if((dataAtual+"").substring(5, 7).intern() == "06" ){
						out.println("<option value=\"06\" selected>JUNHO</option>");
					}else{
						out.println("<option value=\"06\">JUNHO</option>");
					}

					if((dataAtual+"").substring(5, 7).intern() == "07" ){
						out.println("<option value=\"07\" selected>JULHO</option>");
					}else{
						out.println("<option value=\"07\">JULHO</option>");
					}
					
					if((dataAtual+"").substring(5, 7).intern() == "08" ){
						out.println("<option value=\"08\" selected>AGOSTO</option>");
					}else{
						out.println("<option value=\"08\">AGOSTO</option>");
					}

					if((dataAtual+"").substring(5, 7).intern() == "09" ){
						out.println("<option value=\"09\" selected>SETEMBRO</option>");
					}else{
						out.println("<option value=\"09\">SETEMBRO</option>");
					}

					if((dataAtual+"").substring(5, 7).intern() == "10" ){
						out.println("<option value=\"10\" selected>OUTUBRO</option>");
					}else{
						out.println("<option value=\"10\">OUTUBRO</option>");
					}
						
					if((dataAtual+"").substring(5, 7).intern() == "11" ){
						out.println("<option value=\"11\" selected>NOVEMBRO</option>");
					}else{
						out.println("<option value=\"11\">NOVEMBRO</option>");
					}
					
					if((dataAtual+"").substring(5, 7).intern() == "12" ){
						out.println("<option value=\"12\" selected>DEZEMBRO</option>");
					}else{
						out.println("<option value=\"12\">DEZEMBRO</option>");
					}
					
%>
					</select>
				</td>
<%
				out.println("<td width=\"30px\" align=\"right\"><i class=\"seta-esquerda-data MouseMaozinha\" onclick=\"diminuirAno(); esconderLinhasAno("+receitas.size()+", "+ arrayAno +", " +despesas.size()+", "+ arrayAno2 +", "+ arrayValoresReceita +", " + arrayValoresDespesa +");\"></td>" +
				"<td width=\"80px\" align=\"center\"><input type=\"number\" size=\"1\" class=\"BarraData\" placeholder=\"0000\" value=\""+ (dataAtual+"").substring(0, 4) +"\" id=\"ano\" name=\"ano\" maxlength=\"4\" min=\"0\" max=\"9999\"  onkeyup=\"esconderLinhasAno("+receitas.size()+", "+ arrayAno +", " +despesas.size()+", "+ arrayAno2 +", "+ arrayValoresReceita +", " + arrayValoresDespesa +");\"    onkeydown=\"return (((event.keyCode >= 48 && event.keyCode <= 57) || event.keyCode == 8) && this.value.length >= 0 && this.value.length <= 3) || (event.keyCode == 8 &&  this.value.length == 4)\" style=\"background-color: black; color: white; font-size: 100%; border:0px; outline:0px; width:80px; text-align: center;\"></td>"+
				"<td width=\"30px\"><i class=\"seta-direita-data MouseMaozinha\"  onclick=\"almentarAno(); esconderLinhasAno("+receitas.size()+", "+ arrayAno +", " +despesas.size()+", "+ arrayAno2 +", "+ arrayValoresReceita +", " + arrayValoresDespesa +");\"></td>");
%>				
				<td width="35%"></td>
			</tr>
		</table>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
<%	
	if(despesaOUreceita == 0){
		out.println("<div id=\"tabelaDespesas\" class=\"modal2\">");
	}else{
		out.println("<div id=\"tabelaDespesas\">");
	}
%>		
		</br></br></br></br>
		
		<table  class="Titulo table" align="center">
			<tr>
				<td>D E S P E S A S</td>
			</tr>
		</table>	


		</br></br></br>
		

		<table  align="center" class="TabelaCentral">
			<tr class="Fonte1">
				<td rowspan="2" width="35px" align="center"></td>
				<td width="500px" class="FontNegrito">Nome</td>
				<td width="30px"></td>
				<td width="200px" class="FontNegrito">Data de Pagamento</td>
				<td width="30px"></td>
				<td width="200px" class="FontNegrito">Data de Vencimento</td>
				<td width="30px"></td>
				<td  width="200px" class="FontNegrito">Valor</td>
				<td width="30px"></td>
				<td width="15px" align="right"></td>
				<td rowspan="2" width="35px" align="center"></td>
			</tr>
			<tr>
				<td><input class="form-control" type="text" name="nome2"></td>
				<td width="30px"></td>
				<td><input class="form-control" type="date" name="data2"></td>
				<td width="30px"></td>
				<td><input class="form-control" type="date" name="data3"></td>
				<td width="30px"></td>
				<td><input class="Dinheiro form-control" type="number" placeholder="0,00" step="0.01" min="0" onkeydown="return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 107 && event.keyCode !== 187 && event.keyCode !== 190" placeholder="0,00" name="valor2"></td>
				<td width="30px"></td>
				<td><input type="submit" class="btn btn-dark LetraBranca"  id="cadastrarDespesa" value="OK"></td>
			</tr>
		</table>
	</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
<%	
	if(despesaOUreceita == 0){
		out.println("<div id=\"tabelaReceitas\">");
	}else{
		out.println("<div id=\"tabelaReceitas\" class=\"modal2\">");
	}
%>		
	
	</br></br></br></br>

		<table  class="Titulo table" align="center">
			<tr>
				<td>R E C E I T A</td>
			</tr>
		</table>	


		</br></br></br>
		

			<table  align="center" class="TabelaCentral">
				<tr class="Fonte1">
					<td rowspan="6" width="35px" align="center"><i class="seta-esquerda-tabela MouseMaozinha" onclick="trocarTabela()"></td>
					<td width="640px" class="FontNegrito">Nome</td>
					<td width="30px"></td>
					<td width="200px" class="FontNegrito">Data</td>
					<td width="30px"></td>
					<td  width="200px" class="FontNegrito">Valor</td>
					<td width="30px"></td>
					<td width="15px" align="right"></td>
					<td rowspan="6" width="35px" align="center"><i class="seta-direita-tabela MouseMaozinha" onclick="trocarTabela()"></td>
				</tr>
				<tr>
					<td><input class="form-control" type="text" name="nome"></td>
					<td width="30px"></td>
					<td><input class="form-control" type="date" name="data"></td>
					<td width="30px"></td>
					<td><input class="Dinheiro form-control" type="number" placeholder="0,00" step="0.01" min="0" onkeydown="return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 107 && event.keyCode !== 187 && event.keyCode !== 190" placeholder="0,00" name="valor"></td>
					<td width="30px"></td>
					<td><input type="submit" class="btn btn-dark LetraBranca"  id="cadastrar" value="OK"></td>
				</tr>
			</form>
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
						
				<form action="ExcluirReceita.jsp"  method="POST" autocomplete="off">
	<% 
					if( receitas.size() != 0){
						for(int i=0; i < receitas.size(); i++){
								out.println("<tr class=\"MouseMaozinha\" id=\"linha"+i+"\">"+
									"<td ondblclick=\"alterar("+i+")\"><texto class=\"MouseSeta\">"+receitas.get(i).getNome()+"</texto></td>"+
									"<td ondblclick=\"alterar("+i+")\" align=\"center\"><texto class=\"MouseSeta\" >"+ funcao.converterData(receitas.get(i).getDataRecebimento())+"</texto></td>"+
									"<td ondblclick=\"alterar("+i+")\" align=\"left\"><texto class=\"MouseSeta\" >R$</texto></td>"+
									"<td ondblclick=\"alterar("+i+")\" align=\"right\"><texto class=\"MouseSeta\" >"+ funcao.FormatarValor(receitas.get(i).getValor()) +"</texto></td>"+
									"<td align=\"right\"><input class=\"btn btn-sm BotaoExcluir\" type=\"submit\" value=\" X \" name=\"BotaoX"+i+"\"></td>"+
								"</tr>");
						}
					} else{
						
						out.println("<tr>"+
							"<td height=\"200px\"></td>"+
						"</tr>");
						
					}
	
	%>
	
				</form>
				
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
							<td align="right" class="CorReceita" id="totalTabelaReceita">0,00</td>
						</tr>
					</table>
					</td>
	
				</tr>
	
			</table>
			
		
</div>	
























		
<%	
		if(despesaOUreceita == 0){
			out.println("<div id=\"tabelaDespesas2\" class=\"modal2\">");
		}else{
			out.println("<div id=\"tabelaDespesas2\" >");
		}
%>		
			
			<table  align="center" class="TabelaCentral">
				<tr>
					<td rowspan="2" width="35px" align="center"><i class="seta-esquerda-tabela MouseMaozinha" onclick="trocarTabela()"></td>
					<td colspan="7"></br></td>
					<td rowspan="2" width="35px" align="center"><i class="seta-direita-tabela MouseMaozinha" onclick="trocarTabela()"></td>
				</tr>
				<tr>
					<td colspan="7">
					<table  align="center" class="Tabela table">
						<tr bgcolor="black" class="LetraBranca">
							<td width="43%">Nome</td>
							<td width="16%" align="center">Data de Pagamento</td>
							<td width="17%" align="center">Data de Vencimento</td>
							<td  align="center" colspan="2">Valor</td>
							<td width="6%"></td>
						</tr>
						
				<form action="ExcluirDespesa.jsp"  method="POST" autocomplete="off">
	<% 
					if( despesas.size() != 0){
						for(int i=0; i < despesas.size(); i++){
								out.println("<tr class=\"MouseMaozinha\" id=\"Dlinha"+i+"\">"+
									"<td ondblclick=\"Dalterar("+i+")\"><texto class=\"MouseSeta\">"+despesas.get(i).getNome()+"</texto></td>"+
									"<td ondblclick=\"Dalterar("+i+")\" align=\"center\"><texto class=\"MouseSeta\" >"+ funcao.converterData(despesas.get(i).getDataPagamento())+"</texto></td>"+
									"<td ondblclick=\"Dalterar("+i+")\" align=\"center\"><texto class=\"MouseSeta\" >"+ funcao.converterData(despesas.get(i).getDataVencimento())+"</texto></td>"+
									"<td ondblclick=\"Dalterar("+i+")\" align=\"left\"><texto class=\"MouseSeta\" >R$</texto></td>"+
									"<td ondblclick=\"Dalterar("+i+")\" align=\"right\"><texto class=\"MouseSeta\" >"+ funcao.FormatarValor(despesas.get(i).getValor()) +"</texto></td>"+
									"<td align=\"right\"><input class=\"btn btn-sm BotaoExcluir\" type=\"submit\" value=\" X \" name=\"DBotaoX"+i+"\"></td>"+
								"</tr>");
						}
					} else{
						
						out.println("<tr>"+
							"<td height=\"200px\"></td>"+
						"</tr>");
						
					}
	
	%>
	
				</form>
				
					</table>
					</td>
				</tr>
	
				<tr>
					<td colspan="9"></br></td>
				</tr>
	
				<tr class="Fonte1">
					<td width="35px"></td>
					<td colspan="7">
					<table class="BarraValor table" >
						<tr>
							<td width="70px">Total:</td>
							<td>R$</td>
							<td align="right" class="CorDespesa" id="totalTabelaDespesa">0,00</td>
						</tr>
					</table>
					</td>
					<td width="35px"></td>
				</tr>
	
			</table>
			
		
	</div>		
		
	





















	
	
	
	
	

		</br></br>

		<table id="BarraTotal" class="table">
			<tr>
				<td width="2px"></td>
				<td width="110px">Saldo:</td>
				<td width="60px">R$</td>
				<td align="right" id="saldoBarra">0,00</td>
				<td width="2px"></td>
			</tr>
		</table>
		
		
		
		
		
		<form action="PaginaPrincipal.jsp#AlterarReceita"  method="POST" autocomplete="off">
			<div class="modal1">
				<input type="text" value="" id="numeroAlterar" name="numeroAlterar" >
				<input type="submit" id="botaoValorAlterar">
			</div>
		</form>
		
		
		
		<form action="AlterarReceita.jsp" method="POST" autocomplete="off">
		
			<div id="AlterarReceita" class="modal1">
				</br></br></br>
				<table class="divAlterar" align="center">
					<tr>
						<td colspan="3" align="right" class="LetraBranca TamanhoLetraTitulo" style="background-color: black;" >A L T E R A R</td>
						<td align="center" class="LetraBranca TamanhoLetraTitulo" style="background-color: black;" width="40px"></td>
						<td colspan="3" align="left" class="LetraBranca TamanhoLetraTitulo" style="background-color: black;" >R E C E I T A</td>
					</tr>
				</table>
		
			  	<table class="divAlterar table" align="center">
					
					<tr>
						<td colspan="7"></td>
					</tr>
					
					<tr class="Fonte1">
						<td width="10px"></td>
						<td class="FontNegrito">Nome</td>
						<td width="20px"></td>
						<td width="200px" class="FontNegrito">Data</td>
						<td width="20px"></td>
						<td width="200px" class="FontNegrito">Valor</td>
						<td width="10px"></td>
					</tr>
<% 	
	if(ReceitaEscolida == -1){
		out.println("<tr>"
						+"<td width=\"10px\"></td>"
						+"<td><input class=\"form-control\" type=\"text\" name=\"nomeAlterar\" id=\"nomeAlterar\"  value=\"\"></td>"
						+"<td width=\"20px\"></td>"
						+"<td><input class=\"form-control\" type=\"date\" name=\"dataAlterar\" id=\"dataAlterar\" value=\"\"></td>"
						+"<td width=\"20px\"></td>"
						+"<td><input class=\"Dinheiro form-control\" type=\"number\"  value=\"\"  step=\"0.01\" min=\"0\" onkeydown=\"return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 107 && event.keyCode !== 187 && event.keyCode !== 190\" placeholder=\"0,00\" name=\"valorAlterar\" id=\"valorAlterar\"></td>"
						+"<td width=\"10px\"></td>"
					+"</tr>");
	} else{
		out.println("<tr>"
				+"<td width=\"10px\"></td>"
				+"<td><input class=\"form-control\" type=\"text\" name=\"nomeAlterar\" id=\"nomeAlterar\"  value=\""+ receitas.get(ReceitaEscolida).getNome() +"\"></td>"
				+"<td width=\"20px\"></td>"
				+"<td><input class=\"form-control\" type=\"date\" name=\"dataAlterar\" id=\"dataAlterar\" value=\""+ receitas.get(ReceitaEscolida).getDataRecebimento() +"\" placeholder=\""+ receitas.get(ReceitaEscolida).getDataRecebimento() +"\"></td>"
				+"<td width=\"20px\"></td>"
				+"<td><input class=\"Dinheiro form-control\" type=\"number\"  value=\""+ (receitas.get(ReceitaEscolida).getValor()+"") +"\"  step=\"0.01\" min=\"0\" onkeydown=\"return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 107 && event.keyCode !== 187 && event.keyCode !== 190\" placeholder=\"0,00\" name=\"valorAlterar\" id=\"valorAlterar\"></td>"
				+"<td width=\"10px\"></td>"
			+"</tr>");
	}
%>				
					<tr>
						<td colspan="7" align="center"> </td>
					</tr>
					
					<tr>
						<td colspan="7" align="center"> 
							<table>
								<tr>
									<td align="center"><input type="submit" value="   Salvar   " class="btn btn-dark LetraBranca" ></td>
									<td width="300px"></td>
									<td align="center"><a href="#fechar" title="Fechar" class="fechar"><input type="button" value=" Cancelar " class="btn btn-dark LetraBranca"></a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="7" align="center"> </td>
					</tr>
					
				</table>
			</div>
			
			<div class="modal1">
<%
			if(ReceitaEscolida != -1){
				out.println("<input type=\"text\"  name=\"idAlterar\" id=\"idAlterar\"  value=\""+ receitas.get(ReceitaEscolida).getID() +"\" >"+
				"<input type=\"text\"  name=\"mesAlterar\" id=\"mesAlterar\"  value=\""+ receitas.get(ReceitaEscolida).getMes() +"\" >");
			}else{
				out.println("<input type=\"text\"  name=\"idAlterar\" id=\"idAlterar\"  value=\"\" >");
			}
%>
			</div>
			
		</form>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<form action="PaginaPrincipal.jsp#AlterarDespesa"  method="POST" autocomplete="off">
			<div class="modal1">
				<input type="text" value="" id="numeroAlterar2" name="numeroAlterar2" >
				<input type="submit" id="botaoValorAlterar2">
			</div>
		</form>
		
		
		
		<form action="AlterarDespesa.jsp" method="POST" autocomplete="off">
			
		
			<div id="AlterarDespesa" class="modal1">
				</br></br></br>
				<table class="divAlterar" align="center">
					<tr>
						<td colspan="3" align="right" class="LetraBranca TamanhoLetraTitulo" style="background-color: black;" >A L T E R A R</td>
						<td align="center" class="LetraBranca TamanhoLetraTitulo" style="background-color: black;" width="40px"></td>
						<td colspan="3" align="left" class="LetraBranca TamanhoLetraTitulo" style="background-color: black;" >D E S P E S A</td>
					</tr>
				</table>
			
			  	<table class="divAlterar table" align="center">
					
					<tr>
						<td colspan="9"></td>
					</tr>
					
					<tr class="Fonte1">
						<td width="10px"></td>
						<td class="FontNegrito">Nome</td>
						<td width="20px"></td>
						<td width="200px" class="FontNegrito">Data de Pagamento</td>
						<td width="20px"></td>
						<td width="200px" class="FontNegrito">Data de Vencimento</td>
						<td width="20px"></td>
						<td width="200px" class="FontNegrito">Valor</td>
						<td width="10px"></td>
					</tr>
<% 	
	if(DespesaEscolida == -1){
		out.println("<tr>"
						+"<td width=\"10px\"></td>"
						+"<td><input class=\"form-control\" type=\"text\" name=\"nomeAlterar2\" id=\"nomeAlterar2\"  value=\"\"></td>"
						+"<td width=\"20px\"></td>"
						+"<td><input class=\"form-control\" type=\"date\" name=\"dataAlterar2\" id=\"dataAlterar2\" value=\"\"></td>"
						+"<td width=\"20px\"></td>"
						+"<td><input class=\"form-control\" type=\"date\" name=\"dataAlterar3\" id=\"dataAlterar3\" value=\"\"></td>"
						+"<td width=\"20px\"></td>"
						+"<td><input class=\"Dinheiro form-control\" type=\"number\"  value=\"\"  step=\"0.01\" min=\"0\" onkeydown=\"return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 107 && event.keyCode !== 187 && event.keyCode !== 190\" placeholder=\"0,00\" name=\"valorAlterar2\" id=\"valorAlterar2\"></td>"
						+"<td width=\"10px\"></td>"
					+"</tr>");
	} else{
		out.println("<tr>"
				+"<td width=\"10px\"></td>"
				+"<td><input class=\"form-control\" type=\"text\" name=\"nomeAlterar2\" id=\"nomeAlterar2\"  value=\""+ despesas.get(DespesaEscolida).getNome() +"\"></td>"
				+"<td width=\"20px\"></td>"
				+"<td><input class=\"form-control\" type=\"date\" name=\"dataAlterar2\" id=\"dataAlterar2\" value=\""+ despesas.get(DespesaEscolida).getDataPagamento() +"\" placeholder=\""+despesas.get(DespesaEscolida).getDataPagamento() +"\"></td>"
				+"<td width=\"20px\"></td>"
				+"<td><input class=\"form-control\" type=\"date\" name=\"dataAlterar3\" id=\"dataAlterar3\" value=\""+ despesas.get(DespesaEscolida).getDataVencimento() +"\" placeholder=\""+despesas.get(DespesaEscolida).getDataVencimento() +"\"></td>"
				+"<td width=\"20px\"></td>"
				+"<td><input class=\"Dinheiro form-control\" type=\"number\"  value=\""+ (despesas.get(DespesaEscolida).getValor()+"") +"\"  step=\"0.01\" min=\"0\" onkeydown=\"return event.keyCode !== 69 && event.keyCode !== 189 && event.keyCode !== 107 && event.keyCode !== 187 && event.keyCode !== 190\" placeholder=\"0,00\" name=\"valorAlterar2\" id=\"valorAlterar2\"></td>"
				+"<td width=\"10px\"></td>"
			+"</tr>");
	}
%>				
					<tr>
						<td colspan="9" align="center"> </td>
					</tr>
					
					<tr>
						<td colspan="9" align="center"> 
							<table>
								<tr>
									<td align="center"><input type="submit" value="   Salvar   " class="btn btn-dark LetraBranca" ></td>
									<td width="300px"></td>
									<td align="center"><a href="#fechar" title="Fechar" class="fechar"><input type="button" value=" Cancelar " class="btn btn-dark LetraBranca"></a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="9" align="center"> </td>
					</tr>
					
				</table>
			</div>
			
			<div class="modal1">
<%
			if(DespesaEscolida != -1){
				out.println("<input type=\"text\"  name=\"idAlterar2\" id=\"idAlterar2\"  value=\""+ despesas.get(DespesaEscolida).getID() +"\" >"+
				"<input type=\"text\"  name=\"mesAlterar2\" id=\"mesAlterar2\"  value=\""+ despesas.get(DespesaEscolida).getMes() +"\" >");
			}else{
				out.println("<input type=\"text\"  name=\"idAlterar2\" id=\"idAlterar2\"  value=\"\" >");
			}
%>
			</div>
			
		</form>
		
		
		
		
		
		
		
			<div id="ErroPreenchimentoDeCampo" class="modal1">
				</br></br></br>
				<table class="divAlterar" align="center">
					<tr>
						<td align="center" class="LetraBranca TamanhoLetraTitulo" style="background-color: black;" >E R R O</td>
					</tr>
				</table>
			  	<table class="divAlterar table" align="center">
					<tr>
						<td></td>
					</tr>
					<tr class="Fonte1">
						<td class="FontNegrito" align="center">PREENCHA TODOS OS CAMPOS CORRETAMENTE</td>
					</tr>

						<td align="center"> </td>
					</tr>
					<tr>
						<td align="center"><a href="#fechar" title="Fechar" class="fechar"><input type="button" value="   OK   " class="btn btn-dark LetraBranca"></a></td>
					</tr>
					<tr>
						<td align="center"> </td>
					</tr>
				</table>
			</div>
			
			
		
		
		
		
	
	</body>

    
</html>

