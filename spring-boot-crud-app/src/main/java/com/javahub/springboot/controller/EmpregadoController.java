package com.javahub.springboot.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.javahub.springboot.entity.Empregado;
import com.javahub.springboot.service.EmpregadoService;
import com.javahub.springboot.utils.Utils;

@Controller
@RequestMapping("/empregado")
public class EmpregadoController {

	// @InitBinder - pre process every string data.
	// removes the leading & trailing white spaces.
	// If string only has white space .... trim it to null.

	@InitBinder
	public void initBinder(WebDataBinder dataBinder) {
		StringTrimmerEditor ste = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class, ste);
	}

	// Injetar EmployeeService para chamar seus métodos
	@Autowired
	EmpregadoService empregadoService;

	// Injetar Utils para chamar seus métodos
	@Autowired
	Utils utils;

	// Injete BCryptPasswordEncoder para a codificação de senha o comprimento padrão é 60. +
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	// Mostrar página inicial
	@GetMapping(value = { "/", "/home", "/inicio", "default" })
	public ModelAndView mostrarInicio() {
		System.out.println(this.getClass().getSimpleName() + ":=======>Mostrando a página inicial.");
		return new ModelAndView("inicio"); // chamada de início que é o nome da página jsp
	}

	// Mostrar páginas de consulta de empregados
	@GetMapping("/consulta_empregados")
	public ModelAndView mostrarTodosEmpregados() {
		System.out.println(this.getClass().getSimpleName() + ":=======>Mostrando a lista de empregados.");
		ModelAndView mav = new ModelAndView("consulta_empregados"); // Chamada de consulta_empregados que é o nome da página jsp
		List<Empregado> empregadoList = empregadoService.getTodosEmpregados();
		mav.addObject("empregadoList", empregadoList); // Setado o atributo como "empregadoList"
		return mav;
	}

	// Mostrar página cadastro de empregado
	@GetMapping("/cadastro_empregado")
	public ModelAndView mostrarCadastroEmpregado() {
		System.out.println(this.getClass().getSimpleName() + ":=======>Mostrando a página de cadastro de empregados.");
		ModelAndView mav = new ModelAndView("cadastro_empregado"); // Chamada de cadastro_empregado que é o nome da página jsp
		mav.addObject("empregado-cadastro_empregado", new Empregado()); // Setado o atributo como "empregado-cadastro_empregado"
		return mav;
	}

	// Mostrar página de acesso
	@GetMapping("/acesso")
	public ModelAndView mostrarAcesso() {
		System.out.println(this.getClass().getSimpleName() + ":=======>Mostrando a página de acesso.");
		ModelAndView mav = new ModelAndView("acesso"); // Chamada de acesso que é o nome da página jsp
		mav.addObject("empregado-acesso", new Empregado()); // Setado o atributo como "empregado-acesso"
		return mav;
	}

	// Mostrar página de boas-vindas após acesso com sucesso
	@GetMapping("/boas_vindas")
	public ModelAndView mostrarMessagemBoasVindas() {
		System.out.println(this.getClass().getSimpleName() + ":=======>Mostrando a página de boas-vindas .");
		return new ModelAndView("boas_vindas"); // Chamada de boas_vindas que é o nome da página jsp
	}

	// Salvar Empregado através da página/formulário de cadastro
	@PostMapping("/salvarEmpregado")
	public ModelAndView salvarEmpregado(@Valid @ModelAttribute("empregado-cadastro_empregado") Empregado empregado, BindingResult br,
			HttpServletRequest request, HttpSession session) throws ParseException {
		if (request.getParameter("testData") == null || request.getParameter("testData").isEmpty()
				|| request.getParameter("testData").equals("")) {
			System.out.println("testData......." + request.getParameter("testData"));
			System.out.println("In If.......");
			System.out.println(this.getClass().getSimpleName() + ":=======>Chegada de pedido de salvamento do empregado.");
			Empregado empregadoExiste = empregadoService.getEmpregadoByEmail(empregado.getEmail());
			System.out.println(this.getClass().getSimpleName() + ":=======>empregadoExiste = " + empregadoExiste);
			// Verifica se empregado existe
			if (empregadoExiste != null) {
				System.out.println(this.getClass().getSimpleName() + ":=======>" + empregado.getEmail()
						+ " Esse email já existe!");
				br.rejectValue("email", "error.employee", "Este email já existe!");
			}
			// Verifica se algum campo está vazio ou nulo
			if (br.hasErrors()) {
				System.out.println(this.getClass().getSimpleName() + ":=======>BindingResult encontrou um erro.");
				return new ModelAndView("cadastro_empregado");
			} else {
				String firstName = empregado.getPrimeiroNome(); // Retorna o Primeiro Nome
				String lastName = empregado.getUltimoNome(); // Retorna o Último Nome
				// Pega o primeiro caractere (1st) do primeiroNome & ultimoNome and concatena eles
				String nameChar = firstName.substring(0, 1) + lastName.substring(0, 1);
				// Chama a função random para gerar número aleatório do Idempregado
				String empregadoId = nameChar.toUpperCase() + utils.generateRandomNumber();
				System.out.println(this.getClass().getSimpleName() + ":=======>empregadoId = " + empregadoId);
				// Seta empregadoId & senha criptografada antes de salvar na tabela
				empregado.setEmpregadoId(empregadoId);
				empregado.setSenha(bCryptPasswordEncoder.encode(empregado.getSenha()));
				// Define tempo (TimeStamp) atual
				Timestamp currentTimeStamp = new Timestamp(System.currentTimeMillis());
				System.out.println(this.getClass().getSimpleName() + ":=======>currentTimeStamp = " + currentTimeStamp);
				empregado.setDataCriacao(currentTimeStamp);
				// Agora salva o empregado
				empregadoService.salvarOuAtualizarEmpregado(empregado);
				System.out.println(empregadoId + "=>Este empregado foi salvo. Agora redirecionado...");
				// Define a sessão antes de redirecionar
				session.setAttribute("ename", firstName + " " + lastName);
				return new ModelAndView("redirect:/empregado/consulta_empregados"); //Redireciona para página de lista empregados
			}
		} else {
			System.out.println("testData......." + request.getParameter("testData"));
			System.out.println("In else.......");
			System.out.println(this.getClass().getSimpleName() + ":=======>Chegada de pedido de atualizar empregado.");
			// Verifica se algum campo está vazio ou nulo
			if (br.hasErrors()) {
				System.out.println(this.getClass().getSimpleName() + ":=======>BindingResult encontrou um erro.");
				return new ModelAndView("cadastro_empregado");
			} else {
				String firstName = empregado.getPrimeiroNome(); // Retorna o Primeiro Nome
				String lastName = empregado.getUltimoNome(); // Retorna o Último Nome
				//  Pega o primeiro caractere (1st) do primeiroNome & ultimoNome and concatena eles
				String nameChar = firstName.substring(0, 1) + lastName.substring(0, 1);
				// Chama a função random para gerar número aleatório do Idempregado
				String empregadoId = nameChar.toUpperCase() + utils.generateRandomNumber();
				System.out.println(this.getClass().getSimpleName() + ":=======>empregadoId = " + empregadoId);
				//  Seta empregadoId & senha criptografada antes de salvar na tabela
				empregado.setEmpregadoId(empregadoId);
				empregado.setSenha(bCryptPasswordEncoder.encode(empregado.getSenha()));
				// Agora atualiza o empregado
				empregadoService.salvarOuAtualizarEmpregado(empregado);
				System.out.println(empregadoId + "=>Este empregado foi atualizado. Agora redirecionado...");
				return new ModelAndView("redirect:/empregado/consulta_empregados");
			}
		}
	}

	// Validar funcionário por meio do processo de login
	@PostMapping("/validarEmpregado")
	public ModelAndView validarEmpregado(@Valid @ModelAttribute("empregado-acesso") Empregado empregado,
			BindingResult br, HttpSession session) {
		System.out.println(this.getClass().getSimpleName() + ":Validando empregado para: " + empregado.getEmail());
		Empregado employeeExist = empregadoService.getEmpregadoByEmail(empregado.getEmail());
		// Verifica se empregado existe
		if (employeeExist == null) {
			System.out.println(this.getClass().getSimpleName() + ":Este email não existe!");
			br.rejectValue("email", "error.employee", "Este email não existe!");
		} else {
			String employeeEncodedPassword = empregadoService.getEmpregadoSenha(empregado.getEmail());
			System.out.println(this.getClass().getSimpleName() + ":empregadoBCryptPassword======================="
					+ employeeEncodedPassword);
			boolean checkPassStatus = bCryptPasswordEncoder.matches(empregado.getSenha(), employeeEncodedPassword);
			// Verifica se a senha corresponde
			if (checkPassStatus) {
				System.out.println(
						this.getClass().getSimpleName() + ":checaPassStatus=======================" + checkPassStatus);
				empregado = empregadoService.checarLogin(empregado.getEmail(), employeeEncodedPassword);
				if (empregado != null) {
					session.setAttribute("ename",
							employeeExist.getPrimeiroNome() + " " + employeeExist.getUltimoNome());
					System.out.println(this.getClass().getSimpleName() + ":feito encaminhamento de login...");
					return new ModelAndView("boas_vindas");
				} else {
					System.out.println(this.getClass().getSimpleName() + ":Senha incorreta.");
					br.rejectValue("password", "error.empregado", "Senha incorreta.");
				}
			} else {
				System.out.println(this.getClass().getSimpleName() + ":Senha não coincide.");
				br.rejectValue("password", "error.empregado", "Senha não coincide.");
			}
		}
		return new ModelAndView("acesso");
	}

	// Atualiza empregado pelo id
	@GetMapping("/atualizarEmpregado/{id}")
	public ModelAndView alterarEmpregado(@PathVariable("id") long id, Model model) {
		System.out.println(this.getClass().getSimpleName() + ":Atualizando de empregado..." + id);
		Empregado employee = empregadoService.getEmpregadoById(id);
		ModelAndView mav = new ModelAndView("cadastro_empregado");
		mav.addObject("empregado-cadastro_empregado", employee);
		model.addAttribute("testData", "testData");
		model.addAttribute("passwords", employee.getSenha());
		return mav;
	}

	// Deleta empregado pelo id
	@GetMapping("/deletarEmpregado/{id}")
	public ModelAndView removerEmpregado(@PathVariable("id") long id) {
		System.out.println(this.getClass().getSimpleName() + ":Deletando empregado... " + id);
		empregadoService.deletarEmpregado(id);
		return new ModelAndView("redirect:/empregado/consulta_empregados");
	}

	@PostMapping("/procura-empregadoId")
	public ModelAndView pesquisarEmpregadosById(@RequestParam("empregadoId") String empregadoId) {
		System.out.println(this.getClass().getSimpleName() + ":Procurando empregado... " + empregadoId);
		ModelAndView mav = new ModelAndView("consulta_empregados");
		// Pesquisa empregado no repositório
		List<Empregado> empregadoList = empregadoService.getEmpregadoByEmpregadoId(empregadoId);
		// Adiciona empregado na lista/model
		mav.addObject("empregadoList", empregadoList);
		return mav;
	}

	// Pesquisar empregado por meio de palavras-chave
	@PostMapping("/pesquisa-palavrachave")
	public ModelAndView procurarEmpregadoGeral(@RequestParam("keyword") String keyword) {
		System.out.println(this.getClass().getSimpleName() + ":Pesquisando empregado por meio de palavras-chave... " + keyword);
		List<Empregado> resultado = empregadoService.pesquisar(keyword);
		ModelAndView mav = new ModelAndView("resultado_pesquisa");
		mav.addObject("resultado", resultado);
		return mav;
	}

	// Deleta todos empregados
	@GetMapping("/deletarTodos")
	public ModelAndView removerTodosEmpregados() {
		System.out.println(this.getClass().getSimpleName() + ":deletando todos empregados... ");
		empregadoService.deletarTodosEmpregados();
		return new ModelAndView("redirect:/empregado/consulta_empregados");
	}

}
