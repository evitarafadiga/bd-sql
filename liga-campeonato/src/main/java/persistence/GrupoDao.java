package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import model.Grupo;

public class GrupoDao implements IGrupoDao {
	
	private Connection c;
	
	public GrupoDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
	}

	@Override
	public String insertGrupo(Grupo grup) throws SQLException {
		String saida = insUpdDel(grup,"I");
		return saida;
	}

	@Override
	public String updateGrupo(Grupo grup) throws SQLException {
		String saida = insUpdDel(grup,"U");
		return saida;
	}

	@Override
	public String deleteGrupo(Grupo grup) throws SQLException {
		String saida = insUpdDel(grup,"D");
		return saida;
	}

	@Override
	public Grupo selectGrupo(Grupo grup) throws SQLException {
		String sql = "SELECT id, letra, codigo_time_grupo FROM grupos WHERE id = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, grup.getId());
		
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			grup.setLetra(rs.getString("letra"));
			grup.setCodigotimegrupo(rs.getInt("codigo_time_grupo"));
		} else {
			grup = new Grupo();
		}
		rs.close();
		ps.close();
		
		return grup;
	}

	@Override
	public List<Grupo> selectGrupos() throws SQLException {
		List<Grupo> listaGrupos = new ArrayList<Grupo>();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT id, letra, codigo_time_grupo ");
		sql.append("FROM grupos");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Grupo grup = new Grupo();
			grup.setId(rs.getInt("id"));
			grup.setLetra(rs.getString("letra"));
			grup.setCodigotimegrupo(rs.getInt("codigo_time_grupo"));
			
			
			listaGrupos.add(grup);
		}
		rs.close();
		ps.close();
		
		return listaGrupos;
	}
	
	private String insUpdDel(Grupo grup, String cod) throws SQLException {
		String sql = "{CALL sp_iud_grupo (?,?,?,?,?)}";
		CallableStatement cs = c.prepareCall(sql);
		cs.setString(1, cod);
		cs.setInt(2, grup.getId());
		cs.setString(3, grup.getLetra());
		cs.setInt(4, grup.getCodigotimegrupo());
		cs.registerOutParameter(5, Types.VARCHAR);
		
		cs.execute();
		String saida = cs.getString(5);
		cs.close();
		
		return saida;
	}

}

