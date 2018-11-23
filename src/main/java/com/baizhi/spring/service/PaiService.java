package com.baizhi.spring.service;

import java.util.List;

import com.baizhi.spring.entity.Pai;

public interface PaiService {
     public void insert(Pai p);
	 public List<Pai> selectAll(int id);
}
