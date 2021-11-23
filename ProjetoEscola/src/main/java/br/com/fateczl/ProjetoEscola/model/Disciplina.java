package br.com.fateczl.ProjetoEscola.model;

public class Disciplina {
	
	private int codigo;
	private String nome_d;
	private String sigla;
	private char turno;
	private int num_aulas;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome_d() {
		return nome_d;
	}
	public void setNome_d(String nome) {
		this.nome_d = nome;
	}
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public char getTurno() {
		return turno;
	}
	public void setTurno(char turno) {
		this.turno = turno;
	}
	public int getNum_aulas() {
		return num_aulas;
	}
	public void setNum_aulas(int num_aulas) {
		this.num_aulas = num_aulas;
	}
	
	@Override
	public String toString() {
		return "Disciplina [codigo=" + codigo + ", nome=" + nome_d + ", sigla=" + sigla + ", turno" + turno + ", num_aulas=" + num_aulas
				+ "]";
	}
	
}
