<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/public/css/bootstrap.min.css" rel="stylesheet">
<link href="/public/css/index.css" rel="stylesheet">

<link rel="stylesheet" href="/public/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="/public/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="/public/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="/public/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="/public/kindeditor/plugins/code/prettify.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index3.css"/>
<title>Insert title here</title>
<script type="text/javascript">
function gotoPage(page) {
	location="/article/collects?pageNum="+page;
}

function query(){
	var params = $("#queryForm").serialize();
	reload(params)
}
	function deletes() {
		var ids = getCheckboxIds();
		
		alert(ids);
	}
</script>
</head>
<body>
<form class="form-inline" id="queryForm">
	
	<input type="hidden" id="pageNum" name="pageNum" value="${pageInfo.pageNum }">
</form>

<div style="margin-top: 20px">
	<h3>我的收藏夹</h3>
	<hr style="clear: both;background-color:red;height: 5px"/> 
	<c:forEach items="${pageInfo.list }" var="item">
		<tr>
			<td><font size="4" color="blue">${item.text }</font></td><br>
			<td>
			时间: <fmt:formatDate value="${item.created}" pattern="yyyy-MM-dd HH:mm:ss"/> 
			     <a href="/delete?ids=${item.id }" style="margin-left: 50px" >删除</a>			
			</td>		
		</div>
		<hr>
		</tr>
		
	</c:forEach>
	<tr>
		<td colspan="80">			
			<jsp:include page="../common/page.jsp"></jsp:include>
		</td>
		</tr>
	</div>
</body>
</html>