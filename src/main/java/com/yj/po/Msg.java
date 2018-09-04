package com.yj.po;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回类
 * 
 * @author yj
 *
 */
public class Msg {

	private int code;// 表示状态（0：表示失败 1：表示成功）
	private String msg;// 表示返回信息
	//用户返回给浏览器的数据
	private Map<String, Object> extend = new HashMap<String, Object>();

	public static Msg success() {
		Msg result = new Msg();
		result.setCode(1);
		result.setMsg("处理成功！");
		return result;
	}
	
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(0);
		result.setMsg("处理失败！");
		return result;
	}
	
	public Msg add(String key, Object value) {
		this.getExtend().put(key, value);
		return this;
	}
	
	
	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
