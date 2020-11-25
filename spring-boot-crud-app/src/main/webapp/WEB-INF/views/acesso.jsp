<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Empregado | Entrar em</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="/css/fontawesome.min.css"> 

    <!-- Main css -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<center><h3>Spring Boot CRUD</h3></center>
 <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="/images/signin-image.jpg" alt="sing up image"></figure>
		                <div style="display: flex; justify-content: space-between;">
							<a href="${pageContext.request.contextPath}/empregado/cadastro_empregado" class="signup-image-link" title="Crie uma conta"><i class="fa fa-user-plus"></i></a>
							<a href="${pageContext.request.contextPath}/empregado/inicio" class="signup-image-link" title="Ir In�cio"><i class="fa fa-home" aria-hidden="true"></i></a>
						</div>
                        <spring:url value="/empregado/validarEmpregado" var="sign-in-URL" />
                    </div>

                    <div class="signin-form">
                        <h3 class="form-title">Formul�rio de sess�o empregado</h3>
                        <form:form modelAttribute="empregado-acesso" action="/empregado/validarEmpregado" method="POST" 
                        cssClass="register-form" id="login-form">
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <form:input type="email" path="email" name="email" id="email" placeholder="Email" required="required"/>
                            	<form:errors path="email" cssStyle="color:red;" cssClass="error"/>
                            </div>
                            <div class="form-group">
                                <label for="senha"><i class="zmdi zmdi-lock"></i></label>
                               <form:password path="senha" name="pass" id="pass" placeholder="Senha" required="required"/>
                               <form:errors path="senha" cssStyle="color:red;" cssClass="error"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Lembrar-me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Entrar"/>
                            </div>
                        </form:form> 
                    </div>
                </div>
            </div>
        </section>


    <!-- JS -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/js/main.js"></script>
</body>
</html>