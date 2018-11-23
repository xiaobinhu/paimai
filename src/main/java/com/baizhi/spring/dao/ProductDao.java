package com.baizhi.spring.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baizhi.spring.entity.Product;

public interface ProductDao {
    public List<Product> selectAll();
    public void insert(Product product);
    public void delete(int id);
    public void update(Product product);
    public Product selectOne(int id);
    public List<Product> selectBy(Product product);
    
} 
