package me.second.hand.dao;

import java.util.List;

import me.second.hand.entity.User;

public interface UserDao {
	
	public long saveAndGetPK(User user) ;
	
	public User getUserByNameOrEmail(String nameOrEmail);
	
	public User getUserById(long id);

	public int deleteUserById(long id) ;
	
	public int modifyOneUser(User user) ;
	
	public List<User> filterQuery(String hql) ;
	
	public int dmlByHql(String hql);

}
