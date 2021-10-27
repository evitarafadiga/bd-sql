<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jogos</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
		<br />
	</div>
	<form action="jogo" method="post">
		<table>
			<tr>
				<td colspan="10"><input type="number" id="idjogo" name="idjogo"
					placeholder="" size="40" value="${jogo.idjogo }"></td>
				<td><input type="submit" value="Buscar" id="button"
					name="button"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="number" id="codigotimea"
					name="codigotimea" placeholder="Código do Time A" size="40"
					value="${jogo.codigotimea }"></td>
				<td colspan="4"><input type="number" id="golstimea"
					name="golstimea" placeholder="Gols do Time A" size="20"
					value="${jogo.golstimea }"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="number" id="codigotimeb"
					name="codigotimeb" placeholder="Código do Time B" size="40"
					value="${jogo.codigotimeb }"></td>
				<td colspan="4"><input type="number" id="golstimeb"
					name="golstimeb" placeholder="Gols do Time B" size="20"
					value="${jogo.golstimeb }"></td>
			</tr>
			<tr>
				<td colspan="4">
				
				<div>
				<html lang="en">
				<head>
  				<meta charset="utf-8">
  				<meta name="viewport" content="width=device-width, initial-scale=3">
  				<title>jQuery UI Datepicker - Default functionality</title>
  				<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  				<link rel="stylesheet" href="/resources/demos/style.css">
  				<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  				<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  					<script>
  						$( function() {
    					$( "#datepicker" ).datepicker({
    			            dateFormat: "yy-mm-dd"
    			        });
  						} );
  					</script>
				</head>
				<body>
 
				<p>Data: <input type="text" id="datepicker" name="datepicker"></p>
				</body>
				
				</div>
				
			</tr>
			<tr>
				<td><input type="submit" value="Cadastrar" id="button"
					name="button"></td>
				<td><input type="submit" value="Atualizar" id="button"
					name="button"></td>
				<td><input type="submit" value="Excluir" id="button"
					name="button"></td>
				<td><input type="submit" value="Listar" id="button"
					name="button"></td>
				
			</tr>
			<tr>
				<td><input type="submit" value="Partidas Por Data" id="button"
					name="button"></td>
				<td><input type="submit" value="Gerar Partidas" id="button"
					name="button"></td>
			</tr>
		</table>
	</form>
	
	<div>
		<c:if test="${not empty saida }">
			<p>
				<c:out value="${saida }"></c:out>
			</p>
		</c:if>
		<c:if test="${not empty erro }">
			<p style="color: magenta">
				<c:out value="${erro }"></c:out>
			</p>
		</c:if>
	</div>
	<div>
		<c:if test="${not empty listaJogos }">
			<table border="1">
				<thead>
					<tr>
						<th>ID do Jogo</th>
						<th>Código do Time A</th>
						<th>Código do Time B</th>
						<th>Gols do Time A</th>
						<th>Gols do Time B</th>
						<th>Data do Jogo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="jogo" items="${listaJogos }">
						<tr>
							<td><input type="number" id="idjogo" name="idjogo"
								placeholder="" size="10" value="${jogo.idjogo }"></td>
							<td><input type="number" id="codigotimea" name="idjogo"
								placeholder="" size="10" value="${jogo.codigotimea }"></td>
							<td><input type="number" id="codigotimeb" name="idjogo"
								placeholder="" size="10" value="${jogo.codigotimeb }"></td>
							<td><input type="number" id="golstimea" name="idjogo"
								placeholder="" size="10" value="${jogo.golstimea }"></td>
							<td><input type="number" id="golstimeb" name="idjogo"
								placeholder="" size="10" value="${jogo.golstimeb }"></td>
							<td><input type="text" id="datahora" name="idjogo"
								placeholder="" size="10" value="${jogo.datahora }"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>