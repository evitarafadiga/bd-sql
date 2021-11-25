<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
		<br />
	</div>
	<div>
			<form action="lista" method="post">
			
			<table>
			 <tr>
				<td><input type="text" id="codigoDisciplina" name="codigoDisciplina" min="0" placeholder="Codigo Disciplina" required></td>			
				<td colspan="1"><input type="submit" value="Buscar" id="button" name="button"></td>
			</tr>			
			</table>
	
			<br /><br />
			<c:if test="${not empty listaAlunoDisciplina }">
			<table border="1">
				<thead>
					<tr>
						<th>Cód. Disciplina</th>
						<th>Disciplina</th>
						<th>Sigla</th>
						<th>Turno</th>
						<th>N. de Aulas</th>
						<th>RA</th>
						<th>Aluno</th>
						<th>Data</th>
						<th>Presencas</th>
					</tr>
				</thead>
				<c:forEach var="ad" items="${listaAlunoDisciplina }">
				<tr>
					<td><c:out value="${ad.disciplina.codigo }" /></td>
					<td><c:out value="${ad.disciplina.nome_d }" /></td>
					<td><c:out value="${ad.disciplina.sigla }" /></td>
					<td><c:out value="${ad.disciplina.turno }" /></td>
					<td><c:out value="${ad.disciplina.num_aulas }" /></td>
					<td><c:out value="${ad.aluno.ra }" /></td>
					<td><c:out value="${ad.aluno.nome_a }" /></td>
					<td><c:out value="${ad.dataf }" /></td>
					<td><c:out value="${ad.presenca }" /></td>
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