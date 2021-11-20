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
import br.com.fateczl.ProjetoEscola.model.AlunoDisciplina;
import br.com.fateczl.ProjetoEscola.model.Disciplina;
@Component
public class AlunoDisciplinaDao implements IAlunoDisciplinaDao{

	@Autowired
	GenericDao gDao;
	
	@Override
	public void insereFalta(AlunoDisciplina ad) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		String sql = "INSERT INTO faltas VALUES (?,?,?,?) ";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setString(1, ad.getAluno().getRa());
		ps.setInt(2, ad.getDisciplina().getCodigo());
		ps.setString(3, ad.getDataf());
		ps.setString(4, String.valueOf(ad.getPresenca()));
		ps.execute();
		ps.close();
		c.close();	
		
	}

	@Override
	public List<AlunoDisciplina> listaFaltas(AlunoDisciplina ad) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		List<AlunoDisciplina> lista = new ArrayList<AlunoDisciplina>();
		String sql = "SELECT d.codigo, d.nome, d.sigla, d.num_aulas, a.ra, a.nome, CONVERT(CHAR(10), f.dataf, 103) AS dataf, f.presenca FROM disciplinas d, aluno a, faltas f WHERE a.ra = f.ra_aluno AND d.codigo = f.codigo_disciplina AND f.codigo_disciplina = ? ";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, ad.getDisciplina().getCodigo());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Disciplina d = new Disciplina();
			d.setCodigo(rs.getInt("codigo"));
			d.setNome(rs.getString("nome"));
			d.setSigla(rs.getString(String.valueOf("sigla")).charAt(0));
			d.setNum_aulas(rs.getInt("num_aulas"));
			
			Aluno a = new Aluno();
			a.setRa(rs.getString("ra"));
			a.setNome(rs.getString("nome"));
			
			AlunoDisciplina ad2 = new AlunoDisciplina();
			ad2.setDisciplina(d);
			ad2.setAluno(a);
			ad2.setDataf(rs.getString("dataf"));
			ad2.setPresenca(rs.getString("presenca").charAt(0));
			
			lista.add(ad2);
		}
		rs.close();
		ps.close();
		c.close();
		
		return lista;		
	}

}