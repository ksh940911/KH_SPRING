package com.kh.spring.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.kh.spring.user.model.service.UserService;

@Component
@Scope("prototype")
@Lazy // lazy-init="true"와 동일
public class UserController {
	
	/**
	 * 1.field
	 */
	//@Autowired
	private UserService userService;
	
	/**
	 * 2. setter
	 * 
	 */
//	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	
	public void getUserDetail(String id) {
		userService.getUserDetail(id);
	}
	
}
