package com.kh.spring.menu.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/menu")
@Slf4j
public class MenuController {

	@GetMapping("/menu.do")
	public void menu() {
		
	}
	
	/**
	 * 현재서버를 proxy로 RestServer에 요청을 보낸다.
	 * 응답 data를 그대로 client에게 다시 응답한다.
	 * 
	 * @return
	 * @throws IOException 
	 */
	@GetMapping(
			value = "/selectMenuList.do",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE
		)
	@ResponseBody
	public String selectMenuList() throws IOException {
		try {
			//1.rest server요청
			String menuUrl = "http://localhost:10000/springboot/menus";
			URL url = new URL(menuUrl);
			InputStream is = url.openStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "utf-8"));
			
			//2. 응답메세지 : 자바변수에 기록
			String data = "";
			StringBuilder sb = new StringBuilder();
			while((data = br.readLine()) != null) {
				sb.append(data);
			}
			log.debug("응답 json = {}", sb.toString());
			
			//3. client에 전송
			return sb.toString();
		} catch (Exception e) {
			log.error("menu 전체 조회 오류!", e);
			throw e;
		}
	}
	
	
}
