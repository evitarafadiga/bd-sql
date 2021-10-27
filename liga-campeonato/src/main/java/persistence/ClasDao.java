package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Classificacao;

public class ClasDao implements IClasDao {
	
	private Connection c;
	
	public ClasDao() throws ClassNotFoundException, SQLException {
		GenericDao cDao = new GenericDao();
		c = cDao.getConnection();
	}
	
	@Override
	public List<Classificacao> clasGeral() throws SQLException {
		List<Classificacao> listaClassificacao = new ArrayList<Classificacao>();
		String sql = "SELECT * FROM dbo.fn_statistics_by_group('A') \r\n"
				+ "UNION ALL \r\n"
				+ "SELECT * FROM dbo.fn_statistics_by_group('B') \r\n"
				+ "UNION ALL \r\n"
				+ "SELECT * FROM dbo.fn_statistics_by_group('C') \r\n"
				+ "UNION ALL \r\n"
				+ "SELECT * FROM dbo.fn_statistics_by_group('D') \r\n"
				+ "ORDER BY pontos DESC, vitorias DESC, gols_marcados DESC, saldo_gols DESC";
		
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Classificacao clas = new Classificacao();
			clas.setNome_time(rs.getString("nome_time"));
			clas.setNum_jogos(rs.getInt("num_jogos"));
			clas.setVitorias(rs.getInt("vitorias"));
			clas.setEmpates(rs.getInt("empates"));
			clas.setDerrotas(rs.getInt("derrotas"));
			clas.setGols_marcados(rs.getInt("gols_marcados"));
			clas.setGols_sofridos(rs.getInt("gols_sofridos"));
			clas.setSaldo_gols(rs.getInt("saldo_gols"));
			clas.setPontos(rs.getInt("pontos"));
			
			listaClassificacao.add(clas);
		}

		rs.close();
		ps.close();
		
		return listaClassificacao;
	}

}
