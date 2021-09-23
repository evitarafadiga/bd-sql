package model;

import java.util.Date;

public class Jogo {

	private Date datahora;
	private int codigotimea;
	private int codigotimeb;
	private int golstimea;
	private int golstimeb;
	
	@Override
	public String toString() {
		return "Jogo [datahora=" + datahora + ", codigotimea=" + codigotimea + ", codigotimeb=" + codigotimeb
				+ ", golstimea=" + golstimea + ", golstimeb=" + golstimeb + "]";
	}
	public Date getDatahora() {
		return datahora;
	}
	public void setDatahora(Date datahora) {
		this.datahora = datahora;
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
	
}
