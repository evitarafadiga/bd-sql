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
			<td><input type="submit" value="Buscar" id="button" name="button"></td>
			
			<td><input type="submit" value="Gerar Grupos" id="button" name="button"></td>
		</tr>
		<tr>
			<td colspan="4"><input type="text" id="letra" name="letra" placeholder="Chave" value="${grupo.letra }"></td>
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
		
    		<c:if test="${grup.letra=='A'}">
    		<c:forEach var="grup" items="${listaGrupos }">
        		<table border="1">
			<thead>
				<tr>
					<th>Chave A</th>
					<th>Código do Time</th>
				</tr>
			</thead>
			<tbody>
				
					<tr>
						<td>${grup.letra }</td>
						<td>${grup.codigotimegrupo }</td>
					</tr>
				
			</tbody>
			</table> 
        		<br />
        	</c:forEach>
    		</c:if>
    		<c:if test="${grup.letra=='B'}">
    		<c:forEach var="grup" items="${listaGrupos }">
        		<table border="1">
			<thead>
				<tr>
					<th>Chave B</th>
					<th>Código do Time</th>
				</tr>
			</thead>
			<tbody>
				
					<tr>
						<td>${grup.letra }</td>
						<td>${grup.codigotimegrupo }</td>
					</tr>
				
			</tbody>
			</table> 
        		<br />
        	</c:forEach>
    		</c:if> 
    		<c:if test="${grup.letra=='C'}">
    		<c:forEach var="grup" items="${listaGrupos }">
        		<table border="1">
			<thead>
				<tr>
					<th>Chave C</th>
					<th>Código do Time</th>
				</tr>
			</thead>
			<tbody>
				
					<tr>
						<td>${grup.letra }</td>
						<td>${grup.codigotimegrupo }</td>
					</tr>
				
			</tbody>
			</table> 
        		<br />
        	</c:forEach>
    		</c:if> 
    		
    		<c:if test="${grup.letra=='D'}">
    		<c:forEach var="grup" items="${listaGrupos }">
        		<table border="1">
			<thead>
				<tr>
					<th>Chave D</th>
					<th>Código do Time</th>
				</tr>
			</thead>
			<tbody>
				
					<tr>
						<td>${grup.letra }</td>
						<td>${grup.codigotimegrupo }</td>
					</tr>
				
			</tbody>
			</table> 
        		<br />
        	</c:forEach>
    		</c:if>  
	
		</c:if>
	</div>
	
</body>
</html>