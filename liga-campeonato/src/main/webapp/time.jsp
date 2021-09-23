<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Times</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
		<br />
	</div>
	<form action="time" method="post">
	<table>
		<tr>
			<td><input type="number" id="codigotime" name="codigotime" placeholder="Codigo" value="${time.codigotime }"></td>
			<td><input type="submit" value="Buscar" id="button" name="button"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" id="nome" name="nometime" placeholder="Nome do Time" size="40" value="${time.nometime }"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" id="cidade" name="cidade" placeholder="Cidade" size="40" value="${time.cidade }"></td>
		</tr>
		<tr>
			<td><input type="text" id="estadio" name="estadio" placeholder="Estadio" value="${time.estadio }"></td>
		</tr>
		<tr>
			<td><input type="submit" value="Cadastrar" id="button" name="button"></td>
			<td><input type="submit" value="Atualizar" id="button" name="button"></td>
			<td><input type="submit" value="Excluir" id="button" name="button"></td>
			<td><input type="submit" value="Listar" id="button" name="button"></td>
		</tr>
	</table>
	</form>
	<div>
		<c:if test="${not empty saida }">
		<p><c:out value="${saida }"></c:out></p>
		</c:if>
		<c:if test="${not empty erro }">
		<p style="color: magenta"><c:out value="${erro }"></c:out></p>
		</c:if>
	</div>
	<div>
		<c:if test="${not empty listaTimes }">
			<table border="1">
			<thead>
				<tr>
					<th>Codigo</th>
					<th>Nome do Time</th>
					<th>Cidade</th>
					<th>Estadio</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="time" items="${listaTimes }">
					<tr>
						<td>${time.codigotime }</td>
						<td>${time.nometime }</td>
						<td>${time.cidade }</td>
						<td>${time.estadio }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>