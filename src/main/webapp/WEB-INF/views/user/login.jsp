<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>杨元庆回应常程离职：联想不会放弃中国手机市场，会寻找时机</title>
<link href="/public/css/bootstrap.min.css" rel="stylesheet">
<link href="/public/css/index.css" rel="stylesheet">
</head>
<body>
	<div class="header">
		<ul class="nav">
			<li class="nav-item" style="margin-left: 12px;"><a
				class="navbar-brand" href="#"> <img
					src="https://v4.bootcss.com/docs/4.3/assets/brand/bootstrap-solid.svg"
					width="30" height="30" alt="">
			</a></li>
			<li class="nav-item"><a class="nav-link active" href="/">首页</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">个人中心</a></li>
			<li class="nav-item"><a class="nav-link" href="#">登录</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#"
				tabindex="-1" aria-disabled="true">退出</a></li>
		</ul>
	</div>
	<div class="container-fluid" style="margin-top: 6px;">
		<div class="row offset-4" style="margin-top: 180px;">
			<div class="col-4">
				<form action="/user/center">
					<div class="form-group">
						<input type="email" class="form-control" id="exampleInputEmail1"
							placeholder="请输入用户名" aria-describedby="emailHelp">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="请输入密码">
					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">记住登录状态</label>
					</div>
					<div class="row">
						<div class="col-3">
							<button type="submit" class="btn btn-primary">登录</button>
						</div>
						<div class="col-9">
							<small id="emailHelp" class="form-text text-muted">没有帐号，去<a
								href="/user/register">注册</a></small>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="/public/js/jquery.min.1.12.4.js"></script>
	<script src="/public/js/bootstrap.min.js"></script>
</body>
</html>