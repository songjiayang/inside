package me.second.hand.dao.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import me.second.hand.dao.GoodsDao;
import me.second.hand.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class GoodsDaoImpl implements GoodsDao {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public long addOneGoods(final Goods goods) {
		final String INSERT_SQL = "insert into t_goods(g_imgurl,g_title,g_category,g_introduction,g_price,g_releasetime,g_userid,"
				+ "g_tradetype,g_condition,g_isreport,g_newlevel) values(?,?,?,?,?,?,?,?,?,?,?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String[] { "id" });
				ps.setString(1, goods.getImgUrl());
				ps.setString(2, goods.getTitle());
				ps.setLong(3, goods.getCateogryId());
				ps.setString(4, goods.getIntroduction());
				ps.setDouble(5, goods.getPrice());
				ps.setString(6, goods.getReleaseTime());
				ps.setLong(7, goods.getUserId());
				ps.setInt(8, goods.getTradeType());
				ps.setInt(9, goods.getCondition());
				ps.setInt(10, goods.getIsReport());
				ps.setString(11, goods.getNewLevel());
				return ps;
			}
		}, keyHolder);
		return Long.parseLong(keyHolder.getKey().toString());
	}

	@Override
	public int modifyOneGoods(Goods g) {
		String sql = "update t_goods set g_imgurl=?,g_title=?,g_category=?,g_introduction=?,g_price=?,g_releasetime=?" + ",g_userid=?,g_tradetype=?,g_condition=?,g_isreport=?,"
				+ "g_newlevel=? where id=?";
		return jdbcTemplate.update(sql,new Object[]{ g.getImgUrl(), g.getTitle(), g.getCateogryId(), g.getIntroduction(), g.getPrice(), g.getReleaseTime(), g.getUserId(), g.getTradeType(), g.getCondition(),
				g.getIsReport(), g.getNewLevel(), g.getId()});
	}

	@Override
	public int deleteOneGoods(long id) {
		final String DELETE_SQL = "delete from t_goods where id = ?";
		return jdbcTemplate.update(DELETE_SQL, new Object[]{id});

	}

	@Override
	public Goods findOneById(long id) {
		try {
			String sql = "select * from t_goods  where id = ?";
			RowMapper<Goods> mapper = new RowMapper<Goods>() {
				public Goods mapRow(ResultSet rs, int rowNum) throws SQLException {
					Goods g = new Goods();
					g.setId(rs.getLong(1));
					g.setImgUrl(rs.getString("g_imgurl"));
					g.setTitle(rs.getString("g_title"));
					g.setCateogryId(rs.getLong("g_category"));
					g.setIntroduction(rs.getString("g_introduction"));
					g.setPrice(rs.getDouble("g_price"));
					g.setReleaseTime(rs.getString("g_releasetime"));
					g.setUserId(rs.getLong("g_userid"));
					g.setTradeType(rs.getInt("g_tradetype"));
					g.setCondition(rs.getInt("g_condition"));
					g.setIsReport(rs.getInt("g_isreport"));
					g.setNewLevel(rs.getString("g_newlevel"));
					return g;
				}
			};
			return (Goods) jdbcTemplate.queryForObject(sql, new Object[] { id }, mapper);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}

	@Override
	public List<Goods> filterQuery(String hql) {
		List<Goods> goods = null;
		try {
			 goods = jdbcTemplate.query(hql, new RowMapper<Goods>() {
				public Goods mapRow(ResultSet rs, int rowNum) throws SQLException {
					Goods g = new Goods();
					g.setId(rs.getLong(1));
					g.setImgUrl(rs.getString("g_imgurl"));
					g.setTitle(rs.getString("g_title"));
					g.setCateogryId(rs.getLong("g_category"));
					g.setIntroduction(rs.getString("g_introduction"));
					g.setPrice(rs.getDouble("g_price"));
					g.setReleaseTime(rs.getString("g_releasetime"));
					g.setUserId(rs.getLong("g_userid"));
					g.setTradeType(rs.getInt("g_tradetype"));
					g.setCondition(rs.getInt("g_condition"));
					g.setIsReport(rs.getInt("g_isreport"));
					g.setNewLevel(rs.getString("g_newlevel"));
					return g;
				}
			});
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return goods;
		
	}

	@Override
	public int dmlByHql(String hql) {
		return jdbcTemplate.update(hql);
	}

	@Override
	public int deleteList(List<Integer> ids) {
		List<Object[]> batch = new ArrayList<Object[]>();
		for (int id : ids) {
			Object[] values = new Object[] { id };
			batch.add(values);
		}
		int[] updateCounts = jdbcTemplate.batchUpdate("delete t_goods  where id = ?", batch);
		return updateCounts.length;
	}
}
