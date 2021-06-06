/**
 * 
 */

function alterar(i){

	document.getElementById("numeroAlterar").value = i;
	document.getElementById("botaoValorAlterar").click();
	
}

function Dalterar(i){

	document.getElementById("numeroAlterar2").value = i;
	document.getElementById("botaoValorAlterar2").click();
	
}

function almentarAno(){
	
	if(parseInt(document.getElementById("ano").value) < 9999){
		document.getElementById("ano").value = parseInt(document.getElementById("ano").value) + 1;
	}
}

function diminuirAno(){
	
	if(parseInt(document.getElementById("ano").value) > 0){
		document.getElementById("ano").value = parseInt(document.getElementById("ano").value) - 1;
	}
}

function esconderLinhasMes(tamanho, valor, arrayMes, tamanho2, arrayMes2, arrayValoresReceita, arrayValoresDespesa){
	 
	for(var i=0; i < tamanho; i++){
		
		if(arrayMes[i] != valor){
			if((document.getElementById("linha"+i).className).indexOf("inativoMes") == -1){
				document.getElementById("linha"+i).className = document.getElementById("linha"+i).className + " inativoMes";
			}
		}
		else if((document.getElementById("linha"+i).className).indexOf("inativoMes") != -1){
			
			document.getElementById("linha"+i).className = (document.getElementById("linha"+i).className).substring(0, (document.getElementById("linha"+i).className).indexOf("inativoMes")) + (document.getElementById("linha"+i).className).substring((document.getElementById("linha"+i).className).indexOf("inativoMes")+11, (document.getElementById("linha"+i).className).lenght);
		}
	}

	
	
	for(var i2=0; i2 < tamanho2; i2++){
		
		if(arrayMes2[i2] != valor){
			if((document.getElementById("Dlinha"+i2).className).indexOf("inativoMes") == -1){
				document.getElementById("Dlinha"+i2).className = document.getElementById("Dlinha"+i2).className + " inativoMes";
			}
		}
		else if((document.getElementById("Dlinha"+i2).className).indexOf("inativoMes") != -1){
			
			document.getElementById("Dlinha"+i2).className = (document.getElementById("Dlinha"+i2).className).substring(0, (document.getElementById("Dlinha"+i2).className).indexOf("inativoMes")) + (document.getElementById("Dlinha"+i2).className).substring((document.getElementById("Dlinha"+i2).className).indexOf("inativoMes")+11, (document.getElementById("Dlinha"+i2).className).lenght);
		}
	}





			
	var total1 = 0;	
	
	for(var i=0; i < tamanho; i++){
		if((document.getElementById("linha"+i).className).indexOf("inativoMes") == -1 && (document.getElementById("linha"+i).className).indexOf("inativoAno") == -1){
			total1 = total1 + arrayValoresReceita[i];
		}
	}
			
	document.getElementById("totalTabelaReceita").innerHTML = (((Math.round(total1  * 100) / 100).toFixed(2))+"").replace(".", ",");
	
	

	var total2 = 0;
	
	for(var i2=0; i2 < tamanho2; i2++){
		if((document.getElementById("Dlinha"+i2).className).indexOf("inativoMes") == -1 && (document.getElementById("Dlinha"+i2).className).indexOf("inativoAno") == -1){
			total2 = total2 + arrayValoresDespesa[i2];
		}
	}
	
	document.getElementById("totalTabelaDespesa").innerHTML = (((Math.round(total2  * 100) / 100).toFixed(2))+"").replace(".", ",");

	TotalData(total1, total2);
	
}

function esconderLinhasAno(tamanho, arrayAno, tamanho2, arrayAno2, arrayValoresReceita, arrayValoresDespesa){
	
	for(var i=0; i < tamanho; i++){
		
		if(arrayAno[i] != document.getElementById("ano").value){
			if((document.getElementById("linha"+i).className).indexOf("inativoAno") == -1){
				document.getElementById("linha"+i).className = document.getElementById("linha"+i).className + " inativoAno";
			}
		}
		else if((document.getElementById("linha"+i).className).indexOf("inativoAno") != -1){
			
			document.getElementById("linha"+i).className = (document.getElementById("linha"+i).className).substring(0, (document.getElementById("linha"+i).className).indexOf("inativoAno")) + (document.getElementById("linha"+i).className).substring((document.getElementById("linha"+i).className).indexOf("inativoAno")+11, (document.getElementById("linha"+i).className).lenght);
		}
	}
	


	
	
	for(var i=0; i < tamanho2; i++){
		
		if(arrayAno2[i] != document.getElementById("ano").value){
			if((document.getElementById("Dlinha"+i).className).indexOf("inativoAno") == -1){
				document.getElementById("Dlinha"+i).className = document.getElementById("Dlinha"+i).className + " inativoAno";
			}
		}
		else if((document.getElementById("Dlinha"+i).className).indexOf("inativoAno") != -1){
			
			document.getElementById("Dlinha"+i).className = (document.getElementById("Dlinha"+i).className).substring(0, (document.getElementById("Dlinha"+i).className).indexOf("inativoAno")) + (document.getElementById("Dlinha"+i).className).substring((document.getElementById("Dlinha"+i).className).indexOf("inativoAno")+11, (document.getElementById("Dlinha"+i).className).lenght);
		}
	}
	
	
	
		
				
			
	var total1 = 0;	
	
	for(var i=0; i < tamanho; i++){
		if((document.getElementById("linha"+i).className).indexOf("inativoMes") == -1 && (document.getElementById("linha"+i).className).indexOf("inativoAno") == -1){
			total1 = total1 + arrayValoresReceita[i];
		}
	}
			
	document.getElementById("totalTabelaReceita").innerHTML = (((Math.round(total1  * 100) / 100).toFixed(2))+"").replace(".", ",");
	
	

	var total2 = 0;
	
	for(var i2=0; i2 < tamanho2; i2++){
		if((document.getElementById("Dlinha"+i2).className).indexOf("inativoMes") == -1 && (document.getElementById("Dlinha"+i2).className).indexOf("inativoAno") == -1){
			total2 = total2 + arrayValoresDespesa[i2];
		}
	}
	
	document.getElementById("totalTabelaDespesa").innerHTML = (((Math.round(total2  * 100) / 100).toFixed(2))+"").replace(".", ",");
	
	TotalData(total1, total2);
	
}


function chamarEsconderLinhasMesAno(tamanhoReceita, valorMes, arrayMes, tamanhoDespesa, arrayMes2, arrayValoresReceita, arrayValoresDespesa, arrayAno, arrayAno2){

	esconderLinhasMes(tamanhoReceita, valorMes, arrayMes, tamanhoDespesa, arrayMes2, arrayValoresReceita, arrayValoresDespesa);
	esconderLinhasAno(tamanhoReceita, arrayAno, tamanhoDespesa, arrayAno2, arrayValoresReceita, arrayValoresDespesa);
	
}



function trocarTabela(){
	
	if(document.getElementById("tabelaReceitas").className == "modal2"){
		
		document.getElementById("tabelaDespesas").className = "modal2";
		document.getElementById("tabelaDespesas2").className = "modal2";
		document.getElementById("tabelaReceitas").className = "";
		
		document.getElementById("formCadastro").action = "CadastrarReceita.jsp";
		
	}else{
		document.getElementById("tabelaReceitas").className = "modal2";
		document.getElementById("tabelaDespesas").className = "";
		document.getElementById("tabelaDespesas2").className = "";
		document.getElementById("formCadastro").action = "CadastrarDespesa.jsp";
		
	}
	
}


function TotalData(total1, total2){

	var total = total1 - total2;

	document.getElementById("saldoBarra").innerHTML = (((Math.round(total  * 100) / 100).toFixed(2))+"").replace(".", ",");
	
	if(total > 0){
		document.getElementById("saldoBarra").className = "positivo";
	}
	else{
		document.getElementById("saldoBarra").className = "negativo";
	}
	
}

function IrParaPaginaPrincipal(){
	document.getElementById("bntSubmitPaginaPrincipal").click();
}
