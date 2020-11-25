package com.javahub.springboot.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.javahub.springboot.entity.Empregado;

@Repository
public interface EmpregadoRepository extends JpaRepository<Empregado, Long> {

	@Query(value = "SELECT * FROM Empregado WHERE primeiro_nome LIKE '%' || :keyword || '%'"
			+ " OR email LIKE '%' || :keyword || '%'" + " OR empregado_id LIKE '%' || :keyword || '%'"
			+ " OR ultimo_nome LIKE '%' || :keyword || '%'", nativeQuery = true)
	public List<Empregado> pesquisar(@Param("keyword") String keyword);

	@Query(value = "select * from Empregado where empregado_id like ?1", nativeQuery = true)
	public List<Empregado> encontrarEmpregadoByEmpregadoId(@Param("empregado_id") String empregadoId);

	@Query(value = "select email from Empregado where email like ?1", nativeQuery = true)
	public Empregado encontrarByEmail(String email);

	@Query(value = "select e from Empregado e where e.email like ?1 and e.senha like ?2", nativeQuery = true)
	public Empregado validarEmpregado(String email, String senha);

	@Query(value = "select e.senha from Empregado e where e.email like ?1", nativeQuery = true)
	public String encontrarEmpregadoSenha(String email);
}
