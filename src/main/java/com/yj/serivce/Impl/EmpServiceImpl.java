package com.yj.serivce.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.dao.EmpMapper;
import com.yj.po.Emp;
import com.yj.po.EmpExample;
import com.yj.po.EmpExample.Criteria;
import com.yj.serivce.EmpService;


@Service("empService")
public class EmpServiceImpl implements EmpService {

	//依赖注入
	@Autowired
	private EmpMapper empMapper;
	
	/**
	 * 查询数据
	 */
	@Override
	public List<Emp> getAll() {
		// TODO Auto-generated method stub
		//针对前端页面排序混乱，运用mybatis逆向工程中的查询语句对此进行排序
		EmpExample example = new EmpExample();
		example.setOrderByClause("emp_id");
		return empMapper.selectByExampleWithDept(example);
	}

	/**
	 * 客户添加保存
	 */
	@Override
	public void getEmpSave(Emp emp) {
		// TODO Auto-generated method stub
		empMapper.insertSelective(emp);
	}

	/**
	 * 判断客户姓名是否可用
	 */
	@Override
	public boolean checkUser(String empName) {
		EmpExample example = new EmpExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = empMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 查询客户信息(编辑更新操作)
	 */
	public Emp getEmp(Integer id) {
		// TODO Auto-generated method stub
		Emp emp = empMapper.selectByPrimaryKey(id);
		return emp;
	}

	/**
	 * 更新数据方法
	 */
	@Override
	public void getUpdate(Emp emp) {
		// TODO Auto-generated method stub
		empMapper.updateByPrimaryKeySelective(emp);
	}

	/**
	 * 删除数据方法实现
	 */
	@Override
	public void getDelete(Integer id) {
		// TODO Auto-generated method stub
		empMapper.deleteByPrimaryKey(id);
	}

	

}
