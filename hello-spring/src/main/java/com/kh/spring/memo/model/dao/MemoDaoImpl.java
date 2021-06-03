package com.kh.spring.memo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.memo.model.vo.Memo;

@Repository
public class MemoDaoImpl implements MemoDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int insertMemo(Memo memo) {
		return session.insert("memo.insertMemo", memo);
	}

	@Override
	public List<Memo> selectMemoList() {
		return session.selectList("memo.selectMemoList");
	}
	
	
	
}
