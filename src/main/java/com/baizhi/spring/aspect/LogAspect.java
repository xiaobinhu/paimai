package com.baizhi.spring.aspect;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.Configuration;

//@Aspect 用在类上 代表这个类是一个切面
@Configuration
@Aspect
public class LogAspect {


    
    @Around("execution(* com.baizhi.spring.service.*.*(..))")
    public Object around(ProceedingJoinPoint proceedingJoinPoint){
          Object proceed = null;
        System.out.println("执行前++++++++++++++++");
         //放行目标方法 就相当于执行了目标类的方法 他的结果就是方法的返回值
        try {
            proceed= proceedingJoinPoint.proceed();
            System.out.println("执行后---------------");
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
          return proceed;
    }
}
