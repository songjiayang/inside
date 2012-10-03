package me.second.hand.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import me.second.hand.exception.UserHadException;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

/**
 * DAO基类，其它DAO可以直接继承这个DAO，不但可以复用共用的方法，还可以获得泛型的好处。
 */
public class BaseDao<T> {

	private Class<T> entityClass;
	public Logger log ; 

	@Autowired
	private SessionFactory sessionFactory;

	public BaseDao() {
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		entityClass = (Class) params[0];
		log = Logger.getLogger(entityClass);
	}

	
	/**
	 * 插入一个PO，并返回该主键
	 */
	protected String addObjectPK(Object obj) {
		String id = null;
		id = (String) getSession().save(obj);
		return id;
	}
	
	/**
	 * 保存PO
	 * @param entity
	 * @throws UserHadException 
	 */
	protected void save(T entity)  {
		getSession().save(entity);	
	}
	
	protected void saveAList(List<T> entitys)  {
		Session session = getSession();
		session.beginTransaction();
		for (T t : entitys) {
			session.save(t);
		}
		session.getTransaction().commit();
		session.flush();
		session.close();
	}
	
	/**
	 * 修改或添加
	 * @param entity
	 */
	protected void saveOrModify(T entity) {
		getSession().saveOrUpdate(entity);
	}
	

	/**
	 * 删除PO
	 * @param entity
	 */
	protected void remove(T entity) {
		getSession().delete(entity);
	}
	
	/**
	 * 根据Id删除Po
	 * @param id
	 */
	protected void removeById(long id){
		remove(findById(id));
	}

	/**
	 * 删除一个list对象
	 * @param entitys
	 */
	protected void deleteAlist(List<T> entitys){
		Session session = getSession();
		session.beginTransaction();
		for (T t : entitys) {
			session.delete(t);
		}
		session.getTransaction().commit();
		session.flush();
		session.close();
	}
	
	/**
	 * 更改PO
	 * @param entity
	 */
	protected void update(T entity) {
		getSession().update(entity);
	}
	
	
	@SuppressWarnings("unchecked")
	protected T findById(long id){
		return  (T) getSession().get(entityClass, id);
	}

	/**
	 * 执行HQL查询
	 * @param sql
	 * @return 查询结果
	 */
	@SuppressWarnings("unchecked")
	protected List<T> find(String hql) {
		return getSession().createQuery(hql).list();
	}
	
	protected int dml(String hql){
		Session session = getSession();
		session.beginTransaction();
		int i = getSession().createQuery(hql).executeUpdate();
		session.getTransaction().commit();
		session.flush();
		session.close();
		return i;

	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		return sessionFactory.openSession();
	}

}
