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
		String sql = "SELECT letra, codigo_time_grupo FROM grupos WHERE codigo_time_grupo = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(2, grup.getCodigotimegrupo());
		
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
		sql.append("SELECT letra, codigo_time_grupo ");
		sql.append("FROM grupos ORDER BY letra ");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Grupo grup = new Grupo();
			grup.setLetra(rs.getString("letra"));
			grup.setCodigotimegrupo(rs.getInt("codigo_time_grupo"));
			
			
			listaGrupos.add(grup);
		}
		rs.close();
		ps.close();
		
		return listaGrupos;
	}
	
	
	private String insUpdDel(Grupo grup, String cod) throws SQLException {
		String sql = "{CALL sp_iud_grupo (?,?,?,?)}";
		CallableStatement cs = c.prepareCall(sql);
		cs.setString(1, cod);
		cs.setString(2, grup.getLetra());
		cs.setInt(3, grup.getCodigotimegrupo());
		cs.registerOutParameter(4, Types.VARCHAR);
		
		cs.execute();
		String saida = cs.getString(4);
		cs.close();
		
		return saida;
	}
	
	public String generateGrupos(Grupo grup) throws SQLException {
		String sql = "{CALL sp_divide_grupos (?)}";
		CallableStatement cs = c.prepareCall(sql);
		
		cs.registerOutParameter(1, Types.VARCHAR);
		
		cs.execute();
		String saida = cs.getString(1);
		cs.close();
		
		return saida;
		
	}

}

