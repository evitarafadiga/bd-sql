package persistence;

import java.sql.SQLException;
import java.util.List;

import model.Time;

public interface ITimeDao {
	
	public String insertTime (Time time) throws SQLException;
	public String updateTime (Time time) throws SQLException;
	public String deleteTime (Time time) throws SQLException;
    public Time selectTime (Time time) throws SQLException;
    public List<Time> selectTimes() throws SQLException;
}