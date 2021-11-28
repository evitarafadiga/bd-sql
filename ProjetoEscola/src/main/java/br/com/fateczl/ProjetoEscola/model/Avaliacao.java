package br.com.fateczl.ProjetoEscola.model;

public class Avaliacao {
	
	private int codigo_a;
	private String tipo;
	
	public int getCodigo_a() {
		return codigo_a;
	}
	public void setCodigo_a(int codigo_a) {
		this.codigo_a = codigo_a;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	@Override
	public String toString() {
		return "Avaliacao [codigo=" + codigo_a + ", tipo=" + tipo + "]";
	}
	
}
