<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Grupos</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
		<br />
	</div>
	<form action="grupo" method="post">
	<table>
		<tr>
			<td><input type="number" id="id" name="id" placeholder="ID" value="${grupo.id }"></td>
			<td><input type="submit" value="Buscar" id="button" name="button"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" id="letra" name="letra" placeholder="Chave" size="40" value="${grupo.letra }"></td>
		</tr>
		<tr>
			<td><input type="number" id="codigotimegrupo" name="codigotimegrupo" placeholder="Codigo do Time do Grupo" value="${grupo.codigotimegrupo }"></td>
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
		<c:if test="${not empty listaGrupos }">
			<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>Chave</th>
					<th>Código do Time Grupo</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="grup" items="${listaGrupos }">
					<tr>
						<td>${grup.id }</td>
						<td>${grup.letra }</td>
						<td>${grup.codigotimegrupo }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>