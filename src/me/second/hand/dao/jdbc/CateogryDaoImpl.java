package me.second.hand.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.sql.DataSource;
import me.second.hand.dao.CateogryDao;
import me.second.hand.entity.Cateogry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class CateogryDaoImpl implements CateogryDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public long addOne(final Cateogry cateogry) {
		final String INSERT_SQL = "insert into t_cateogry(c_name,c_description) values(?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(
		    new PreparedStatementCreator() {
		        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
		            PreparedStatement ps =
		                connection.prepareStatement(INSERT_SQL, new String[] {"id"});
		            ps.setString(1, cateogry.getName());
		            ps.setString(2, cateogry.getDescription());
		            return ps;
		        }
		    },
		    keyHolder);
		return Long.parseLong(keyHolder.getKey().toString());
	}

	@Override
	public void addList(List<Cateogry> cateogries) {
		  Collection<Object[]> batch = new ArrayList<Object[]>();
	        for (Cateogry cateogry : cateogries) {
	            Object[] values = new Object[] {
	                    cateogry.getName(),
	                    cateogry.getDescription()};
	            batch.add(values);
	        }
	        jdbcTemplate.batchUpdate(
	                "insert into t_cateogry(c_name,c_description) values(?,?)",
	                cateogries,
	                100,
	                new ParameterizedPreparedStatementSetter<Cateogry>() {
	                    public void setValues(PreparedStatement ps, Cateogry argument) throws SQLException {
	                        ps.setString(1, argument.getName());
	                        ps.setString(2, argument.getDescription());
	 
	                     }
	                 } );
		
	}

	@Override
	public int modifyOne(Cateogry c) {
		String sql ="update t_cateogry set c_name=?,c_description=? where id=?";
		return jdbcTemplate.update(sql, c.getName(),c.getDescription(),c.getId());
		
	}


	@Override
	public List<Cateogry> filterQuery(String hql) {
		List<Cateogry> cateogries = null;
		try {
			cateogries = jdbcTemplate.query(hql, new RowMapper<Cateogry>() {
				public Cateogry mapRow(ResultSet rs, int rowNum) throws SQLException {
					Cateogry c = new Cateogry();
					c.setId(rs.getLong(1));
					c.setName(rs.getString(2));
					c.setDescription(rs.getString(3));
					return c;
				}
			});
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return cateogries;
		
	}

	@Override
	public Cateogry getOneById(long id) {
		String sql = "select * from t_cateogry  where id = ?";
		RowMapper<Cateogry> mapper = new RowMapper<Cateogry>() {
			public Cateogry mapRow(ResultSet rs, int rowNum) throws SQLException {
				Cateogry c = new Cateogry();
				c.setId(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setDescription(rs.getString(3));
				return c;
			}
		};
		return (Cateogry) jdbcTemplate.queryForObject(sql, new Object[] {id}, mapper);
	}

	@Override
	public int deleteOneById(long id) {
		final String DELETE_SQL = "delete from t_cateogry where id =?";
		return jdbcTemplate.update(DELETE_SQL, id);
	}

}
