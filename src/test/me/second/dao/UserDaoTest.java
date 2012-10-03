package test.me.second.dao;

import java.sql.SQLException;

import me.second.hand.dao.UserDao;
import me.second.hand.entity.User;
import me.second.hand.util.MyTimeUtil;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class UserDaoTest {
	
	private ApplicationContext aContext;
	private UserDao userDao;
	
	@Before
	public void initDate(){
		aContext = new ClassPathXmlApplicationContext("second-dao.xml");
		userDao = (UserDao)aContext.getBean("userDao");
	}
	@Test
	public void addOneUserTest() throws SQLException{
	User user = new User();
		user.setEmail("sjy@sodt.cn");
		user.setPassword("liushan1314");
		user.setRealName("宋佳洋");
		user.setIdNumber("0905010218");
		user.setSex("男");
		user.setUserName("smallfish");
		user.setCity("成都");
		user.setGrade(2009);
		user.setIsvalidate(1);
		user.setQq("448951642");
		user.setSchool("计算机科学院");
		user.setRegIp("192.168.1.1");
		user.setRegTime(MyTimeUtil.getSystemTime());
		user.setSpecialty("计算机课科学与技术");
		System.out.println(userDao.saveAndGetPK(user));
	}
	
	@Test
	public void queryOneUser(){
		User u =  userDao.filterQuery("select * from t_user").get(0);
		System.out.println(u.getEmail());
	}
	
	@Test
	public void isexitTest(){
		User user = userDao.getUserByNameOrEmail("sjy@sodt.cn1");
		user.setCity("test");
		userDao.modifyOneUser(user);
		System.out.println(user.getCity());
	}
	
	@Test
	public void updateontTest(){
		User user = new User();
		user.setId(75);
		user.setEmail("sjy@sodt.cn111");
		user.setPassword("liushan1314");
		user.setRealName("宋佳洋");
		user.setIdNumber("0905010218");
		user.setSex("男");
		user.setUserName("smallfish111");
		user.setCity("成都");
		user.setGrade(2009);
		user.setIsvalidate(1);
		user.setQq("448951642");
		user.setSchool("计算机科学院");
		user.setRegIp("192.168.1.1");
		user.setRegTime(MyTimeUtil.getSystemTime());
		user.setSpecialty("计算机课科学与技术");
		userDao.modifyOneUser(user);
	}
	
	
	

}
