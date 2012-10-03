package me.second.hand.dao.jdbc;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.sql.DataSource;

import me.second.hand.dao.AdminstorDao;
import me.second.hand.entity.Administor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class AdminstorDaoImpl implements AdminstorDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Administor getOneAdminByName(String name) {
		String sql = "select * from t_adminuser  where a_username = ?";
		try {
			RowMapper<Administor> mapper = new RowMapper<Administor>() {
				public Administor mapRow(ResultSet rs, int rowNum) throws SQLException {
					Administor administor = new Administor();
					administor.setId(rs.getLong(1));
					administor.setUserName(rs.getString(2));
					administor.setPasswrod(rs.getString(3));
					administor.setPermission(rs.getString(4));
					return administor;
				}
			};
			return (Administor) jdbcTemplate.queryForObject(sql, new Object[] {name}, mapper);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return null;
		
	}

	@Override
	public int modifyOne(Administor administor) {
		String sql ="update t_adminuser set a_username=?,a_password=?,a_permission=? where id=?";
		return jdbcTemplate.update(sql, administor.getUserName(),administor.getPasswrod(),administor.getPermission(),administor.getId());

	}

	@Override
	public long addOne(final Administor administor) {
		final String INSERT_SQL = "insert into t_adminuser(a_username,a_password,a_permission) values(?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(
		    new PreparedStatementCreator() {
		        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
		            PreparedStatement ps =
		                connection.prepareStatement(INSERT_SQL, new String[] {"id"});
		            ps.setString(1, administor.getUserName());
		            ps.setString(2, administor.getPasswrod());
		            ps.setString(3, administor.getPermission());
		            return ps;
		        }
		    },
		    keyHolder);
		return Long.parseLong(keyHolder.getKey().toString());
	}

	@Override
	public int deleteById(long id) {
		final String DELETE_SQL = "delete from t_adminuser where id =?";
		return jdbcTemplate.update(DELETE_SQL, id);
	}
}
