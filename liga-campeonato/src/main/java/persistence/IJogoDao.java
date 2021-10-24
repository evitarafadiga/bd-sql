package persistence;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import model.Jogo;

public interface IJogoDao {
	
	public String insertJogo (Jogo jogo) throws SQLException;
	public String updateJogo (Jogo jogo) throws SQLException;
	public String deleteJogo (Jogo jogo) throws SQLException;
    public Jogo selectJogo (Jogo jogo) throws SQLException;
    public List<Jogo> selectJogos() throws SQLException;
	public String divideGrupos() throws SQLException;
	public List<Jogo> selectPartidaPorData(String datahora) throws SQLException;
	
}