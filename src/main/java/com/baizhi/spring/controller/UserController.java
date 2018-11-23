package com.baizhi.spring.controller;


import com.baizhi.spring.entity.User;
import com.baizhi.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController{
	@Autowired
    private UserService userService;
	@RequestMapping("login")
	public String login(User user,String number,HttpSession session){
		user =userService.login(user);
		String code =(String) session.getAttribute("code");
		   if(user!= null&&code.equalsIgnoreCase(number)){
			   session.setAttribute("user", user);   
			   return "redirect:/selectBy.con";
			   
		   }else{
			   return "redirect:/login.jsp";
		   }
		   
	}
	@RequestMapping("regist")
	public String regist(String number,User user,HttpSession session,int checkbox){
		String code =(String) session.getAttribute("code");
		if(code.equalsIgnoreCase(number)&&checkbox==1){
			userService.regist(user);
			User u =userService.login(user);
			session.setAttribute("user", u);
			return "redirect:/selectBy.con";
		}else{
			return "redirect:/regist.jsp";
			
		}			
	}
	
	@RequestMapping("loginOut")
	public String loginOut(HttpSession session){
		session.removeAttribute("user");
		 return "redirect:/login.jsp";
	}

}
