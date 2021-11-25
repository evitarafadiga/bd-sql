package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;
import java.util.List;

import br.com.fateczl.ProjetoEscola.model.Disciplina;

public interface IDisciplinaDao {
	
	Disciplina consultaDisciplina(Disciplina d) throws SQLException, ClassNotFoundException;

	List<Disciplina> listaDisciplinas() throws SQLException, ClassNotFoundException;
}
