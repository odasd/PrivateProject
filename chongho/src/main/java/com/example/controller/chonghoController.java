package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.userTableVO;
import com.example.mapper.chonghoMapper;

@Controller
public class chonghoController {
	
	@Autowired
	chonghoMapper mapper;
	
	
	@RequestMapping("/index")
	public void index() {
		
	}
	
	@RequestMapping("/explanation")
	public void explanation() {
		
	}
	
	@RequestMapping("/select")
	public void select() {
		
	}
	
	@RequestMapping("/thanks")
	public void thanks() {
		
	}
	
	@RequestMapping("/admin")
	public void admin(Model model, Criteria cri) {
		cri.setPerPageNum(20);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		
		model.addAttribute("pmm", pm);
		model.addAttribute("cri", cri);
		model.addAttribute("userList", mapper.userList(cri));
		model.addAttribute("testList", mapper.testList());
	}
	
	@RequestMapping("/admin.json")
	@ResponseBody
	public HashMap<String, Object> adminjson(int num) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		HashMap<String,Object> paraMap=new HashMap<String,Object>();
		paraMap.put("num", num);
		
		map.put("pointList", mapper.pointList(paraMap));
		
		return map;
	}
	
	@RequestMapping(value="/userInsert", method=RequestMethod.POST)
	public void userInsert(userTableVO vo) {
		mapper.userInsert(vo);
	}
	
	@RequestMapping(value="/maxNum")
	@ResponseBody
	public HashMap<String, Object> maxNum() {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("maxNum", mapper.maxNum());
		
		return map;
	}
	
	@RequestMapping(value="/pickInsert.js", method=RequestMethod.POST)
	@ResponseBody
	public void pickInsert(userTableVO vo) {
		mapper.pickInsert(vo);
	}
}
