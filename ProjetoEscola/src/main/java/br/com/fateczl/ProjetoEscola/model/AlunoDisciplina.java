package br.com.fateczl.ProjetoEscola.model;

public class AlunoDisciplina {
	
	private Aluno aluno;
	private Disciplina disciplina;
	private String dataf;
	private char presenca;
	
	public Aluno getAluno() {
		return aluno;
	}
	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
	public Disciplina getDisciplina() {
		return disciplina;
	}
	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
	}
	public String getDataf() {
		return dataf;
	}
	public void setDataf(String dataf) {
		this.dataf = dataf;
	}
	public char getPresenca() {
		return presenca;
	}
	public void setPresenca(char presenca) {
		this.presenca = presenca;
	}
	
	@Override
	public String toString() {
		return "Faltas [aluno=" + aluno + ", disciplina=" + disciplina + ", dataf=" + dataf + ", presenca=" + presenca
				+ "]";
	}
	
}
