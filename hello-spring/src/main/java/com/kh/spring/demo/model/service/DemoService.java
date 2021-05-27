package com.kh.spring.demo.model.service;

import java.util.List;

import com.kh.spring.demo.model.vo.Dev;

public interface DemoService {

	int insertDev(Dev dev);

	List<Dev> selectDevList();

	Dev selectOneDev(int no);

	int updateDev(Dev dev);

	int deleteDev(int no);

}
