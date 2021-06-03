package com.kh.spring.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

@Component
@Aspect
@Slf4j
public class RuntimeCheckAdvice {

	@Pointcut("execution(* com.kh.spring.memo.controller.MemoController.insertMemo(..))")
	public void pointcut() {}
	
	@Around("pointcut()")
	public Object runtimeCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		Signature signature = joinPoint.getSignature();
		String methodName = signature.getName();
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object returnObj = joinPoint.proceed();
		
		stopWatch.stop();
		long duration = stopWatch.getTotalTimeMillis();
		
		log.debug("{} 소요시간 : {} ms", methodName, duration);
		
		return returnObj;
		
	}
	
	
}





