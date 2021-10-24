package model;

public class Grupo {
	
	private String letra;
	private int codigotimegrupo;
	
	@Override
	public String toString() {
		return "Grupos [letra=" + letra + ", codigotimegrupo=" + codigotimegrupo + "]";
	}
	
	public String getLetra() {
		return letra;
	}
	public void setLetra(String string) {
		this.letra = string;
	}
	public int getCodigotimegrupo() {
		return codigotimegrupo;
	}
	public void setCodigotimegrupo(int codigotimegrupo) {
		this.codigotimegrupo = codigotimegrupo;
	}
	

}
