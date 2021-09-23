package model;

public class Time {
	
	private int codigotime;
	private String nometime;
	private String cidade;
	private String estadio;
	
	@Override
	public String toString() {
		return "Time [codigotime=" + codigotime + ", nometime=" + nometime + ", cidade=" + cidade + ", estadio="
				+ estadio + "]";
	}
	public int getCodigotime() {
		return codigotime;
	}
	public void setCodigotime(int codigotime) {
		this.codigotime = codigotime;
	}
	public String getNometime() {
		return nometime;
	}
	public void setNometime(String nometime) {
		this.nometime = nometime;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getEstadio() {
		return estadio;
	}
	public void setEstadio(String estadio) {
		this.estadio = estadio;
	}

}
