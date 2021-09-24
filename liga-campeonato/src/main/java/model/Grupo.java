package model;

public class Grupo {
	
	private int id;
	private String letra;
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
