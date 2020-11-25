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
    <title>Empregado | Cadastrar-se</title>
    <!-- Font Icon -->
    <link rel="stylesheet" href="/fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="/css/fontawesome.min.css"> 
    <!-- Main css -->
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<center><h3>Spring Boot CRUD</h3></center>
     <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h3 class="form-title">Cadastro de Empregado</h3>
                        <form:form modelAttribute="empregado-cadastro_empregado" method="POST" action="/empregado/salvarEmpregado" cssClass="register-form"
                         id="register-form">
                             <form:hidden path="id"/>
                            <div class="form-group">
                                <label for="fname"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="primeiroNome" name="firstName" id="firstName" placeholder="Primeiro Nome" required="required"/>
                            	<form:errors path="primeiroNome" cssStyle="color:red;" cssClass="error"/>
                            </div>
                            <div class="form-group">
                                <label for="lname"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="ultimoNome" name="lastName" id="lastName" placeholder="Último Nome" required="required"/>
                            	<form:errors path="ultimoNome" cssStyle="color:red;" cssClass="error"/>
                            </div>
                             <c:choose> 
 								  <c:when test="${not empty testData}"> 
 								    <div class="form-group">
 		                                <label for="email"><i class="zmdi zmdi-email"></i></label> 
 		                                <form:input type="email" path="email" readonly="true" name="email" id="email" placeholder="Email"
 		                                 required="required"/> 
 		                            	<form:errors path="email" cssStyle="color:red;" cssClass="error"/> 
                             	   </div> 
 								  </c:when> 
 								  <c:otherwise> 
 								   	<div class="form-group"> 
 		                                <label for="email"><i class="zmdi zmdi-email"></i></label> 
 		                                <form:input type="email" path="email" name="email" id="email" placeholder="Email" required="required"/> 
 		                            	<form:errors path="email" cssStyle="color:red;" cssClass="error"/> 
                             		</div> 
 								  </c:otherwise> 
								</c:choose> 
	                            <c:choose>  
								  <c:when test="${not empty testData}">
								    <div class="form-group">
		                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
		                                <form:password path="senha" name="pass" value="${passwords}" id="pass" placeholder="Senha"/>
	                            		<form:errors path="senha" cssStyle="color:red;" cssClass="error"/>
                           			</div>
								  </c:when>
								  <c:otherwise>
								   	<div class="form-group">
		                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
		                                <form:password path="senha" name="pass" id="pass" placeholder="Senha" required="required"/>
	                            		<form:errors path="senha" cssStyle="color:red;" cssClass="error"/>
                           			</div>
								  </c:otherwise>
							</c:choose>
                            <div style="display: flex; justify-content: space-between;" class="form-group"> 
                                Masculino: <form:radiobutton path="genero" value="Masculino"/>
								Feminino: <form:radiobutton path="genero" value="Feminino"/>
								<form:errors path="genero" cssStyle="color:red;" cssClass="error"/>
                            </div>
                            <div class="form-group">
                                <label for="dob"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input type="date" path="dataNascimento" id="dob" name="dob" required="required"/>
                                <form:errors path="dataNascimento" cssStyle="color:red;" cssClass="error"/>
                            </div>
                            <div class="form-group">
                                <label for="department"><i class="zmdi zmdi-account material-icons-name"></i></label>&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:select path="departamento" name="department" id="department" 
                                cssStyle="border: 1px solid #ccc;background: transparent;border: none;font-size: 14px;height: 29px;padding: 5px;
                                width: 268px;" cssClass="" required="required">
                                <form:option value="">---Selecione o Departamento--</form:option>
	                                <form:option value="TI">TI</form:option>
	                                <form:option value="Financeiro">Financeiro</form:option>
	                                <form:option value="RH">Recursos Humanos</form:option>
	                                <form:option value="Comercial">Comercial</form:option>
	                                <form:option value="Comunicação">Comunicação</form:option>
	                                <form:option value="Marketing">Marketing</form:option>
                                </form:select>                      
                                <form:errors path="departamento" cssStyle="color:red;" cssClass="error"/>  
                            </div>
                            <div class="form-group">
                                <label for="designation"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <form:input path="designacao" name="designation" id="designation" placeholder="Designação" required="required"/>
                            	<form:errors path="designacao" cssStyle="color:red;" cssClass="error"/>  
                            </div>   
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"  required="required"/>
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>Eu concordo com todas as afirmações  
                                <a href="#" class="term-service">Termos de serviço</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Cadastrar"/>
                            </div>
                            <input type="hidden" name="testData" value="${testData}"/>
                        </form:form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="/images/signup-image.jpg" alt="sing up image"></figure>
                 <div style="display: flex; justify-content: space-between;">
					<a href="${pageContext.request.contextPath}/empregado/acesso" class="signup-image-link" title="Sou Membro"><i class="fa fa-sign-in" aria-hidden="true"></i></a> 
					<a href="${pageContext.request.contextPath}/empregado/inicio" class="signup-image-link" title="Ir Início"><i class="fa fa-home" aria-hidden="true"></i></a>
				</div>
                    </div>
                </div>
            </div>
        </section>
        
    <!-- JS -->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/js/main.js"></script>
</body>
</html>