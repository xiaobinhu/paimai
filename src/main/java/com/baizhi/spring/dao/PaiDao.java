package com.baizhi.spring.dao;

import java.util.List;

import com.baizhi.spring.entity.Pai;

public interface PaiDao {
    public void insert(Pai p);
    public List<Pai> selectAll(int id);
}
