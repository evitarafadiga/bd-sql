<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Notas</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
		<br />
	</div>
	<div>
			<form action="listanotas" method="post">
			
			<table>
			 <tr>
				<td><input type="text" id="codigoDisciplina" name="codigoDisciplina" min="0" placeholder="Codigo Disciplina" required></td>			
				<td colspan="1"><input type="submit" value="Buscar" id="button" name="button"></td>
			</tr>			
			</table>
	
			<br /><br />
			<c:if test="${not empty listaNotas }">
			<table border="1">
				<thead>
					<tr>
						<th>RA</th>
						<th>Aluno</th>
						<th>C�d. Disciplina</th>
						<th>Disciplina</th>
						<th>Turno</th>
						<th>N. Avalia��o</th>
						<th>Tipo</th>
						<th>Nota</th>
					</tr>
				</thead>
				<c:forEach var="n" items="${listaNotas }">
				<tr>
					<td><c:out value="${n.aluno.ra }" /></td>
					<td><c:out value="${n.aluno.nome_a }" /></td>
					<td><c:out value="${n.disciplina.codigo }" /></td>
					<td><c:out value="${n.disciplina.sigla }" /></td>
					<td><c:out value="${n.disciplina.turno }" /></td>
					<td><c:out value="${n.avaliacao.codigo_a }" /></td>
					<td><c:out value="${n.avaliacao.tipo }" /></td>
					<td><c:out value="${n.nota }" /></td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
		</form>
	</div>
	<div>
		<c:if test="${not empty erro }">
			<H2 style="color: red"><c:out value="${erro }" /></H2>
		</c:if>
	</div>
</body>
</html>