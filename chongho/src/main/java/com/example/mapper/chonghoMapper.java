package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.example.domain.Criteria;
import com.example.domain.userTableVO;

public interface chonghoMapper {
	
	public List<userTableVO> userList(Criteria cri);
	public List<userTableVO> pointList(HashMap<String, Object> map);
	public List<userTableVO> testList();
	public void userInsert(userTableVO vo);
	public void pickInsert(userTableVO vo);
	public int maxNum();
	public int totalCount(Criteria cri);
	
}
