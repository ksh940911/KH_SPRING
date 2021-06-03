package com.kh.spring.tv;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kh.spring.tv.model.vo.LgTv;
import com.kh.spring.tv.model.vo.SamsungTv;

public class TvBeanMain {

	public static void main(String[] args) {
		//ApplicationContext 생성
		//bean을 관리하는 단위
		String configLocation = "/application-context.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(configLocation);
		System.out.println("---------------- spring-container bean 초기화 완료 ----------------");
		
		LgTv lgtv1 = context.getBean(LgTv.class);
		System.out.println(lgtv1);
		
		LgTv lgtv2 = context.getBean(LgTv.class);
		System.out.println(lgtv2);
		System.out.println(lgtv1 == lgtv2);

		SamsungTv sstv = (SamsungTv) context.getBean("samsungTv");
		System.out.println(sstv);
		
		lgtv1.powerOn();
		sstv.powerOn();
		
		lgtv1.changeChannel(3);
		sstv.changeChannel(10);
		
	}

}
