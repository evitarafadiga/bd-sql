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
				<td colspan="10"><input type="number" id="idjogo" name="idjogo" placeholder="" size="40" value="${jogo.idjogo }"></td>
				<td><input type="submit" value="Buscar" id="button" name="button"></td>
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
				<td><input type="submit" value="Cadastrar" id="button"
					name="button"></td>
				<td><input type="submit" value="Atualizar" id="button"
					name="button"></td>
				<td><input type="submit" value="Excluir" id="button"
					name="button"></td>
				<td><input type="submit" value="Listar" id="button"
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
					</tr>
				</thead>
				<tbody>
					<c:forEach var="jogo" items="${listaJogos }">
						<tr>
							<td>${jogo.idjogo }</td>
							<td>${jogo.codigotimea }</td>
							<td>${jogo.codigotimeb }</td>
							<td>${jogo.golstimea }</td>
							<td>${jogo.golstimeb }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>