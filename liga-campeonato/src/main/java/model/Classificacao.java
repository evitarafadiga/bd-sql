package model;

public class Classificacao {
	private String nome_time;
	private int num_jogos;
	private int vitorias;
	private int empates;
	private int derrotas;
	private int gols_marcados;
	private int gols_sofridos;
	private int saldo_gols;
	private int pontos;

	public String getNome_time() {
		return nome_time;
	}

	public void setNome_time(String nome_time) {
		this.nome_time = nome_time;
	}

	public int getNum_jogos() {
		return num_jogos;
	}

	public void setNum_jogos(int num_jogos) {
		this.num_jogos = num_jogos;
	}

	public int getVitorias() {
		return vitorias;
	}

	public void setVitorias(int vitorias) {
		this.vitorias = vitorias;
	}

	public int getEmpates() {
		return empates;
	}

	public void setEmpates(int empates) {
		this.empates = empates;
	}

	public int getDerrotas() {
		return derrotas;
	}

	public void setDerrotas(int derrotas) {
		this.derrotas = derrotas;
	}

	public int getGols_marcados() {
		return gols_marcados;
	}

	public void setGols_marcados(int gols_marcados) {
		this.gols_marcados = gols_marcados;
	}

	public int getGols_sofridos() {
		return gols_sofridos;
	}

	public void setGols_sofridos(int gols_sofridos) {
		this.gols_sofridos = gols_sofridos;
	}

	public int getSaldo_gols() {
		return saldo_gols;
	}

	public void setSaldo_gols(int saldo_gols) {
		this.saldo_gols = saldo_gols;
	}

	public int getPontos() {
		return pontos;
	}

	public void setPontos(int pontos) {
		this.pontos = pontos;
	}

	@Override
	public String toString() {
		return "Classificacao [nome=" + nome_time + ", num_jogos=" + num_jogos + ", vitorias=" + vitorias + ", empates="
				+ empates + ", derrotas=" + derrotas + ", gols_marcados=" + gols_marcados + ", gols_sofridos="
				+ gols_sofridos + ", saldo_gols=" + saldo_gols + ", pontos=" + pontos + "]";
	}
}
