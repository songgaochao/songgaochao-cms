<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/public/css/bootstrap.css"/>

<link href="/public/css/bootstrap.min.css" rel="stylesheet">
<link href="/public/css/index.css" rel="stylesheet">

<script type="text/javascript" src="/public/js/checkbox.js"></script>
<script type="text/javascript">
function goPage(page){
	location="${pageContext.request.contextPath}/commentlist?page="+page;
}

</script>
</head>

<body>
	<table  class="table table-bordered">
		
		<c:forEach items="${info.list }" var="item">
			<tr>
				<td>${item.userId}
				${item.created }:<br>
				${item.content }</td>
			</tr>

		</c:forEach>
		<tr>
		<td colspan="100">
			<jsp:include page="/WEB-INF/views/common/pages02.jsp"></jsp:include>
			<jsp:include page="../common/page.jsp"></jsp:include>
		</td>
		</tr>
	</table>
	
</body>

</html>