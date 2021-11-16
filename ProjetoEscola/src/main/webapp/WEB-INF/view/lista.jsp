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
				<td><input type="number" id="codigo" name="codigo" min="0" placeholder="Codigo" required="required"></td>
			</tr>
			<tr>
				<td colspan="1"><input type="submit" value="Buscar" id="button" name="button"></td>
			</tr>			
			</table>
			<br /><br />
			
			<c:if test="${not empty listaAlunoDisciplina }">
			<table border="1">
				<thead>
					<tr>
						<th>RA</th>
						<th>Nome Aluno</th>
						<th>Codigo Disciplina</th>
						<th>Nome Disciplina</th>
						<th>Data</th>
						<th>Presenca</th>
					</tr>
				</thead>
				<c:forEach items="${listaAlunoDisciplina }" var="pr">
				<tr>
					<td><c:out value="${ad.aluno.ra }" /></td>
					<td><c:out value="${ad.aluno.nome }" /></td>
					<td><c:out value="${ad.disciplina.codigo }" /></td>
					<td><c:out value="${ad.disciplina.nome }" /></td>
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