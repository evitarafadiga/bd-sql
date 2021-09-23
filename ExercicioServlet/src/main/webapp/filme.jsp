<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filme</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp"></jsp:include>
		<br />
	</div>
	<form action="filme" method="post">
	<table>
		<tr>
			<td><input type="number" id="idfilme" name="idfilme" placeholder="ID" value="${filme.idfilme }"></td>
			<td><input type="submit" value="Buscar" id="button" name="button"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" id="nomeBR" name="nomeBR" placeholder="Nome em Português do Brasil" size="40" value="${filme.nomeBR }"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" id="nomeEN" name="nomeEN" placeholder="Nome em Inglês" size="40" value="${filme.nomeEN }"></td>
		</tr>
		<tr>
			<td><input type="number" id="anoLancamento" name="anoLancamento" placeholder="Ano de Lançamento" value="${filme.anoLancamento }"></td>
		</tr>
		<tr>
			<td><input type="text" id="sinopse" name="sinopse" placeholder="Sinopse" size="40" value="${filme.sinopse }"></td>
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
		<c:if test="${not empty listaFilmes }">
			<table border="1">
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome em PT-BR</th>
					<th>Nome em Inglês</th>
					<th>Ano de Lançamento</th>
					<th>Sinópse</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="film" items="${listaFilmes }">
					<tr>
						<td>${film.idfilme }</td>
						<td>${film.nomeBR }</td>
						<td>${film.nomeEN }</td>
						<td>${film.anoLancamento }</td>
						<td>${film.sinopse }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>