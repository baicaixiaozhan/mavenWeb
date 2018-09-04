package com.yj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yj.po.Dept;
import com.yj.po.Msg;
import com.yj.serivce.DeptService;

/**
 * 部门信息的处理类
 * @author yj
 *
 */
@Controller
public class DeptController {

	//依赖注入
	@Autowired
	private DeptService deptService; 
	
	/**
	 * 查询所有部门信息
	 */
	@RequestMapping("/selectdepts")
	@ResponseBody
	public Msg selectDepts() {
		List<Dept> list = deptService.getDepts();
		return Msg.success().add("selectdepts", list);
	}
}
