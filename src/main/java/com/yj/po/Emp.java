package com.yj.po;

import javax.validation.constraints.Pattern;

public class Emp {
	private Integer empId;
	
	//JSR303标准 对数据进行验证 
	@Pattern(regexp = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,6})", message = "用户名不合法(中文2-6位，英文3-16位)(JSR303标准 数据校验)")
	private String empName;

	private String empSex;
	
	//JSR303标准 对数据进行验证 
	@Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$", message="邮箱输入不合法(JSR303标准 数据校验)")
	private String empEmail;

	private Integer dId;

	private Dept dept;

	/*public Emp(Integer empId, String empName, String empSex, String empEmail, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.empSex = empSex;
		this.empEmail = empEmail;
		this.dId = dId;
	}

	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}*/

	
	public Dept getDept() {
		return dept;
	}

	@Override
	public String toString() {
		return "Emp [empId=" + empId + ", empName=" + empName + ", empSex=" + empSex + ", empEmail=" + empEmail
				+ ", dId=" + dId + ", dept=" + dept + "]";
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName == null ? null : empName.trim();
	}

	public String getEmpSex() {
		return empSex;
	}

	public void setEmpSex(String empSex) {
		this.empSex = empSex == null ? null : empSex.trim();
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail == null ? null : empEmail.trim();
	}

	public Integer getdId() {
		return dId;
	}

	public void setdId(Integer dId) {
		this.dId = dId;
	}
}