package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.SQLException;
import java.util.List;

import br.com.fateczl.ProjetoEscola.model.Faltas;

public interface IFaltaDao {

	public void insereFalta(Faltas f) throws SQLException, ClassNotFoundException;
	public List<Faltas>	listaFaltas(Faltas f)  throws SQLException, ClassNotFoundException;
}
