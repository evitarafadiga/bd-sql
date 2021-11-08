package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;
import java.util.List;

import br.com.fateczl.ProjetoEscola.model.Aluno;

public interface IAlunoDao {
	public Aluno consultaAluno(Aluno a) throws SQLException, ClassNotFoundException;
	public List<Aluno> listaAlunos() throws SQLException, ClassNotFoundException;
}
