package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;
import java.util.List;

import br.com.fateczl.ProjetoEscola.model.AlunoDisciplina;

public interface IAlunoDisciplinaDao {

	public void insereFalta(AlunoDisciplina f) throws SQLException, ClassNotFoundException;
	public List<AlunoDisciplina>	listaFaltas(AlunoDisciplina f)  throws SQLException, ClassNotFoundException;
}
