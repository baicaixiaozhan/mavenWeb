package com.yj.serivce.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yj.dao.DeptMapper;
import com.yj.po.Dept;
import com.yj.serivce.DeptService;

/**
 * 部门信息处理接口的实现类
 * @author yj
 *
 */
@Service("deptService")
public class DeptServiceImpl implements DeptService {

	//依赖注入
	@Autowired
	private DeptMapper detpMapper;
	
	@Override
	public List<Dept> getDepts() {
		// TODO Auto-generated method stub
		List<Dept> list = detpMapper.selectByExample(null);
		return list;
	}

	
}
