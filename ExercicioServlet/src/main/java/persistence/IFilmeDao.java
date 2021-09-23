package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Filme;

public interface IFilmeDao {
	
	public String insertFilme (Filme film) throws SQLException;
	public String updateFilme (Filme film) throws SQLException;
	public String deleteFilme (Filme film) throws SQLException;
    public Filme selectFilme (Filme film) throws SQLException;
    public List<Filme> selectFilmes() throws SQLException;
}
