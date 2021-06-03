package com.kh.spring.common.aop.test;

public class FooProxy implements Foo {

	private Foo foo; // 실제 FooImpl객체
	
	public FooProxy(Foo foo) {
		this.foo = foo;
	}
	
	@Override
	public void sayHello() {
		//보조업무로직 before
		System.out.println("--------------before------------------");
		
		// 주업무로직 실행
		this.foo.sayHello();
		
		//보조업무로직 after
		System.out.println("----------------end----------------");
	}

	@Override
	public String getName() {
		return this.foo.getName().toUpperCase();
	}

}
