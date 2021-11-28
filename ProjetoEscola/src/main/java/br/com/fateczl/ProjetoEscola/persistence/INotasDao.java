package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;
import java.util.List;

import br.com.fateczl.ProjetoEscola.model.Notas;

public interface INotasDao {
		
	public void insereNota(Notas n)  throws SQLException, ClassNotFoundException;
	List<Notas> listaNotas() throws SQLException, ClassNotFoundException;
	List<Notas> listaNotasPorAvaliacao(Notas n) throws SQLException, ClassNotFoundException;
	List<Notas> listaNotasPorDisciplina(Notas n) throws SQLException, ClassNotFoundException;
}
