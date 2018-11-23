

/*
package com.baizhi.spring.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;


@Configuration
public class WebConfig  extends WebMvcConfigurerAdapter {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        InterceptorRegistration interceptorRegistration = registry.addInterceptor(new AuthInterceptor()).addPathPatterns("/**");
        String[] strings = {"login","regist","yanzhengma"};
        interceptorRegistration.excludePathPatterns(strings);
    }


}*/


