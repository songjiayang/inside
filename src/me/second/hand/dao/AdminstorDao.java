package me.second.hand.dao;

import me.second.hand.entity.Administor;

public interface AdminstorDao {

	public Administor getOneAdminByName(String name);
	
	public int modifyOne(Administor administor);
	
	public long  addOne(Administor administor);
	
	public int deleteById(long id);
}
