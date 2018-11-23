package com.baizhi.spring.service.impl;

import com.baizhi.spring.dao.PaiDao;
import com.baizhi.spring.entity.Pai;
import com.baizhi.spring.service.PaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PaiServiceImpl implements PaiService{
	@Autowired
    private PaiDao paiDao;
	
	
	
	public PaiDao getPaiDao() {
		return paiDao;
	}



	public void setPaiDao(PaiDao paiDao) {
		this.paiDao = paiDao;
	}




	public void insert(Pai p) {
		paiDao.insert(p);
	}




	public List<Pai> selectAll(int id) {
		// TODO Auto-generated method stub
		return paiDao.selectAll(id);
	}
    
	
	
}
