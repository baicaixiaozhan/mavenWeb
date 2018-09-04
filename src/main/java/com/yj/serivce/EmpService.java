package com.yj.serivce;

import java.util.List;

import com.yj.po.Emp;

public interface EmpService {

	//查询数据
	public List<Emp> getAll();
	//客户添加保存
	public void getEmpSave(Emp emp);
	//判断客户姓名是否可用
	public boolean checkUser(String empName);
	//查询客户信息(编辑更新操作)
	public Emp getEmp(Integer id);
	//更新数据方法
	public void getUpdate(Emp emp);
	//删除数据方法
	public void getDelete(Integer id);
	



}
