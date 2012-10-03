package me.second.hand.dao;

import java.util.List;

import me.second.hand.entity.Cateogry;

public interface CateogryDao {
	
	public long addOne(Cateogry cateogry);
	
	public void addList(List<Cateogry> cateogries);
	
	public int modifyOne(Cateogry cateogry);
	
	public int deleteOneById(long  id);
	
	public List<Cateogry> filterQuery(String hql);
	
	public Cateogry getOneById(long id);
	
}
