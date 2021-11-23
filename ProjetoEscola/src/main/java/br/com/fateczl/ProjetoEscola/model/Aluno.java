package br.com.fateczl.ProjetoEscola.model;

public class Aluno {
	
	private String ra;
	private String nome_a;
	
	public String getRa() {
		return ra;
	}
	public void setRa(String ra) {
		this.ra = ra;
	}
	public String getNome_a() {
		return nome_a;
	}
	public void setNome_a(String nome) {
		this.nome_a = nome;
	}
	@Override
	public String toString() {
		return "Aluno [ra=" + ra + ", nome=" + nome_a + "]";
	}
	
}
