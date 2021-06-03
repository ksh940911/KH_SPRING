package com.kh.spring.common.aop.test;

public class FooImpl implements Foo {

	@Override
	public void sayHello() {
		// 주업무로직
		System.out.println("say foo o o o oooooooooooooooooooooooooo!");
	}

	@Override
	public String getName() {
		return "fooooooooo";
	}

}
