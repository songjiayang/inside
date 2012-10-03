package me.second.hand.service;

import me.second.hand.dao.AdminstorDao;
import me.second.hand.entity.Administor;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdministorService {
	
	@Autowired
	public AdminstorDao adminstorDao;
	
	Logger log = Logger.getLogger(AdministorService.class);
	
	public void modifyOne(Administor administor){
		log.debug("调用了AdministorService.modifyOne方法");
		adminstorDao.modifyOne(administor);
	}
	
	public Administor findOneByName(String name){
		log.debug("调用了AdministorService.findOneByName方法");
		return adminstorDao.getOneAdminByName(name);
	}

}
