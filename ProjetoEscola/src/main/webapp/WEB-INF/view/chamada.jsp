<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chamada</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
		<br />
	</div>
	<div>
		
		<form action="chamada" method="post">
		
			<table>
			 <tr>
				<td><input type="text" id="codigoDisciplina" name="codigoDisciplina" min="0" placeholder="Codigo Disciplina"></td>			
				<%-- <td colspan="1"><input type="submit" value="Buscar" id="button" name="button"></td> --%>
			</tr>			
			</table>
	
			<br /><br />
			
			<table>
			<tr>
				<td colspan="4">
				
				<div>
				<html lang="en">
				<head>
  				<meta charset="utf-8">
  				<meta name="viewport" content="width=device-width, initial-scale=3">
  				<title>jQuery UI Datepicker - Default functionality</title>
  				<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  				<link rel="stylesheet" href="/resources/demos/style.css">
  				<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  				<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  					<script>
  						$( function() {
    					$( "#datepicker" ).datepicker({
    			            dateFormat: "yy-mm-dd"
    			        });
  						} );
  					</script>
				</head>
				<body>
 
				<p>Data: <input type="text" id="datepicker" name="datepicker"></p>
      			
				</body>
				
				</div>
					
			</tr>
			</table>
				<c:if test="${not empty listaAlunoDisciplina }">
				
				<table>
				<c:forEach items="${listaAlunoDisciplina }" var="ad">
				<tr>
					<td><c:out value="${ad.aluno.ra }" /></td>
					<td><c:out value="${ad.aluno.nome_a }" /></td>
					<td><c:out value="${ad.disciplina.sigla }" /></td>
					<%-- <td><input type="number" id=${p.id } name=${p.id } min="0" size="5"></td> --%>
					<td><input type="number" id="num_aulas" name="num_aulas" min="0" value="4" placeholder="4"></td>
				</tr>
				</c:forEach>

				<tr>
					<td colspan="4"><input type="submit" value="Finalizar Chamada" id="button" name="button"></td>
				</tr>
				</table>
				</c:if>
				
			<br /><br />
				<h2>Alunos matriculados</h2>
				<c:if test="${not empty listaAlunos }">
				
				<table>
				<c:forEach items="${listaAlunos }" var="a">
				<tr>
					<td><c:out value="${a.ra }" /></td>
					<td><c:out value="${a.nome_a }" /></td>
					<td><c:out value="${ad.disciplina.sigla }" /></td>
					<td></td>
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