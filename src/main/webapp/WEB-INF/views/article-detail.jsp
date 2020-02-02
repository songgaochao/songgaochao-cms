<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${article.title }</title>
<link href="/public/css/bootstrap.min.css" rel="stylesheet">
<link href="/public/css/index.css" rel="stylesheet">
</head>
<body>
	<div class="header">
		<ul class="nav">
			<li class="nav-item" style="margin-left: 12px;">
				<a	class="navbar-brand" href="#"> 
					<img src="https://v4.bootcss.com/docs/4.3/assets/brand/bootstrap-solid.svg"	width="30" height="30" alt="">
				</a>
			</li>
			<li class="nav-item"><a class="nav-link active" href="/">首页</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">个人中心</a></li>
			<li class="nav-item"><a class="nav-link" href="#">登录</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#"
				tabindex="-1" aria-disabled="true">退出</a></li>
		</ul>
	</div>
	<div class="container-fluid" style="margin-top: 6px;">
		<div class="row offset-1">
			<div class="col-6">
				<h1>${article.title }</h1>
				<h3 style="color: #777;">${article.nickname }    发布时间：<fmt:formatDate value="${article.created }" pattern="yyyy-MM-dd日"/></h3>
				<div>
					<div class="article-content">
						${article.content }
					</div>
				</div>
				
				<div>
					<jsp:include page="./comment/postcomment.jsp"></jsp:include>
				
				</div>
				<div>
				
					<jsp:include page="./comment/commentlist.jsp"></jsp:include>
				
				</div>
			</div>
			
			<div class="col-3">
				<div class="right">
					<div>相关文章</div>
					<ul class="list-unstyled">
						<c:forEach items="${relArticelList }" var="item">
								<li class="media">
								<a href="/article/detail/${item.id }.html" target="_blank">
									<img src="${item.picture}"style="height: 72px; width: 72px;" class="mr-3" alt="...">							
										<div class="media-body">
											<h5 class="mt-0 mb-1">${item.title }</h5>
								</a>
									</div></li>
						</c:forEach>
						
						
						
					</ul>
				</div>
			</div>

		</div>
		
	</div>
	<script src="/public/js/jquery.min.1.12.4.js"></script>
	<script src="/public/js/bootstrap.min.js"></script>
</body>
</html>