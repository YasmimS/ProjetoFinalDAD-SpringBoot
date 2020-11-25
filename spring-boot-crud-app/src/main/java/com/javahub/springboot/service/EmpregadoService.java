package com.javahub.springboot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javahub.springboot.entity.Empregado;

@Service("EmpregadoService")
public interface EmpregadoService {

	public List<Empregado> getTodosEmpregados();

	public Empregado getEmpregadoById(long id);
	
	public List<Empregado> getEmpregadoByEmpregadoId(String empregadoId);

	public Empregado getEmpregadoByEmail(String email);

	public void salvarOuAtualizarEmpregado(Empregado empregado);

	public void deletarEmpregado(long id);

	public Empregado checarLogin(String email, String senha);
	
	public List<Empregado> pesquisar(String palavraChave);
	
	public String getEmpregadoSenha(String email);
	
	public void deletarTodosEmpregados();

}
