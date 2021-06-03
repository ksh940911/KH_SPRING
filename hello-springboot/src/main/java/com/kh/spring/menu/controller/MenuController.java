package com.kh.spring.menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.spring.menu.model.service.Menuservice;
import com.kh.spring.menu.model.vo.Menu;

import lombok.extern.slf4j.Slf4j;

/**
 * @RestController = @Controller + @ResponseBody
 * 모든 handler는 @ResponseBody로 처리된다.
 *
 */
@RestController
@Slf4j
public class MenuController {

	@Autowired
	private Menuservice menuService;
	
	@GetMapping("/menus")
	public List<Menu> menus(HttpServletResponse response){
		try {
			//1. 업무로직
			List<Menu> list = menuService.selectMenuList();
			log.debug("list = {}", list);
			//2. 리턴하면 @ResponseBody에 의해서 json변환후, 응답출력 처리
			
			//3. 응답헤더에 Access-Controll-Allow-Origin : 특정 origin
			//response.setHeader(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, "*");
			return list;
		} catch (Exception e) {
			log.error("/menus 오류!", e);
			throw e;
		}
	}
	
	/**
	 * @PathVariable 경로변수
	 * 
	 * @return
	 */
	@GetMapping("/menus/{type}/{taste}")
	public List<Menu> menuByType(@PathVariable String type, @PathVariable String taste){
		try {
			log.debug("type = {}, taste = {}", type, taste);
			Map<String, Object> param = new HashMap<>();
			param.put("type", type);
			param.put("taste", taste);
			
			List<Menu> list = menuService.selectMenuListByTypeAndTaste(param);
			log.debug("list = {}", list);
			
			return list;
		} catch (Exception e) {
			log.error("/menus/type 오류!", e);
			throw e;
		}
	}
	
	/**
	 * @RequestBody 요청메세지의 body에 작성된 json문자열을 java객체로 변환
	 * 
	 * @param menu
	 * @return
	 */
	@PostMapping("/menu")
	public Map<String, Object> insertMenu(@RequestBody Menu menu){
		try {
			log.debug("menu = {}", menu);
			int result = menuService.insertMenu(menu);
			Map<String, Object> map = new HashMap<>();
			map.put("msg", "메뉴 등록 성공!");
			return map;
		} catch (Exception e) {
			log.error("메뉴 등록 실패!", e);
			throw e;
		}
	}
	
//	@GetMapping("/menu/{id}")
//	public Menu selectOneMenu(@PathVariable String id) {
//		try {
//			log.debug("id = {}", id);
//			Menu menu = menuService.selectOneMenu(id);
//			return menu;
//		} catch (Exception e) {
//			log.error("메뉴 조회 오류 : " + id, e);
//			throw e;
//		}
//	}
	
	/**
	 * ResponseEntity를 통해서 
	 * 존재하지 않는 메뉴번호를 요청한 경우 
	 * 404 status code를 응답.
	 * 
	 * @param id
	 * @return
	 */
	@GetMapping("/menu/{id}")
	public ResponseEntity<Menu> selectOneMenu(@PathVariable String id) {
		try {
			log.debug("id = {}", id);
			Menu menu = menuService.selectOneMenu(id);
			if(menu != null) {
				return ResponseEntity
						.ok()
						.body(menu);
			}
			else {
				return ResponseEntity
						.notFound()
						.build();
			}
		} catch (Exception e) {
			log.error("메뉴 조회 오류 : " + id, e);
			throw e;
		}
	}
	
	
	@PutMapping("/menu/{id}")
	public Map<String, Object> updateMenu(@RequestBody Menu menu){
		try {
			log.debug("menu = {}", menu);
			int result = menuService.updateMenu(menu);
			Map<String, Object> map = new HashMap<>();
			map.put("msg", "메뉴 수정 성공!");
			return map;
		} catch (Exception e) {
			log.error("메뉴 수정 실패!", e);
			throw e;
		}
	}
	
	/**
	 * ResponseEntity
	 * 1. builder패턴
	 * 2. 생성자방식
	 * 
	 * @param id
	 * @return
	 */
	@DeleteMapping("/menu/{id}")
	public ResponseEntity<?> deleteMenu(@PathVariable String id){
		try {
			log.debug("id = {}", id);
			int result = menuService.deleteMenu(id);
			if(result > 0) {
				Map<String, Object> map = new HashMap<>();
				map.put("msg", "메뉴 삭제 성공!");
				return new ResponseEntity<>(map, HttpStatus.OK);				
			}
			else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			log.error("메뉴 삭제 실패!", e);
			throw e;
		}
	}
	
}




