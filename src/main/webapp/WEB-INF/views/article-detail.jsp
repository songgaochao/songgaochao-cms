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
				  <div id="myCarousel" class="carousel slide">
						  <ol class="carousel-indicators">
						    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						    <li data-target="#myCarousel" data-slide-to="1"></li>
						    <li data-target="#myCarousel" data-slide-to="2"></li>
						  </ol>
						  <!-- Carousel items -->
						  <div class="carousel-inner">
						    <div class="active item">
						    <img src="${article.picture }" style="height: 300px; width: 600px;" class="mr-3" alt="...">
							</div>
						    <div class="item">..</div>
						    <div class="item">…</div>
						  </div>
						  <!-- Carousel nav -->
						  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
						  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
						</div>
				  </div>
				 			
				<div>
				<button style="border: none;color: red"  onclick="collect(1)">★ (已收藏)</button>
				  <button style="border: none;"  onclick="collect(0)">☆ (未收藏)</button>
				
					<div class="article-content">
					</div>
				</div>
				<hr style="height :10px;">
				<form id="commentForm">
				
				<c:if test="${userInfo==null }">
					<div>
						<span><a href="/user/login">请登录后，发表评论...</a></span>
					</div>
				</c:if>
				<c:if test="${userInfo!=null }">
					<div class="row" style="margin-top: 20px;">
							<input type="hidden" id="articleId" name="articleId" value="${article.id }">
							<div class="col-8 form-group">
							    <!-- <label for="exampleFormControlTextarea1">评论</label> -->
							    <textarea class="form-control" id="content" name="content" rows="2" placeholder="请输入评论" style="height: 60px"></textarea>
							</div>
							<div class="col-4">
								<button type="button" class="" onclick="submitComment();" style="height: 60px;width: 60px">发布</button>
							</div>
					</div>
				</c:if>
				<div>
					<c:forEach items="${pageInfo.list }" var="item">
						<div class="media">
						  <img src="${item.headimg }" class="mr-3" alt="..." style="width: 32px;">
						  <div class="media-body">
						    <h5 class="mt-0">${item.nickname } <fmt:formatDate value="${item.created }" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></h5>
						     ${item.content }
						  </div>
						</div>
					</c:forEach>
				</div>
					
					<div>
					 <jsp:include page="./common/page.jsp"></jsp:include>
					</div>
			</div>
			
			<div class="col-3">
				<div class="right" style="margin-top: 40px">
					<div class="card-header" style="text-align: center;">相关文章</div
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
				<div class="right" style="margin-top: 30px">
					<div class="card-header" style="text-align: center;">热文推荐</div
					<ul class="list-unstyled">
						<c:forEach items="${hotpageInfo.list }" var="item">
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
		<div class="card-header" style="text-align: center;">
		<tr>
		<td><font size="2" color="#2F4F4F">本项目是大数据学院专高一，专高二教学练习项目，训练Maven + Edipse + SSM + Bootstrap集成方式进行项目开发管理 </font></td>		
		</tr><br>
		<hr style="margin-top: 1px" >
		<tr>
			<td>豪哥    mailto:<font size="2" color="blue">44287015@qq.com </font></td>
		</tr>
		
		</div>
	</div>
	<script src="/public/js/jquery.min.1.12.4.js"></script>
	<script src="/public/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function submitComment(){
		var formData = $("#commentForm").serialize();
		console.log(formData);
		$.post('/comment/add',formData,function(res){
			if(res.result){
				console.log("评论成功");
				var href = location.href;
				location.href=href.substring(0,href.indexOf('?'));
			}else if(res.errorCode==10000){
				alert(res.message);
				location.href="/user/login"
			}else{
				console.log("评论失败");
			}
		})
	}
	
	function gotoPage(pageNo){
		var href = location.href;
		href = href.substring(0,href.indexOf('?'));
		console.log(href);
		location.href=href+'?pageNum='+pageNo;
	}
	
	function collect(flag) {
		var url =window.location.href;
		var text ='${article.title}';
		if(flag==0){//收藏
			$.post("/insert",{url:url,text:text},function(result){
			 	if(result){
			 		alert("收藏成功");
			 		location.reload();//刷新当前页面
			 		
			 	}else{
			 		alert("收藏失败")
			 	}
			})
		}else{//取消收藏
			var id='${collect.id}';
	        $.post("/deletes",{id:id},function(result){
	        	if(result){
			 		alert("取消收藏成功")
			 			location.reload();	//刷新当前页面
			 	}else{
			 		alert("取消收藏失败")
			 	}
			})	
		}
		
		
		
	}
	</script>
</body>
</html>