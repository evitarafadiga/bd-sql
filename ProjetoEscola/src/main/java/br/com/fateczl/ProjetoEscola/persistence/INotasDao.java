package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;
import java.util.List;

import br.com.fateczl.ProjetoEscola.model.Notas;

public interface INotasDao {
		
	public void insereNota(Notas n)  throws SQLException, ClassNotFoundException;
	public List<Notas> listaNotas(Notas n)  throws SQLException, ClassNotFoundException;
}
