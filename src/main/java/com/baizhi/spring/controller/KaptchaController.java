package com.baizhi.spring.controller;

import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class KaptchaController {
      @Autowired
      private Producer producer	;

      @RequestMapping("/yanzhengma")

      public void getKaptcha(HttpSession se, HttpServletResponse res) throws IOException{

    	  String  code =producer.createText();

    	  se.setAttribute("code", code);

    	  BufferedImage img =producer.createImage(code);

    	  ImageIO.write(img, "jpg", res.getOutputStream());
}
}
