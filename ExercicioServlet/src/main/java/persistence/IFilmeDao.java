package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Jogo;

public interface IFilmeDao {
	
	public String insertFilme (Jogo film) throws SQLException;
	public String updateFilme (Jogo film) throws SQLException;
	public String deleteFilme (Jogo film) throws SQLException;
    public Jogo selectFilme (Jogo film) throws SQLException;
    public List<Jogo> selectFilmes() throws SQLException;
}
