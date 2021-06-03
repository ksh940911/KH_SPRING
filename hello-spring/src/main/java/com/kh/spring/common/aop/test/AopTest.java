package com.kh.spring.common.aop.test;

public class AopTest {

	Foo foo = new FooProxy(new FooImpl());
	
	public static void main(String[] args) {
		
//		new AopTest().fooTest();
		new AopTest().fooNameTest();
		
	}

	private void fooNameTest() {
		String name = foo.getName();
		System.out.println(name);
	}

	private void fooTest() {
		foo.sayHello();
	}

}
