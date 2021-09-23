package model;

public class Filme {
	
	private int idfilme;
	private String nomeBR;
	private String nomeEN;
	private int anoLancamento;
	private String sinopse;
	
	@Override
	public String toString() {
		return "Filme [idfilme=" + idfilme + ", nomeBr=" + nomeBR + ", nomeEn=" + nomeEN + ", anoLancamento="
				+ anoLancamento + ", sinopse=" + sinopse + "]";
	}
	public int getIdfilme() {
		return idfilme;
	}
	public void setIdfilme(int idfilme) {
		this.idfilme = idfilme;
	}
	public String getNomeBR() {
		return nomeBR;
	}
	public void setNomeBR(String nomeBR) {
		this.nomeBR = nomeBR;
	}
	public String getNomeEN() {
		return nomeEN;
	}
	public void setNomeEN(String nomeEN) {
		this.nomeEN = nomeEN;
	}
	public int getAnoLancamento() {
		return anoLancamento;
	}
	public void setAnoLancamento(int anoLancamento) {
		this.anoLancamento = anoLancamento;
	}
	public String getSinopse() {
		return sinopse;
	}
	public void setSinopse(String sinopse) {
		this.sinopse = sinopse;
	}

}
