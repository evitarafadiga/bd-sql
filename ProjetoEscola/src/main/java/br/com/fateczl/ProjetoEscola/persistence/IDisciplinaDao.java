package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;
import java.util.List;

import br.com.fateczl.ProjetoEscola.model.Disciplina;

public interface IDisciplinaDao {
	
	public void insereDisciplina(Disciplina d)  throws SQLException, ClassNotFoundException;

	Disciplina consultaDisciplina(Disciplina d) throws SQLException, ClassNotFoundException;

	List<Disciplina> listaDisciplinas() throws SQLException, ClassNotFoundException;
}
