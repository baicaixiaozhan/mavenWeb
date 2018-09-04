package com.yj.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yj.dao.DeptMapper;
import com.yj.dao.EmpMapper;
import com.yj.po.Dept;
import com.yj.po.DeptExample;
import com.yj.po.Emp;

/**
 * ����dao�� ����spring�ṩ�ĵ�Ԫ���� ����@springTestģ�� ����@ContextConfiguration
 * 
 * @author yj
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class mapperTest {

	@Autowired
	DeptMapper deptMapper;

	@Autowired
	EmpMapper empMapper;

	@Autowired
	SqlSession sqlSession;

	@Test
	public void testDao() {
		// System.out.println(deptMapper);
		// ������ɾ�Ĳ�
		// ��
		// deptMapper.insertSelective(new Dept(null, "��Ӫ��"));
		// ɾ
		// deptMapper.deleteByPrimaryKey(4);
		// ��
		// deptMapper.updateByPrimaryKey();

		// System.out.println(empMapper);

		// empMapper.selectByPrimaryKey(1);


		// �������루UUID����ʹ�ÿ�������������sqlSession
		EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);
		for (int i = 0; i < 200; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5) + i;
			/*mapper.insertSelective(new Emp(null, uid, "男", uid + "@15123.com", 1));*/
		}
		System.out.println("运行成功");
		
		//����ɾ��
		//empMapper.deleteByPrimaryKey(3);
		
		//���Ը���
		/*Emp emp = empMapper.selectByPrimaryKey(1);
		emp.setEmpName("����");
		empMapper.updateByPrimaryKey(emp);*/
		
		//���Ը���
		/*Emp emp = new Emp();
		emp.setEmpId(1);
		emp.setEmpName("Сѩ");
		emp.setEmpSex("Ů");
		
		empMapper.updateByPrimaryKeySelective(emp);
		
		System.out.println("���гɹ�");*/
	}

}
