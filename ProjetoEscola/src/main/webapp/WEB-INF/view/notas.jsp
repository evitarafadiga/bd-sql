<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notas</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
		<br />
	</div>
	<div>
		<form action="notas" method="post">
		
			<br /><br />
			<c:if test="${not empty listaAlunos }">
			<td><input type="text" id="codigoDisciplina" name="codigoDisciplina" min="0" placeholder="Código da Disciplina"></td>
			<br /><br />
			<table>
				<c:forEach items="${listaAlunos }" var="a">
				<tr>
					<td><c:out value="${a.ra }" /></td>
					<td><c:out value="${a.nome_a }" /></td>
					<td><c:out value="${ad.disciplina.sigla }" /></td>
					<td><input type="text" id=${ad.presenca } name=${ad.presenca } min="0" size="1"></td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><input type="submit" value="Finalizar Chamada" id="button" name="button"></td>
				</tr>
			</table>
			</c:if>
			
			</form>
			
			
	</div>
</body>
</html>