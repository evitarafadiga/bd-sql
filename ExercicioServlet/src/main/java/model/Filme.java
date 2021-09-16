package model;

public class Filme {
	
	private int idFilme;
	private String nomeBr;
	private String nomeEn;
	private int anoLancamento;
	private String sinopse;
	
	@Override
	public String toString() {
		return "Filme [idFilme=" + idFilme + ", nomeBr=" + nomeBr + ", nomeEn=" + nomeEn + ", anoLancamento="
				+ anoLancamento + ", sinopse=" + sinopse + "]";
	}
	public int getIdFilme() {
		return idFilme;
	}
	public void setIdFilme(int idFilme) {
		this.idFilme = idFilme;
	}
	public String getNomeBr() {
		return nomeBr;
	}
	public void setNomeBr(String nomeBr) {
		this.nomeBr = nomeBr;
	}
	public String getNomeEn() {
		return nomeEn;
	}
	public void setNomeEn(String nomeEn) {
		this.nomeEn = nomeEn;
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
