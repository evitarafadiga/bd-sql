package model;

public class Jogo {

	private int idjogo;
	private int codigotimea;
	private int codigotimeb;
	private int golstimea;
	private int golstimeb;
	private String datahora;
	
	@Override
	public String toString() {
		return "Jogo [idjogo=" + idjogo + ", codigotimea=" + codigotimea + ", codigotimeb=" + codigotimeb
				+ ", golstimea=" + golstimea + ", golstimeb=" + golstimeb + ", data " + datahora +"]";
	}
	public int getIdjogo() {
		return idjogo;
	}
	public void setIdjogo(int idjogo) {
		this.idjogo = idjogo;
	}
	public int getCodigotimea() {
		return codigotimea;
	}
	public void setCodigotimea(int codigotimea) {
		this.codigotimea = codigotimea;
	}
	public int getCodigotimeb() {
		return codigotimeb;
	}
	public void setCodigotimeb(int codigotimeb) {
		this.codigotimeb = codigotimeb;
	}
	public int getGolstimea() {
		return golstimea;
	}
	public void setGolstimea(int golstimea) {
		this.golstimea = golstimea;
	}
	public int getGolstimeb() {
		return golstimeb;
	}
	public void setGolstimeb(int golstimeb) {
		this.golstimeb = golstimeb;
	}
	
	public String getDatahora() {
		return datahora;
	}
	public void setDatahora(String data) {
		this.datahora = data;
	}
}
