package com.kh.spring.menu.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.menu.model.vo.Menu;

public interface Menuservice {

	List<Menu> selectMenuList();

	List<Menu> selectMenuListByTypeAndTaste(Map<String, Object> param);

	int insertMenu(Menu menu);

	Menu selectOneMenu(String id);

	int updateMenu(Menu menu);

	int deleteMenu(String id);

}
