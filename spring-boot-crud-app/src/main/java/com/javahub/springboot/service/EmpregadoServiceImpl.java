package com.javahub.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javahub.springboot.entity.Empregado;
import com.javahub.springboot.repository.EmpregadoRepository;

@Service("EmpregadoService")
@Transactional
public class EmpregadoServiceImpl implements EmpregadoService {

	// Inject EmployeeRepository to call it's Pre-defined or Custom methods 
	@Autowired 
	EmpregadoRepository empregadoRepository;

	@Override
	public List<Empregado> getTodosEmpregados() {
		// Get All Employee
		return empregadoRepository.findAll();
	}

	@Override
	public Empregado getEmpregadoById(long id) {
		// Get Employee By id
		return empregadoRepository.findById(id).get();
	}

	@Override
	public Empregado getEmpregadoByEmail(String email) {
		// Get Employee By email
		return empregadoRepository.encontrarByEmail(email);
	}

	@Override
	public void salvarOuAtualizarEmpregado(Empregado empregado) {
		// Save or Update Employee
		empregadoRepository.save(empregado);
	}

	@Override
	public void deletarEmpregado(long id) {
		// Delete Employee By id
		empregadoRepository.deleteById(id);
	}

	@Override
	public List<Empregado> pesquisar(String palavraChave) {
		// Search Employee By keyword
		return empregadoRepository.pesquisar(palavraChave);
	}

	@Override
	public List<Empregado> getEmpregadoByEmpregadoId(String empregadoId) {
		// Get Employee By empId
		return empregadoRepository.encontrarEmpregadoByEmpregadoId(empregadoId);
	}

	@Override
	public Empregado checarLogin(String email, String senha) {
		// Validate Employee
		return empregadoRepository.validarEmpregado(email, senha);
	}

	@Override
	public String getEmpregadoSenha(String email) {
		// Get Employee password By email
		return empregadoRepository.encontrarEmpregadoSenha(email);
	}

	@Override
	public void deletarTodosEmpregados() {
		// Delete All Employee
		empregadoRepository.deleteAll();	
	}

}
