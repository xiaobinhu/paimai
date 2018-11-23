package com.baizhi.spring.service.impl;

import com.baizhi.spring.dao.UserDao;
import com.baizhi.spring.entity.User;
import com.baizhi.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
     private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	
	
	

	public User login(User user) {		
		return userDao.login(user);
	}


	public void regist(User user) {
		userDao.regist(user);		
	}
     
     
}
