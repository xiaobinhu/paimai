package com.baizhi.spring.controller;



import com.baizhi.spring.entity.Pai;
import com.baizhi.spring.entity.Product;
import com.baizhi.spring.service.PaiService;
import com.baizhi.spring.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
public class ProductController{
	@Autowired
    private ProductService productService;
    @Autowired
    private PaiService paiService;

    
	public PaiService getPaiService() {
		return paiService;
	}

	public void setPaiService(PaiService paiService) {
		this.paiService = paiService;
	}
	
	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}  
	
	
	
	
	

@RequestMapping("add")	
public String insert(MultipartFile file,HttpServletRequest request,Product product) throws Exception{
	         //��ȡ���ϴ��������ļ���
			String fileName=file.getOriginalFilename();
			//���ļ�����������
			fileName=new Date().getTime()+"_"+fileName;
			//����upload�ļ������֣����Ի�ȡ�����ľ���·��
			String realPath = request.getRealPath("/images/");
			file.transferTo(new File(realPath+"\\"+fileName));
			
			product.setAuction_pic(fileName);
			productService.insert(product);
			
		    return "redirect:/selectBy.con";
		
	}
	@RequestMapping("delete")
	public String delete(int auction_id){
		//System.out.println("**********");
		productService.delete(auction_id);
		return "redirect:/selectBy.con";
	}
	
	@RequestMapping("update")
	public String update(MultipartFile file,HttpServletRequest request,Product product) throws Exception{
	  //�ļ��ϴ�����
           	         //��ȡ���ϴ��������ļ���
		
		
			String fileName=file.getOriginalFilename();
			if(!"".equals(fileName)){
			//���ļ�����������
			fileName=new Date().getTime()+"_"+fileName;
			//����upload�ļ������֣����Ի�ȡ�����ľ���·��
			String realPath = request.getRealPath("/images/");
			file.transferTo(new File(realPath+"\\"+fileName));
			product.setAuction_pic(fileName);
			}
			productService.update(product);
			return "redirect:/selectBy.con";
			
			
	}
	
	@RequestMapping("selectOne")
	public String selectOne(int auction_id,Map map){
		Product product=productService.selectOne(auction_id);
		map.put("product", product);
		return "forward:/private/update.jsp";
	}
	
	
	@RequestMapping("selectOne1")
	public String selectOne1(int auction_id,Map map){
	    List<Pai> list=paiService.selectAll(auction_id);
		Product product=productService.selectOne(auction_id);
		map.put("list", list);
		map.put("product", product);
		return "forward:/private/jingpai.jsp";
	}
	
	@RequestMapping("selectBy")
	public String selectBy(Product product,Map map){
		List<Product> list=productService.selectBy(product);
		map.put("list", list);
		System.out.println("************");
		return "forward:/private/showAll.jsp";
	}
}
