<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:remove var="ename" scope="session" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Empregado | Início</title>
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

				<form style="display: flex; justify-content: space-between;" method="post" action="/empregado/pesquisa-palavrachave">
					<input type="text" name="keyword" id="search" placeholder="Pesquisa Empregado" required="required"/>
                     <input type="submit" name="signup" id="signup" class="form-submit" value="Pesquisar"/>
				</form>
				<br>
				<br>
				<div style="display: flex; justify-content: space-between;">
					<a href="${pageContext.request.contextPath}/empregado/acesso" class="signup-image-link" title="Sou Membro"><i class="fa fa-sign-in" aria-hidden="true"></i></a> 
					<a href="${pageContext.request.contextPath}/empregado/cadastro_empregado" class="signup-image-link" title="Crie uma conta"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
					<a href="${pageContext.request.contextPath}/empregado/consulta_empregados" class="signup-image-link" title="Visualizar Empregados"><i class="fa fa-eye" aria-hidden="true"></i></a>
				</div>
			</div>
			<br> <br> <br>
		</div>
	</section>
</body>
</html>