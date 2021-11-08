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
import br.com.fateczl.ProjetoEscola.model.Avaliacao;
import br.com.fateczl.ProjetoEscola.model.Disciplina;
import br.com.fateczl.ProjetoEscola.model.Notas;
@Component
public class NotasDao implements INotasDao{
	
	@Autowired
	GenericDao gDao;

	@Override
	public void insereNota(Notas n) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "INSERT INTO notas VALUES (?,?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, n.getAluno().getRa());
		ps.setInt(2, n.getDisciplina().getCodigo());
		ps.setInt(3, n.getAvaliacao().getCodigo());
		ps.setDouble(4, n.getNota());
		ps.execute();
		ps.close();
		c.close();
		
	}

	@Override
	public List<Notas> listaNotas(Notas n) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		List<Notas> lista = new ArrayList<Notas>();
		String sql = "SELECT a.ra, d.codigo AS disciplina_cod, av.codigo AS avaliacao_cod, n.nota FROM aluno a, disciplinas d, avaliacao av, notas n WHERE a.ra = n.ra_aluno AND d.codigo = n.codigo_disciplina AND	av.codigo = n.codigo_avaliacao ";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, n.getAluno().getRa());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Aluno a = new Aluno();
			a.setRa(rs.getString("ra"));
			a.setNome(rs.getString("nome"));
			
			Disciplina d = new Disciplina();
			d.setCodigo(rs.getInt("codigo"));
			d.setNome(rs.getString("nome"));
			d.setSigla(rs.getString("sigla").charAt(0));
			d.setNum_aulas(rs.getInt("num_aulas"));
			
			Avaliacao av = new Avaliacao();
			av.setCodigo(rs.getInt("codigo"));
			av.setTipo(rs.getString("tipo"));
			
			Notas nt = new Notas();
			nt.setAluno(a);
			nt.setDisciplina(d);
			nt.setAvaliacao(av);
			nt.setNota(rs.getDouble("nota"));
			
			lista.add(nt);
		}
		
		rs.close();
		ps.close();
		c.close();
		
		return lista;
	}

}
