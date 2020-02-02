<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="${pageContext.request.contextPath}/commentlist?comment" method="post">
					<table>
						<tr>
							<td>
							<input type="text" name="content" style="width: 380px;height: 60px" placeholder="评论内容">
							</td>
							<td>
							<input type="submit" value="发布" style="height: 60px;width: 60px">
							</td>
						</tr>
					</table>
				</form>
</body>
</html>