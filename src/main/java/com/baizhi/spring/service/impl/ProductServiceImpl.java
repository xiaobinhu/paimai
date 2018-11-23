package com.baizhi.spring.service.impl;

import com.baizhi.spring.dao.ProductDao;
import com.baizhi.spring.entity.Product;
import com.baizhi.spring.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
    private ProductDao productDao;
	
	public ProductDao getProductDao() {
		return productDao;
	}



	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}




	public List<Product> selectAll() {
		
		return productDao.selectAll();
	}




	public void insert(Product product) {
		productDao.insert(product);
		
	}




	public void delete(int id) {
		productDao.delete(id);
		
	}




	public void update(Product product) {
		productDao.update(product);
		
	}




	public Product selectOne(int id) {
		
		return productDao.selectOne(id);
	}




	public List<Product> selectBy(Product product) {
        List<Product> products = productDao.selectBy(product);
        System.out.println(products);
        return products;
	}

}
