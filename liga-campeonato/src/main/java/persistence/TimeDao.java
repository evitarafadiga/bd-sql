package persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import model.Time;

public class TimeDao implements ITimeDao {
	
	private Connection c;
	
	public TimeDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
	}

	@Override
	public String insertTime(Time time) throws SQLException {
		String saida = insUpdDel(time,"I");
		return saida;
	
	}
	@Override
	public String updateTime(Time time) throws SQLException {
		String saida = insUpdDel(time,"U");
		return saida;
	}

	@Override
	public String deleteTime(Time time) throws SQLException {
		String saida = insUpdDel(time,"D");
		return saida;
	}

	@Override
	public Time selectTime(Time time) throws SQLException {
		String sql = "SELECT codigo_time, nome_time, cidade, estadio FROM times WHERE codigo_time = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, time.getCodigotime());
		
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			time.setNometime(rs.getString("nome_time"));
			time.setCidade(rs.getString("cidade"));
			time.setEstadio(rs.getString("estadio"));
			
		} else {
			time = new Time();
		}
		rs.close();
		ps.close();
		
		return time;
	}

	@Override
	public List<Time> selectTimes() throws SQLException {
		List<Time> listaTimes = new ArrayList<Time>();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT codigo_time, nome_time, cidade, estadio ");
		sql.append("FROM times");
		
		PreparedStatement ps = c.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Time time = new Time();
			time.setCodigotime(rs.getInt("codigo_time"));
			time.setNometime(rs.getString("nome_time"));
			time.setCidade(rs.getString("cidade"));
			time.setEstadio(rs.getString("estadio"));
			
			listaTimes.add(time);
		}
		rs.close();
		ps.close();
		
		return listaTimes;
	}
	
	private String insUpdDel(Time time, String cod) throws SQLException {
		String sql = "{CALL sp_iud_time (?,?,?,?,?,?)}";
		CallableStatement cs = c.prepareCall(sql);
		cs.setString(1, cod);
		cs.setInt(2, time.getCodigotime());
		cs.setString(3, time.getNometime());
		cs.setString(4, time.getCidade());
		cs.setString(5, time.getEstadio());
		cs.registerOutParameter(6, Types.VARCHAR);
		
		cs.execute();
		String saida = cs.getString(6);
		cs.close();
		
		return saida;
	}

}
