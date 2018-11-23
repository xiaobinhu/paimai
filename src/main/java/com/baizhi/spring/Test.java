package com.baizhi.spring;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.HttpMessageConverters;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


@SpringBootApplication
@MapperScan("com.baizhi.spring.dao")

public class Test {
    public static void main(String[] args) {
        SpringApplication.run(Test.class, args);
    }
    @Bean
    public DefaultKaptcha producer() {
        Properties properties = new Properties();
        properties.put("kaptcha.border", "no");
        properties.put("kaptcha.textproducer.font.color", "green");
        properties.put("kaptcha.textproducer.char.space", "5");
        properties.put("kaptcha.textproducer.char.length","4");
        Config config = new Config(properties);
        DefaultKaptcha defaultKaptcha = new DefaultKaptcha();
        defaultKaptcha.setConfig(config);
        return defaultKaptcha;
    }

    @Bean
    public HttpMessageConverters fastJsonHttpMessageConverters() {
        FastJsonHttpMessageConverter oFastConverter = new FastJsonHttpMessageConverter();
        FastJsonConfig oFastJsonConfig = new FastJsonConfig();
        oFastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
        oFastConverter.setFastJsonConfig(oFastJsonConfig);
        List<MediaType> oFastMediaTypeList = new ArrayList<>();
        oFastMediaTypeList.add(MediaType.APPLICATION_JSON_UTF8);
        oFastConverter.setSupportedMediaTypes(oFastMediaTypeList);
        HttpMessageConverter<?> oConverter = oFastConverter;
        return new HttpMessageConverters(oConverter);
    }
}
