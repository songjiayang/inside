package me.second.hand.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import me.second.hand.dao.UserDao;
import me.second.hand.entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class UserDaoImpl implements UserDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public long saveAndGetPK(final User user) {
		final String INSERT_SQL = "insert into t_user(u_username,u_password,u_email,u_sex,u_realname,u_idnum,u_tel,"
				+ "u_qq,u_school,u_city,u_registertime,u_registerip,u_specialty,u_isvalidate,u_grade) " + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String[] { "id" });
				ps.setString(1, user.getUserName());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getEmail());
				ps.setString(4, user.getSex());
				ps.setString(5, user.getRealName());
				ps.setString(6, user.getIdNumber());
				ps.setString(7, user.getTel());
				ps.setString(8, user.getQq());
				ps.setString(9, user.getSchool());
				ps.setString(10, user.getCity());
				ps.setString(11, user.getRegTime());
				ps.setString(12, user.getRegIp());
				ps.setString(13, user.getSpecialty());
				ps.setLong(14, user.getIsvalidate());
				ps.setLong(15, user.getGrade());
				return ps;
			}
		}, keyHolder);
		return Long.parseLong(keyHolder.getKey().toString());
	}

	@Override
	public User getUserByNameOrEmail(String nameOrEmail) {
		User user = null;
		try {
			 user = this.jdbcTemplate.queryForObject("select * from t_user where u_username =? or u_email=?", new Object[] { nameOrEmail, nameOrEmail }, new RowMapper<User>() {
				public User mapRow(ResultSet rs, int rowNum) throws SQLException {
					User user = new User();
					user.setId(rs.getLong("id"));
					user.setUserName(rs.getString("u_username"));
					user.setPassword(rs.getString("u_password"));
					user.setEmail(rs.getString("u_email"));
					user.setSex(rs.getString("u_sex"));
					user.setRealName(rs.getString("u_realname"));
					user.setIdNumber(rs.getString("u_idnum"));
					user.setTel(rs.getString("u_tel"));
					user.setQq(rs.getString("u_qq"));
					user.setSchool(rs.getString("u_school"));
					user.setCity(rs.getString("u_city"));
					user.setRegTime(rs.getString("u_registertime"));
					user.setRegIp(rs.getString("u_registerip"));
					user.setSpecialty(rs.getString("u_specialty"));
					user.setIsvalidate(rs.getInt("u_isvalidate"));
					user.setGrade(rs.getInt("u_grade"));
					return user;
				}
			});
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	@Override
	public User getUserById(long id) {
		User user = null;
		try {
			user = this.jdbcTemplate.queryForObject("select * from t_user where id =?", new Object[] { id }, new RowMapper<User>() {
				public User mapRow(ResultSet rs, int rowNum) throws SQLException {
					User user = new User();
					user.setId(rs.getLong("id"));
					user.setUserName(rs.getString("u_username"));
					user.setPassword(rs.getString("u_password"));
					user.setEmail(rs.getString("u_email"));
					user.setSex(rs.getString("u_sex"));
					user.setRealName(rs.getString("u_realname"));
					user.setIdNumber(rs.getString("u_idnum"));
					user.setTel(rs.getString("u_tel"));
					user.setQq(rs.getString("u_qq"));
					user.setSchool(rs.getString("u_school"));
					user.setCity(rs.getString("u_city"));
					user.setRegTime(rs.getString("u_registertime"));
					user.setRegIp(rs.getString("u_registerip"));
					user.setSpecialty(rs.getString("u_specialty"));
					user.setIsvalidate(rs.getInt("u_isvalidate"));
					user.setGrade(rs.getInt("u_grade"));
					return user;
				}
			});
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	@Override
	public int deleteUserById(long id) {
		return jdbcTemplate.update("delete from t_user where id=?", id);

	}

	@Override
	public int modifyOneUser(User u) {
		try {
		String sql = "update t_user set u_username=?,u_password=?,u_email=?,u_sex=?,u_realname=?,u_idnum=?,u_tel=?,"
				+ "u_qq=?,u_school=?,u_city=?,u_registertime=?,u_registerip=?,u_specialty=?,u_isvalidate=?,u_grade=? where id=?";
		int updateresult= jdbcTemplate.update(sql, new Object[]{u.getUserName(), u.getPassword(), u.getEmail(), u.getSex(), u.getRealName(), u.getIdNumber(), u.getTel(), u.getQq(), u.getSchool(), u.getCity(),
				u.getRegTime(), u.getRegIp(), u.getSpecialty(), u.getIsvalidate(), u.getGrade(), u.getId()});
		return updateresult;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;

	}

	@Override
	public List<User> filterQuery(String hql) {
		List<User> users  = null;
		try {
			users = jdbcTemplate.query(hql, new RowMapper<User>() {
				public User mapRow(ResultSet rs, int rowNum) throws SQLException {
					User user = new User();
					user.setId(rs.getLong("id"));
					user.setUserName(rs.getString("u_username"));
					user.setPassword(rs.getString("u_password"));
					user.setEmail(rs.getString("u_email"));
					user.setSex(rs.getString("u_sex"));
					user.setRealName(rs.getString("u_realname"));
					user.setIdNumber(rs.getString("u_idnum"));
					user.setTel(rs.getString("u_tel"));
					user.setQq(rs.getString("u_qq"));
					user.setSchool(rs.getString("u_school"));
					user.setCity(rs.getString("u_city"));
					user.setRegTime(rs.getString("u_registertime"));
					user.setRegIp(rs.getString("u_registerip"));
					user.setSpecialty(rs.getString("u_specialty"));
					user.setIsvalidate(rs.getInt("u_isvalidate"));
					user.setGrade(rs.getInt("u_grade"));
					return user;
				}
			});
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return users;
	}

	@Override
	public int dmlByHql(String hql) {
		return jdbcTemplate.update(hql);
	}

}
