package com.kh.spring.tv.model.vo;

public class LgTv implements Tv {

	//의존객체
	private RemoteControl remocon;
	
	/**
	 * bean>property
	 * setter를 이용해서 의존주입 Dependency Injection한다.
	 * 
	 * @param remocon
	 */
	public void setRemocon(RemoteControl remocon) {
		System.out.println("setRemocon : " + remocon);
		this.remocon = remocon; 
	}
	
	/**
	 * bean>constructor
	 * 생성자를 이용해서 의존주입 DI 한다.
	 * @param remocon
	 */
	public LgTv(RemoteControl remocon) {
		System.out.println("LgTv객체생성 : " + remocon);
		this.remocon = remocon;
	}
	
	
	public LgTv() {
		System.out.println("LgTv객체를 생성했습니다.");
	}
	
	@Override
	public void powerOn() {
		System.out.println("LgTv의 전원을 켰습니다.");
	}
	
	public void changeChannel(int no) {
		this.remocon.changeChannel(no);
	}

}
