package com.javahub.springboot.entity;
import java.sql.Timestamp;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name = "empregado")
public class Empregado {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;

	@Column(name = "empregado_id", nullable = false, unique = true)
	private String empregadoId;

	@NotNull(message = "O nome do empregado não pode ficar em branco.")
	@Size(min = 2, max = 50)
	@Column(name = "primeiro_nome", nullable = false)
	private String primeiroNome;

	@NotNull(message = "O sobrenome do empregado não pode ficar em branco.")
	@Size(min = 2, max = 50)
	@Column(name = "ultimo_nome", nullable = false)
	private String ultimoNome;

	@NotNull(message = "O e-mail do empregado não pode ficar em branco.")
	@Size(min = 10, max = 100)
	@Email(message = "Digite um e-mail válido.")
	@Column(name = "email", nullable = false, unique = true)
	private String email;

	@NotNull(message = "A senha do empregado não pode ficar em branco.")
	@Size(max = 60)
	@Column(name = "senha", nullable = false)
	private String senha;

	@NotNull(message = "O sexo do empregado não pode ficar em branco.")
	@Column(name = "genero", nullable = false)
	private String genero;

	@NotNull(message = "A Data de nascimento do empregado não pode ficar em branco.")
	@Past(message = "Por favor, selecione a data anterior.")
    @DateTimeFormat(pattern="yyyy-MM-dd")
	@Column(name = "data_nascimento", nullable = false)
	private LocalDate dataNascimento;
	

	@NotNull(message = "Departamento de empregado não pode ficar em branco.")
	@Size(min = 2, max = 50)
	@Column(name = "departamento", nullable = false)
	private String departamento;

	@NotNull(message = "Designacao de empregado não pode ficar em branco.")
	@Size(min = 2, max = 50)
	@Column(name = "designacao", nullable = false)
	private String designacao;

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	@Column(name = "data_criacao", nullable = false, updatable = false)
	private Timestamp dataCriacao;

	public Empregado() {

	}

	public Empregado(String empregadoId, String primeiroNome, String ultimoNome, String email, String senha, String genero,
			LocalDate dataNascimento, String departamento, String designacao, Timestamp dataCriacao) {
		this.empregadoId = empregadoId;
		this.primeiroNome = primeiroNome;
		this.ultimoNome = ultimoNome;
		this.email = email;
		this.senha = senha;
		this.genero = genero;
		this.dataNascimento = dataNascimento;
		this.departamento = departamento;
		this.designacao = designacao;
		this.dataCriacao = dataCriacao;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getEmpregadoId() {
		return empregadoId;
	}

	public void setEmpregadoId(String empregadoId) {
		this.empregadoId = empregadoId;
	}

	public String getPrimeiroNome() {
		return primeiroNome;
	}

	public void setPrimeiroNome(String primeiroNome) {
		this.primeiroNome = primeiroNome;
	}

	public String getUltimoNome() {
		return ultimoNome;
	}

	public void setUltimoNome(String ultimoNome) {
		this.ultimoNome = ultimoNome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public LocalDate getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(LocalDate dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getDepartamento() {
		return departamento;
	}

	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}

	public String getDesignacao() {
		return designacao;
	}

	public void setDesignacao(String designacao) {
		this.designacao = designacao;
	}

	public Timestamp getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Timestamp dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	@Override
	public String toString() {
		return "Empregado [id=" + id + ", empregadoId=" + empregadoId + ", primeiroNome=" + primeiroNome + ", ultimoNome=" + ultimoNome
				+ ", email=" + email + ", senha=" + senha + ", genero=" + genero + ", dataNascimento=" + dataNascimento
				+ ", departamento=" + departamento + ", designacao=" + designacao + ", dataCriacao=" + dataCriacao + "]";
	}

}
