package br.com.fateczl.ProjetoEscola.model;

public class Disciplina {
	
	private int codigo;
	private String nome;
	private char sigla;
	private int num_aulas;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public char getSigla() {
		return sigla;
	}
	public void setSigla(char sigla) {
		this.sigla = sigla;
	}
	public int getNum_aulas() {
		return num_aulas;
	}
	public void setNum_aulas(int num_aulas) {
		this.num_aulas = num_aulas;
	}
	
	@Override
	public String toString() {
		return "Disciplina [codigo=" + codigo + ", nome=" + nome + ", sigla=" + sigla + ", num_aulas=" + num_aulas
				+ "]";
	}
	
}
