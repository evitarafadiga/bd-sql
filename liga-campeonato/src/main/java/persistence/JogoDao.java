package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import model.Jogo;

public class JogoDao implements IJogoDao {
	
	private Connection c;
	
	public JogoDao() throws ClassNotFoundException, SQLException {
		GenericDao jDao = new GenericDao();
		c = jDao.getConnection();
	}

	@Override
	public String insertJogo(Jogo jogo) throws SQLException {
		String saida = insUpdDel(jogo,"I");
		return saida;
	}

	@Override
	public String updateJogo(Jogo jogo) throws SQLException {
		String saida = insUpdDel(jogo,"U");
		return saida;
	}

	@Override
	public String deleteJogo(Jogo jogo) throws SQLException {
		String saida = insUpdDel(jogo,"D");
		return saida;
	}

	@Override
	public Jogo selectJogo(Jogo jogo) throws SQLException {
		String sql = "SELECT idjogo, codigo_timea, codigo_timeb, gols_timea, gols_timeb, datahora FROM jogos WHERE idjogo = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, jogo.getIdjogo());
		
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {			
			jogo.setCodigotimea(rs.getInt("codigo_timea"));
			jogo.setCodigotimeb(rs.getInt("codigo_timeb"));
			jogo.setGolstimea(rs.getInt("gols_timea"));
			jogo.setGolstimeb(rs.getInt("gols_timeb"));
			jogo.setDatahora(rs.getString("datahora"));
		} else {
			jogo = new Jogo();
		}
		rs.close();
		ps.close();
		
		return jogo;
	}

	@Override
	public List<Jogo> selectJogos() throws SQLException {
		List<Jogo> listaJogos = new ArrayList<Jogo>();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT idjogo, codigo_timea, codigo_timeb, gols_timea, gols_timeb, datahora ");
		sql.append("FROM jogos");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Jogo jogo = new Jogo();
			jogo.setIdjogo(rs.getInt("idjogo"));
			jogo.setCodigotimea(rs.getInt("codigo_timea"));
			jogo.setCodigotimeb(rs.getInt("codigo_timeb"));
			jogo.setGolstimea(rs.getInt("gols_timea"));
			jogo.setGolstimeb(rs.getInt("gols_timeb"));
			jogo.setDatahora(rs.getString("datahora"));
			
			listaJogos.add(jogo);
		}
		rs.close();
		ps.close();
		
		return listaJogos;
	}
	
	private String insUpdDel(Jogo jogo, String cod) throws SQLException {
		String sql = "{CALL sp_iud_jogo (?,?,?,?,?,?,?,?)}";
		CallableStatement cs = c.prepareCall(sql);
		cs.setString(1, cod);
		cs.setInt(2, jogo.getIdjogo());
		cs.setInt(3, jogo.getCodigotimea());
		cs.setInt(4, jogo.getCodigotimeb());
		cs.setInt(5, jogo.getGolstimea());
		cs.setInt(6, jogo.getGolstimeb());
		cs.setString(7, jogo.getDatahora());
		cs.registerOutParameter(8, Types.VARCHAR);
		
		cs.execute();
		String saida = cs.getString(8);
		cs.close();
		
		return saida;
	}
	
	public String geraPartidas() throws SQLException {
		String sql = "{CALL sp_gera_partidas ? }";
		CallableStatement cs = c.prepareCall(sql);
		
		cs.registerOutParameter(1, Types.VARCHAR);
		
		cs.execute();
		String saida = cs.getString(1);
		cs.close();
		
		return saida;
	}
	
	public List<Jogo> selectPartidaPorData(String datahora) throws SQLException {
		List<Jogo> listaJogos = new ArrayList<Jogo>();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT idjogo, codigo_timea, codigo_timeb, gols_timea,");
		sql.append(" gols_timeb, datahora FROM jogos WHERE datahora = ? ");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ps.setString(1, datahora);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Jogo jogo = new Jogo();
			jogo.setIdjogo(rs.getInt("idjogo"));
			jogo.setCodigotimea(rs.getInt("codigo_timea"));
			jogo.setCodigotimeb(rs.getInt("codigo_timeb"));
			jogo.setGolstimea(rs.getInt("gols_timea"));
			jogo.setGolstimeb(rs.getInt("gols_timeb"));
			jogo.setDatahora(rs.getString("datahora"));
			
			listaJogos.add(jogo);
		}
		rs.close();
		ps.close();
		
		return listaJogos;
	}


}
