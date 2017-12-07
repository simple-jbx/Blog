<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="pages/jsp/common/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${basePath}/pages/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css"
	href="${basePath}/pages/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="${basePath}/pages/css/login.css" />
<title>注册页面</title>

</head>
<body>
	<!-- 头部页面 -->


	<!-- 展示信息 -->
	<div class='show'>
		<img src="images/副本2.jpg"></img>
	</div>

	<!-- 登陆框 -->
	<div class='content'>
		<div class='logo'>用户注册</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username" autofocus="autofocus"
				autocomplete="off" maxlength="60" placeholder="用户名">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username" autofocus="autofocus"
				autocomplete="off" maxlength="60" placeholder="邮箱">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="password" id="password" autofocus="autofocus"
				autocomplete="off" maxlength="60" placeholder="请输入密码">
		</div>

		<div class='inputBox mt50 ml32'>
			<input type="password" id="password" autofocus="autofocus"
				autocomplete="off" maxlength="60" placeholder="请确认密码">
		</div>

		<div class='mt50 ml32'>
			<button class="login_btn" onclick="login()">注册</button>
		</div>
	</div>



</body>
</html>