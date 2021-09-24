package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Grupo;

public interface IGrupoDao {
	
	public String insertGrupo (Grupo grup) throws SQLException;
	public String updateGrupo (Grupo grup) throws SQLException;
	public String deleteGrupo (Grupo grup) throws SQLException;
    public Grupo selectGrupo (Grupo grup) throws SQLException;
    public List<Grupo> selectGrupos() throws SQLException;
}
