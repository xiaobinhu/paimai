package com.baizhi.spring.controller;

import com.baizhi.spring.entity.Pai;
import com.baizhi.spring.entity.User;
import com.baizhi.spring.service.PaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

@Controller
@Scope("prototype")
public class PaiController {
	
	@Autowired
    private PaiService paiService;
	

    @RequestMapping("insert")
    public String insert(Pai pai,Map map,HttpSession hs){
    	Date date=new Date() ;
    	User u =(User) hs.getAttribute("user");
    	int id =u.getUser_id();
    	pai.setUser_id(id);
    	pai.setAuction_time(date);
    	//System.out.println(pai);
    	paiService.insert(pai);
    	int auction_id=pai.getAuction_id();
    	/*product =pro.selectOne(pai.getAuction_id());
    	list2=paiService.selectAll(pai.getAuction_id());*/
    	return "redirect:/selectOne1.con?auction_id="+auction_id;
    }
}
