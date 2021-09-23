package model;

public class Grupos {
	
	private int id;
	private char letra;
	private int codigotimegrupo;
	
	@Override
	public String toString() {
		return "Grupos [id=" + id + ", letra=" + letra + ", codigotimegrupo=" + codigotimegrupo + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public char getLetra() {
		return letra;
	}
	public void setLetra(char letra) {
		this.letra = letra;
	}
	public int getCodigotimegrupo() {
		return codigotimegrupo;
	}
	public void setCodigotimegrupo(int codigotimegrupo) {
		this.codigotimegrupo = codigotimegrupo;
	}
	

}
