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
<title>Emprego | Bem Vindo</title>
<!-- Main css -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/fontawesome.min.css">
</head>
<body><br> <br> <br>
	<center>
		<h3>Spring Boot CRUD</h3>
	</center>
	<!-- Sign up form -->
	<section class="signup">
		<div class="container">
			<br>
			<center>
				<h2>Sistema de Gestão de Funcionários</h2>
			</center>
			<div class="signup-image">
			<c:if test="${not empty ename}">
				<center><h1>Bem-vinda(o), ${ename}</h1></center>
			</c:if>
				<br>
				<br>
				<div style="display: flex; justify-content: space-between;">
					<a href="${pageContext.request.contextPath}/empregado/inicio" class="signup-image-link" title="Ir Início"><i class="fa fa-home" aria-hidden="true"></i></a> 
					<a href="${pageContext.request.contextPath}/empregado/consulta_empregados" class="signup-image-link" title="Visualizar Empregados"><i class="fa fa-eye" aria-hidden="true"></i></a>
					<a href="${pageContext.request.contextPath}/empregado/" class="signup-image-link" title="Sair"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
				</div>
			</div>
			<br> <br> <br>
		</div>
	</section>
</body>
</html>