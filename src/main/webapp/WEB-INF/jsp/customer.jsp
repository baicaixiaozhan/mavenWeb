<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>customer</title>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
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
		<button class="btn btn-success">新增</button>
		<button class="btn btn-danger">删除</button>
	</div>

	<!--表格数据展示-->
	<div class="col-md-10 col-md-offset-1 table-responsive">
		<table class="table table-striped">
			<tr>
				<th><input type="checkbox" name="checkbox" value="1"></th>
				<th>ID</th>
				<th>姓名</th>
				<th>性别</th>
				<th>邮箱</th>
				<th>部门</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${pageInfo.list}" var="emp">
				<tr>
					<th><input type="checkbox" name="checkbox" value="1">
					</th>
					<th>${emp.empId }</th>
					<th>${emp.empName }</th>
					<th>${emp.empSex }</th>
					<th>${emp.empEmail }</th>
					<th>${emp.dept.deptName }</th>
					<th>
						<button class="btn btn-success btn-xs">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							修改
						</button>
						<button class="btn btn-danger btn-xs">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
							删除
						</button>
					</th>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!--页码-->
	<div class="rows">

		<!--页码文字信息-->
		<div class="col-md-3 col-md-offset-3">第${pageInfo.pageNum }页&nbsp;&nbsp;共计${pageInfo.pages }页
			&nbsp;&nbsp;共有${pageInfo.total }条数据</div>

		<!--页码条信息-->
		<div>
			<nav aria-label="Page navigation">
			<ul class="pagination">
				<li><a
					href="${pageContext.request.contextPath }/customerList?pn=1"
					aria-label="Previous"> 首页 </a></li>
				<c:if test="${pageInfo.hasPreviousPage }">
					<li><a href="${pageContext.request.contextPath }/customerList?pn=${pageInfo.pageNum-1 }" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${page_Num == pageInfo.pageNum }">
						<li class="active"><a href="#">${page_Num }</a></li>
					</c:if>
					<c:if test="${page_Num != pageInfo.pageNum }">
						<li><a
							href="${pageContext.request.contextPath }/customerList?pn=${page_Num }">${page_Num }</a></li>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageInfo.hasNextPage }">
				<li><a href="${pageContext.request.contextPath }/customerList?pn=${pageInfo.pageNum+1 }" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath }/customerList?pn=${pageInfo.pages }" aria-label="Previous"> 尾页 </a></li>
			</ul>
			</nav>
		</div>
	</div>

</body>
</html>