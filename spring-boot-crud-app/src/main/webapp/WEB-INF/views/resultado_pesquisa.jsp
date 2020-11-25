<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Empregado | Todos Empregados</title>
<!-- Main css -->
<!-- <link rel="stylesheet" href="/css/style.css"> -->
<link rel="stylesheet" href="/css/styles.css">
<link rel="stylesheet" href="/css/test.css"> 
<link rel="stylesheet" href="/css/fontawesome.min.css"> 
</head>
<body style="background-color:#F0F3F4;">	
<br>
	<center>
		<h3>Spring Boot CRUD</h3>
	</center>
	<!-- Sign up form -->
	<section class="signup">
				<!-- put new button: Add Customer -->
		
				<br>
				<!--  add a search box -->
				<form:form action="procura-empregadoId"  method="POST">
                 <input type="text" placeholder="Id Empregado"	required="required" name="empregadoId" />
					<input type="submit" name="search" id="search" class="form-submit" value="Pesquisar"/>
				</form:form>
				<!--  add our html table here -->
				<c:set var="count" value="0" scope="page" />
<br>
				<table border="1" style="border: 1px solid black;">
					<tr>
						<th>N° Emp</th>
						<th>Nome</th>
						<th>Sobrenome</th>
						<th>Id Emp</th>
						<th>Email</th>
						<th>Data de Nascimento</th>
						<th>Gênero</th>
						<th>Departamento</th>
						<th>Designação</th>
					</tr>

<!-- loop over and print our employees -->
				<c:forEach var="Empregado" items="${resultado}">
				<c:set var="count" value="${count + 1}" scope="page"/>
					<tr>
						<td>${count}</td>
						<td> ${Empregado.primeiroNome} </td>
						<td> ${Empregado.ultimoNome} </td>
						<td> ${Empregado.empregadoId} </td>
						<td> ${Empregado.email} </td>
						<td> ${Empregado.dataNascimento} </td>
						<td> ${Empregado.genero} </td>
						<td> ${Empregado.departamento} </td>
						<td> ${Empregado.designacao} </td>
						
					</tr>
				
				</c:forEach>
</table>

				<br><br>
				<div style="display: flex; justify-content: space-between;">
					<a href="${pageContext.request.contextPath}/empregado/acesso" class="signup-image-link" title="Sou Membro"><i class="fa fa-sign-in" aria-hidden="true"></i></a>
					<a href="${pageContext.request.contextPath}/empregado/cadastro_empregado" class="signup-image-link" title="Crie uma conta"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
					<a href="${pageContext.request.contextPath}/empregado/inicio" class="signup-image-link" title="Ir Início"><i class="fa fa-home" aria-hidden="true"></i></a>
				</div>
			
			<br> <br> <br>
	
	</section>
</body>
</html>