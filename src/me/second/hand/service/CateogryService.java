package me.second.hand.service;

import java.util.List;

import me.second.hand.dao.CateogryDao;
import me.second.hand.entity.Cateogry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CateogryService {
	
	@Autowired
	CateogryDao cateogryDao;
	
	Logger log = Logger.getLogger(CateogryService.class);
	
	public void addCateogrys(List<Cateogry> cateogrys){
		log.debug("开始插入一个cateogry的list");
		if (cateogrys == null|| cateogrys.size()==0) {
			return ;
		}else {
			cateogryDao.addList(cateogrys);
			log.debug("增加了 "+cateogrys.size()+"个cateogry");
		}
	}
	
	public List<Cateogry> getAllCateogrys(){
		log.debug("获取所有的cateogry!!");
		return cateogryDao.filterQuery("select * from t_cateogry");
	}
	
	
	public Cateogry getOneById(long id){
		log.debug("根据id获取Cateogry");
		return cateogryDao.getOneById(id);
	}
	
	public int modifyone(Cateogry cateogry){
		log.debug("修改了id是"+cateogry.getId()+"的category");
		return cateogryDao.modifyOne(cateogry);
	}
	
	

}
