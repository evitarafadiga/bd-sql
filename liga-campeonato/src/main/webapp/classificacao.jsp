<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Classificação</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
		<br />
	</div>
	<form action="classificacao" method="post">
	<table>
		<tr>
			<td><input type="submit" value="Classificacao" id="button" name="button"></td>
		</tr>
	</table>
	</form>
		<div>
		<c:if test="${not empty listaClas }">
		<c:forEach var="clas" items="${listaClas }">    	
        		<table border="1">
			<thead>
				<tr>
					<th>Nome Time</th>
					<th>Partidas</th>
					<th>Vitórias</th>
					<th>Empates</th>
					<th>Derrotas</th>
					<th>Gols Marcados</th>
					<th>Gols Sofridos</th>
					<th>Saldo Gols</th>
					<th>Pontos</th>
				</tr>
			</thead>
			<tbody>
				
					<tr>
						<td>${clas.nome_time }</td>
						<td>${clas.partidas }</td>
						<td>${clas.vitorias }</td>
						<td>${clas.empates }</td>
						<td>${clas.derrotas }</td>
						<td>${clas.gols_marcados }</td>
						<td>${clas.gols_sofridos }</td>
						<td>${clas.saldo_gols }</td>
						<td>${clas.pontos }</td>
					</tr>
				
			</tbody>
			</table> 
        		<br />
		</c:forEach>
		</c:if>
	</div>
</body>
</html>