package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;

import br.com.fateczl.ProjetoEscola.model.Disciplina;

public interface IDisciplinaDao {
	
	public void insereDisciplina(Disciplina d)  throws SQLException, ClassNotFoundException;
}