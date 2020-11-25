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
		<h3>Lista de Empregados</h3><br>
		<c:if test="${not empty ename }">
			<h3>Bem-vinda(o),  ${ename}</h3><br>
			<a href="${pageContext.request.contextPath}/empregado/" class="signup-image-link" title="Sair"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
		</c:if>
	</center>
	<!-- Sign up form -->
	<section class="signup">
		
				<br>
				<!--  add a search box -->
				<form:form action="procura-empregadoId"  method="POST">
                 <input type="text" placeholder="Id Empregado" required="required" name="empregadoId" />
				 <input type="submit" name="search" id="search" class="form-submit" value="Pesquisar"/>
				</form:form>
				<a href="${pageContext.request.contextPath}/empregado/deletarTodos" style="float: right;" class="signup-image-link" onclick="return confirm('T�m certeza de que deseja excluir todos os funcion�rios?');" title="Excluir todos os funcion�rios"><i class="fa fa-trash-o" aria-hidden="true"></i></a><br>
				<!--  add our html table here -->
				<c:set var="count" value="0" scope="page" /><br>
				<table border="1" style="border: 1px solid black;">
					<tr>
						<th>N� Emp</th>
						<th>Nome</th>
						<th>Sobrenome</th>
						<th>Id Emp</th>
						<th>Email</th>
						<th>Data de Nascimento</th>
						<th>G�nero</th>
						<th>Departamento</th>
						<th>Designa��o</th>
						<th>A��o</th>
					</tr>
			<c:choose>
				<c:when test="${not empty empregadoList}">
					<!-- loop over and print our employees -->
				<c:forEach var="Empregado" items="${empregadoList}">
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
						<td> <a href="${pageContext.request.contextPath}/empregado/atualizarEmpregado/${Empregado.id}" title="Alterar"><i class="fa fa-edit"></i></a> |
						 <a href="${pageContext.request.contextPath}/empregado/deletarEmpregado/${Empregado.id}" onclick="return confirm('T�m certeza de que deseja excluir ${Empregado.primeiroNome} ${Empregado.ultimoNome} ?');" title="Excluir"><i class="fa fa-trash" aria-hidden="true"></i></a> </td>
					</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<center><h1>Nenhum Funcion�rio Encontrado.</h1></center>
				</c:otherwise>
			</c:choose>
				
</table>

				<br><br>
				<div style="display: flex; justify-content: space-between;">
					<a href="${pageContext.request.contextPath}/empregado/acesso" class="signup-image-link" title="Sou Membro"><i class="fa fa-sign-in" aria-hidden="true"></i></a>
					<a href="${pageContext.request.contextPath}/empregado/cadastro_empregado" class="signup-image-link" title="Crie uma conta"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
					<a href="${pageContext.request.contextPath}/empregado/inicio" class="signup-image-link" title="Ir In�cio"><i class="fa fa-home" aria-hidden="true"></i></a>
				</div>
			
			<br> <br> <br>
	
	</section>
</body>
</html>