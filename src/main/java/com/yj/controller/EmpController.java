package com.yj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yj.po.Emp;
import com.yj.po.Msg;
import com.yj.serivce.EmpService;

@Controller
public class EmpController {

	// 依赖注入
	@Autowired
	private EmpService empService;
	
	
	/**
	 * 删除数据方法
	 */
	@ResponseBody
	@RequestMapping(value="/emps/{id}", method = RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("id") Integer id) {
		empService.getDelete(id);
		return Msg.success();
	}
	
	
	/**
	 * 更新数据方法
	 * @param emp
	 * @return
	 */
	@RequestMapping(value="/emps/{empId}" , method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Emp emp) {
		empService.getUpdate(emp);
		return Msg.success();
	}
	
	/**
	 * 查询客户信息(编辑更新操作)
	 */
	@RequestMapping(value="/emps/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Emp emp = empService.getEmp(id);
		return Msg.success().add("emp", emp);
	}

	/**
	 * 查询数据 通过ajax返回数据
	 */
	@RequestMapping("/customerList")
	@ResponseBody
	public Msg custList(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 分页：
		// 引入pagehelper包依赖
		// 使用时 引用即可
		PageHelper.startPage(pn, 8);
		// startPage紧跟查询
		List<Emp> custList = empService.getAll();
		// 用PageInfo封装查询数据，5：表示来连续显示的页数
		PageInfo page = new PageInfo(custList, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * 客户添加保存
	 */
	@RequestMapping(value="/empsave", method = RequestMethod.POST)
	@ResponseBody
	public Msg empsave(@Valid Emp emp, BindingResult result) {
		Map<String, Object> map = new HashMap<>();
		if(result.hasErrors()) {
			List<FieldError> list = result.getFieldErrors();
			for (FieldError fieldError : list) {
				System.out.println(fieldError.getField());
				System.out.println(fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("java_fiemsg", map);
		}else {
			empService.getEmpSave(emp);
			return Msg.success();
		}
	}
	
	/**
	 * 判断客户姓名是否可用
	 * 注：
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("empName") String empName) {
		//先判断用户名是否合法
		//获取合法的正则表达式(Java中不需要以“/”开头、结尾)
		String reEmpName = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,6})";
		if(!empName.matches(reEmpName)) {
			return Msg.fail().add("java_msg", "用户名不合法(中文2-6位，英文3-16位)");
		}
		boolean b = empService.checkUser(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	
	

	/**
	 * 查询客户数据（分页）
	 */
	// @RequestMapping(value="/customerList")
	/*public String customerList(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		// 分页：
		// 引入pagehelper包依赖
		// 使用时 引用即可
		PageHelper.startPage(pn, 8);
		// startPage紧跟查询
		List<Emp> custList = empServie.getAll();
		// 用PageInfo封装查询数据，5：表示来连续显示的页数
		PageInfo page = new PageInfo(custList, 5);

		model.addAttribute("pageInfo", page);
		return "customer";
	}*/

}
