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

public class FilmeDao implements IFilmeDao {
	
	private Connection c;
	
	public FilmeDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
	}

	@Override
	public String insertFilme(Jogo film) throws SQLException {
		String saida = insUpdDel(film,"I");
		return saida;
	}

	@Override
	public String updateFilme(Jogo film) throws SQLException {
		String saida = insUpdDel(film,"U");
		return saida;
	}

	@Override
	public String deleteFilme(Jogo film) throws SQLException {
		String saida = insUpdDel(film,"D");
		return saida;
	}

	@Override
	public Jogo selectFilme(Jogo film) throws SQLException {
		String sql = "SELECT idfilme, nomeBR, nomeEN, anoLancamento, sinopse FROM filme WHERE idfilme = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, film.getIdfilme());
		
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			film.setNomeBR(rs.getString("nomeBR"));
			film.setNomeEN(rs.getString("nomeEN"));
			film.setAnoLancamento(rs.getInt("anoLancamento"));
			film.setSinopse(rs.getString("sinopse"));
		} else {
			film = new Jogo();
		}
		rs.close();
		ps.close();
		
		return film;
	}

	@Override
	public List<Jogo> selectFilmes() throws SQLException {
		List<Jogo> listaFilmes = new ArrayList<Jogo>();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT idfilme, nomeBR, nomeEN, anoLancamento, sinopse ");
		sql.append("FROM filme");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Jogo film = new Jogo();
			film.setIdfilme(rs.getInt("idfilme"));
			film.setNomeBR(rs.getString("nomeBR"));
			film.setNomeEN(rs.getString("nomeEN"));
			film.setAnoLancamento(rs.getInt("anoLancamento"));
			film.setSinopse(rs.getString("sinopse"));
			
			listaFilmes.add(film);
		}
		rs.close();
		ps.close();
		
		return listaFilmes;
	}
	
	private String insUpdDel(Jogo film, String cod) throws SQLException {
		String sql = "{CALL sp_iud_filme (?,?,?,?,?,?,?)}";
		CallableStatement cs = c.prepareCall(sql);
		cs.setString(1, cod);
		cs.setInt(2, film.getIdfilme());
		cs.setString(3, film.getNomeBR());
		cs.setString(4, film.getNomeEN());
		cs.setInt(5, film.getAnoLancamento());
		cs.setString(6, film.getSinopse());
		cs.registerOutParameter(7, Types.VARCHAR);
		
		cs.execute();
		String saida = cs.getString(7);
		cs.close();
		
		return saida;
	}

}
