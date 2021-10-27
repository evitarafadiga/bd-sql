package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Classificacao;

public interface IClasDao {

	public List<Classificacao> clasGeral() throws SQLException;
}
