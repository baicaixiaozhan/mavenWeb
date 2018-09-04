package com.yj.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.yj.po.Emp;

/**
 * ≤‚ ‘controller
 * 
 * @author yj
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "classpath:springmvc-config.xml" })
public class serviceTest {

	@Autowired
	WebApplicationContext context;
	//
	MockMvc mockMvc;

	@Before
	public void init() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void MockMvcTest() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/customerList").param("pn", "2")).andReturn();
		
		MockHttpServletRequest request = result.getRequest();
		
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		
		
		System.out.println(pi.getPageNum());
		System.out.println(pi.getPages());
		System.out.println(pi.getTotal());
		
		List<Emp> list = pi.getList();
		for (Emp emp : list) {
			System.out.println("ID£∫"+emp.getEmpId()+"==>name£∫"+emp.getEmpName());
		}
		//“≥¬Î
		pi.getNavigatepageNums();
	}

}
