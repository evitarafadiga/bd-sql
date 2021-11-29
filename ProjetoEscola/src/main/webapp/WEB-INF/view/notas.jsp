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
	<div align="center">
		<form action="notas" method="post">
			<table>
				<tr>	
				<td><input type="text" id="codigoDisciplina" name="codigoDisciplina" min="0" placeholder="Código da Disciplina" required></td>
				<td><input type="number" id="codigoAvaliacao" name="codigoAvaliacao" min="1001" value="1001" placeholder="Código da Avaliação" required></td>
				<td><input type="text" id="tipo" value="${n.avaliacao.tipo }" name="tipo" required /></td>
				<td colspan="1"><input type="submit" value="Buscar" id="button" name="button"></td>
				</tr>
				</table>
				
				<br /><br />
				
				<c:if test="${not empty listaNotas }">
				<table>	
				<c:forEach items="${listaNotas }" var="n">
				<tr>
					<td><c:out value="${n.aluno.ra }" /></td>
					<td><c:out value="${n.aluno.nome_a }" /></td>
					<td><c:out value="${n.disciplina.sigla }" /></td>
					<td>-<c:out value="${n.disciplina.turno }" /></td>
					<td> | Avaliação no. <c:out value="${n.avaliacao.codigo_a }" /></td>
					<td><input type="number" step="0.1" id="nota" name="${n.aluno.ra }" value="0.0" min="0" max="10" size="5"></td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><input type="submit" value="Inserir" id="button" name="button"></td>
				</tr>
			</table>
			</c:if>
			
		<br /><br /> 
		
		</form>
	</div>
	<div>
		<c:if test="${not empty erro }">
			<H2 style="color: red"><c:out value="${erro }" /></H2>
		</c:if>
	</div>
</body>
</html>