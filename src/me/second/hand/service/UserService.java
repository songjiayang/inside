package me.second.hand.service;

import java.util.List;
import org.apache.log4j.Logger;
import org.hibernate.annotations.Where;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.second.hand.dao.UserDao;
import me.second.hand.entity.User;

@Service
public class UserService {
	
	private Logger log =  Logger.getLogger(UserService.class);

	@Autowired
	UserDao userDao;
	
	public long  addUser(User user) {
		log.debug("调用UserService的addUser方法");
		return userDao.saveAndGetPK(user);
	}
	

	public List<User> listAllUser() {
		log.debug("调用UserService的list方法");
		return userDao.filterQuery("select * from t_user");
	}

	public void deleteUser(long id) {
		log.debug("更据userId删除用户");
		userDao.deleteUserById(id);
	}
	
	public void modifyOne(User user){
		log.debug("更据userId删除用户");
		userDao.modifyOneUser(user);
	}

	public User getUserByEmailOrName(String usernameOrEmail) {
		log.debug("验证是否有"+usernameOrEmail+"该用户");
		return  userDao.getUserByNameOrEmail(usernameOrEmail);
	}
	
	public User getOneUserById(long id){
		log.debug("查询主键为"+id+"该用户");
		return userDao.getUserById(id);
		
	}
	
	public int  idValidated(String email){
		return userDao.dmlByHql("update t_user set u_isvalidate =1 where u_email ='"+email+"'" );
	}
	
	public int updatePass(String email,String password){
		return userDao.dmlByHql("update t_user set u_password = '"+password+"' where u_email =  '"+email+"'");
	}

	
	
}
