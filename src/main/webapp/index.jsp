<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>customer</title>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	<!-- 客户编辑-模态框 -->
	<!-- Modal -->
	<div class="modal fade" id="empupdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">客户编辑</h4>
				</div>
				<div class="modal-body">
					<!-- 客户数据编辑表单 start -->
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">客户姓名</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update"></p>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="empSex" id="empSex1_update" value="男" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="empSex" id="empSex2_update" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="empEmail"
									id="empEmail_update"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-3">
								<select class="form-control" name="dId" id="dId_update"></select>
							</div>
						</div>

					</form>
					<!-- 客户数据编辑表单 end -->
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
					<button class="btn btn-primary" id="emp_update">更新</button>
				</div>
			</div>
		</div>
	</div>





	<!-- 客户新增-模态框 -->
	<!-- Modal -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">客户添加</h4>
				</div>
				<div class="modal-body">
					<!-- 客户数据添加表单 start -->
					<form class="form-horizontal">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">客户姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="empName"
									id="empName" placeholder="姓名"> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">性别</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="empSex" id="empSex1" value="男" checked="checked">
									男
								</label> <label class="radio-inline"> <input type="radio"
									name="empSex" id="empSex2" value="女"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" name="empEmail"
									id="empEmail" placeholder="Email@15123.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">部门</label>
							<div class="col-sm-3">
								<select class="form-control" name="dId" id="dId"></select>
							</div>
						</div>

					</form>
					<!-- 客户数据添加表单 end -->
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal">关闭</button>
					<button class="btn btn-primary" id="emp_save">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!--页头-->
	<div class="page-header">
		<h1 style="margin-left: 50px;">
			欢迎使用CIMS客户管理系统 <small style="margin-left: 600px;"> <span
				class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;
				用户名&nbsp;/&nbsp;<a href="###" style="text-decoration: none;">退出</a>
			</small>
		</h1>
	</div>

	<!--两个按钮-->
	<div class="col-md-9 col-md-offset-9">
		<button class="btn btn-success" id="emp_Add">新增</button>
		<button class="btn btn-danger">删除</button>
	</div>

	<!--表格数据展示-->
	<div class="col-md-10 col-md-offset-1 table-responsive">
		<table class="table table-striped" id="cust_table">
			<thead>
				<tr>
					<th><input type="checkbox" name="checkbox" value="1"></th>
					<th>ID</th>
					<th>姓名</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>部门</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
	<!--页码-->
	<div class="rows">

		<!--页码文字信息-->
		<div class="col-md-3 col-md-offset-3" id="page_num"></div>

		<!--页码条信息-->
		<div id="page_nav"></div>
	</div>

	<!-- ------------------------------js代码 start------------------------------------ -->
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	
	
		//定义全局变量
		var pageNum;
	
		$(function() {
			to_page(1);
		});

		//页面跳转
		function to_page(pn) {
			$.ajax({
				url : "${pageContext.request.contextPath}/customerList",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//解析显示客户数据
					build_cust_table(result);
					//解析显示页码文字信息
					build_page_num(result);
					//解析显示页码条信息
					build_page_nav(result);
				}

			});
		}

		//解析显示客户数据
		function build_cust_table(result) {
			//清空table数据(初始化)
			$("#cust_table tbody").empty();
			var emps = result.extend.pageInfo.list;
			$.each(emps, function(index, item) {

				var checkbox = $("<td></td>").append("#");
				var empId = $("<td></td>").append(item.empId);
				var empName = $("<td></td>").append(item.empName);
				var empSex = $("<td></td>").append(item.empSex);
				var empEmail = $("<td></td>").append(item.empEmail);
				var deptName = $("<td></td>").append(item.dept.deptName);
				var Modify_but = $("<button></button>").addClass(
						"btn btn-success btn-xs Modify_but").append(
						$("<span></span>").addClass(
								"glyphicon glyphicon-pencil")).append(" 修改");
				//给编辑按钮添加员工id
				Modify_but.attr("but_id",item.empId);
				var Delete_but = $("<button></button>").addClass(
						"btn btn-danger btn-xs Delete_but").append(
						$("<span></span>")
								.addClass("glyphicon glyphicon-trash")).append(
						" 删除");
				//给删除按钮添加员工id
				Delete_but.attr("del_but",item.empId);
				var But = $("<td></td>").append(Modify_but).append(" ").append(
						Delete_but);

				$("<tr></tr>").append(checkbox).append(empId).append(empName)
						.append(empSex).append(empEmail).append(deptName)
						.append(But).appendTo("#cust_table tbody");
			});
		}

		//解析显示页码文字信息
		function build_page_num(result) {
			//清空页码文字数据(初始化)
			$("#page_num").empty();
			$("#page_num").append(
					"第" + result.extend.pageInfo.pageNum + "页&nbsp;&nbsp;共计"
							+ result.extend.pageInfo.pages + "页&nbsp;&nbsp;共有"
							+ result.extend.pageInfo.total + "条数据");
			pageNum = result.extend.pageInfo.pageNum;
		}

		//解析显示页码条信息
		function build_page_nav(result) {
			//清空页码条数据(初始化)
			$("#page_nav").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstli = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var preli = $("<li></li>").append($("<a></a>").append("&laquo;"));
			//首页时，显示禁止单击
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstli.addClass("disabled");
				preli.addClass("disabled");
			} else {
				//首页、上一页单击事件
				firstli.click(function() {
					to_page(1);
				});
				preli.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}

			var nextli = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var lastli = $("<li></li>").append(
					$("<a></a>").append("尾页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextli.addClass("disabled");
				lastli.addClass("disabled");
			} else {
				nextli.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastli.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}
			//首页，上一页
			ul.append(firstli).append(preli);
			//遍历页码数
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numli = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numli.addClass("active");
				}
				numli.click(function() {
					to_page(item);
				});
				ul.append(numli);
			});
			//下一页，尾页
			ul.append(nextli).append(lastli);

			var nav = $("<nav></nav>").append(ul);
			nav.appendTo("#page_nav");
		}
		
		//清空模态框表单里的数据和样式(初始化)
		function empty_empAddModal(Cid){
			/* $("#empName").val("");
			$("#empEmail").val(""); */
			//清除表单数据
			$(Cid)[0].reset();
			//清除表单样式
			$(Cid).find("*").removeClass("has-success has-error");
			$(Cid).find(".help-block").text("");
			/* //清除下拉列表(初始化)
			$(Cid+" select").empty(); */
		}

		//点击客户添加模态框
		$("#emp_Add").click(function() {
			//清空模态框数据(初始化)
			empty_empAddModal("#empAddModal form");

			//使用Ajax请求获取部门名称信息
			selectdepts("#dId");
			//弹出添加模态框
			$("#empAddModal").modal({
				backdrop : "static"
			});
		});
		//使用Ajax请求获取部门名称信息
		function selectdepts(Cid) {
			//清除下拉列表(初始化)
			$(Cid).empty();
			$.ajax({
				url : "${pageContext.request.contextPath}/selectdepts",
				type : "GET",
				success : function(result) {
					//console.log(result);
					$.each(result.extend.selectdepts, function(index, item) {
						var depts = $("<option></option>")
								.append(item.deptName).attr("value",
										item.deptId);
						depts.appendTo(Cid);
					});

				}
			});
		}

		//判断客户姓名是否可用
		$("#empName").change(function() {
			var empName = $("#empName").val();
			//通过ajax请求判断客户姓名是否可用
			$.ajax({
				url : "${pageContext.request.contextPath}/checkuser",
				data : "empName=" + empName,
				type : "POST",
				success : function(result) {
					if (result.code == 1) {
						check_effect("#empName", "success", "用户名可用");
						$("#empName").attr("ajax-va","success");
					} else {
						check_effect("#empName", "error", result.extend.java_msg);
						$("#empName").attr("ajax-va","error");
					}
				}

			});
		});

		//模态框保存按钮添加单击事件
		$("#emp_save").click(function() {

			//校验表单数据
			if (!check_form()) {
				return false;
			};
			//通过Ajax请求判断用户名是否可用
			if($("#empName").attr("ajax-va") == "error"){
				return false;				
			}
			//通过Ajax请求获取表单数据
			$.ajax({
				url : "${pageContext.request.contextPath}/empsave",
				type : "POST",
				data : $("#empAddModal form").serialize(),
				success : function(result) {
					//通过JSR303标准 校验数据成功后保存数据
					if(result.code == 1){
						//alert(result.msg);
						//点击保存关闭模态框
						$("#empAddModal").modal('hide');
						//自动跳转至当前添加的数据的页码
						//方法一：手动传入一个较大的数字(如：9999) 注：数字不能过大，否则会报错(Failed to bind request element: org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type 'java.lang.String' to required type 'java.lang.Integer'; nested exception is java.lang.NumberFormatException: For input string: "99999999999")
						//方法二：把总数据条数传入(result.extend.pageInfo.total)
						to_page(9999);
					}else{
						//通过JSR303标准 校验数据(后台数据验证)
						if(undefined != result.extend.java_fiemsg.empName){
							check_effect("#empName", "error", result.extend.java_fiemsg.empName);
						}
						if(undefined != result.extend.java_fiemsg.empEmail){
							check_effect("#empEmail", "error", result.extend.java_fiemsg.empEmail);
						}
						
					}
					
					
				}
			});
		});

		//校验表单数据
		function check_form() {
			//获取、校验表单中姓名
			var empName = $("#empName").val();
			var reEmpName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,6})/;
			if (!reEmpName.test(empName)) {
				check_effect("#empName", "error", "姓名输入不合法");
				return false;
			} else {
				check_effect("#empName", "success", "");
			}
			//获取、校验邮箱
			var empEmail = $("#empEmail").val();
			var reEmpEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!reEmpEmail.test(empEmail)) {
				check_effect("#empEmail", "error", "邮箱输入不合法");
				return false;
			} else {
				check_effect("#empEmail", "success", "");
			}
			return true;
		}

		//bootstrap校验效果
		function check_effect(Cid, state, msg) {
			//清除样式(初始化)
			$(Cid).parent().removeClass("has-success has-error");
			$(Cid).next("span").text("");

			if ("success" == state) {
				$(Cid).parent().addClass("has-success");
				$(Cid).next("span").text(msg);
			} else if ("error" == state) {
				$(Cid).parent().addClass("has-error");
				$(Cid).next("span").text(msg);
			}
		}
		
		//绑定编辑模态框单击事件
		$(document).on("click",".Modify_but",function(){
			//清除样式(初始化)
			$("#empEmail_update").parent().removeClass("has-success has-error");
			$("#empEmail_update").next("span").text("");
			
			//获取部门信息
			selectdepts("#dId_update");
			//获取客户信息
			getEmps($(this).attr("but_id"));
			//点击打开编辑模态框
			$("#emp_update").attr("update_id",$(this).attr("but_id"));
			$("#empupdateModal").modal({
				backdrop : "static"
			});
		});
		
		//获取客户信息
		function getEmps(id){
			$.ajax({
				url:"${pageContext.request.contextPath}/emps/"+id,
				type:"GET",
				success:function(result){
					//获取到emp的数据
					//console.log(result);
					var empDate = result.extend.emp;
					$("#empName_update").text(empDate.empName);
					$("#empEmail_update").val(empDate.empEmail);
					$("#empupdateModal input[name=empSex]").val([empDate.empSex]);
					$("#empupdateModal select").val([empDate.dId]);
				}
			});
		}
		
		
		//点击更新(添加单击事件)，提交更新数据
		$("#emp_update").click(function (){
			// 校验邮箱
			var empEmail = $("#empEmail_update").val();
			var reEmpEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!reEmpEmail.test(empEmail)) {
				check_effect("#empEmail_update", "error", "邮箱输入不合法");
				return false;
			} else {
				check_effect("#empEmail_update", "success", "");
			}
			
			//提交Ajax请求
			$.ajax({
				url:"${pageContext.request.contextPath}/emps/"+$(this).attr("update_id"),
				type:"PUT",
				data:$("#empupdateModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					//1.关闭模态框
					$("#empupdateModal").modal("hide"); 
					
					//2.返回到数据添加的页码
					to_page(pageNum);
				}
			});
			
		});
		
		//给删除按钮添加点击事件
		$(document).on("click",".Delete_but",function(){
			
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			//alert($(this).parents("tr").find("td:eq(2)").text());
		
			if(confirm("确定删除["+empName+"]吗？")){
				$.ajax({
				url:"${pageContext.request.contextPath}/emps/"+$(this).attr("del_but"),
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					//2.返回到数据添加的页码
					to_page(pageNum);
				}
			});
		}
		});
		
		
		
		
		
		
	</script>
	<!-- ------------------------------js代码 end------------------------------------ -->
</body>
</html>