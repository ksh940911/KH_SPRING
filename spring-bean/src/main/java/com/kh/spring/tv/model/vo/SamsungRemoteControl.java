package com.kh.spring.tv.model.vo;

public class SamsungRemoteControl implements RemoteControl {

	@Override
	public void changeChannel(int no) {
		System.out.println("세계1등 리모콘, 채널을 " + no + "로 변경합니다.");
	}

}
