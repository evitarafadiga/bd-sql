package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.fateczl.ProjetoEscola.model.Disciplina;
@Component
public class DisciplinaDao implements IDisciplinaDao {
	
	@Autowired
	GenericDao gDao;
	
	@Override
	public Disciplina consultaDisciplina(Disciplina d) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "SELECT codigo, nome_d, sigla, turno, num_aulas FROM disciplinas WHERE codigo = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, d.getCodigo());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			d.setNome_d(rs.getString("nome_d"));
			d.setSigla(rs.getString("sigla"));
			d.setTurno(rs.getString("turno").charAt(0));
			d.setNum_aulas(rs.getInt("num_aulas"));
		}
		rs.close();
		ps.close();
		c.close();
		
		return d;
	}
	
	@Override
	public List<Disciplina> listaDisciplinas() throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		List<Disciplina> lista = new ArrayList<Disciplina>();
		String sql = "SELECT codigo, nome, sigla, turno, num_aulas FROM disciplinas ";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Disciplina d = new Disciplina();
			d.setCodigo(rs.getInt("codigo"));
			d.setNome_d(rs.getString("nome"));
			d.setSigla(rs.getString("sigla"));
			d.setTurno(rs.getString("turno").charAt(0));
			d.setNum_aulas(rs.getInt("num_aulas"));
			
			lista.add(d);
		}
		rs.close();
		ps.close();
		c.close();
		
		return lista;
		
	}

}
