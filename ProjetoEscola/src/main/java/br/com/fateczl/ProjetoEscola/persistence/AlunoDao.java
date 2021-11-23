package br.com.fateczl.ProjetoEscola.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.fateczl.ProjetoEscola.model.Aluno;
@Component
public class AlunoDao implements IAlunoDao {
	
	@Autowired
	GenericDao gDao;

	@Override
	public Aluno consultaAluno(Aluno a) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "SELECT ra, nome_a FROM aluno WHERE ra = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, a.getRa());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			a.setRa(rs.getString("ra"));
			a.setNome_a(rs.getString("nome_a"));
		}
		rs.close();
		ps.close();
		c.close();
		
		return a;
	}

	@Override
	public List<Aluno> listaAlunos() throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		List<Aluno> lista = new ArrayList<Aluno>();
		String sql = "SELECT ra, nome_a FROM aluno";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Aluno a = new Aluno();
			a.setRa(rs.getString("ra"));
			a.setNome_a(rs.getString("nome_a"));
			
			lista.add(a);
		}
		rs.close();
		ps.close();
		c.close();
		
		return lista;
	}

}
