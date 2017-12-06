<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="pages/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css" href="pages/css/public.css" />
<link rel="stylesheet" type="text/css" href="pages/css/login.css" />
<title>登录页面</title>

</head>
<body>
	<!-- 头部页面 -->
	<%@include file="pages/jsp/common/header.jsp"%>


	<!-- 展示信息 -->
	<div class='show'>
		<img src="images/副本2.jpg"></img>
	</div>
	<!-- 登陆框 -->
	<div class='content'>
		<div class='logo'>账号登录</div>
		<div style='margin-top: 40px; text-align: center'>
			<input type="radio" name="type" />管理员&nbsp <input type="radio"
				name="type" />用户
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="text" id="username" autofocus="autofocus"
				autocomplete="off" maxlength="60" placeholder="用户名">
		</div>
		<div class='inputBox mt50 ml32'>
			<input type="password" id="password" autofocus="autofocus"
				autocomplete="off" maxlength="60" placeholder="请输入密码">
		</div>
		<div class='mt50 ml32'>
			<button class="login_btn" onclick="login()">登录</button>
		</div>
		<br>
		<div style='margin-top: 10px; text-align: center'>
			<input type="checkBox" name="type" />记住密码
		</div>
	</div>
	<script>
		
		function login(){
			var username = $('#username').val();
			var password = $('#password').val();
			//alert(username +" "+ password);
			$.ajax({
				type:"post",//请求方式
				data:{"username":username,"password":password},//传递给controller的json数据
				url:"${basePath}/pages/jsp/controller/loginController.jsp",//请求地址
				error:function(){//如果出错了，将事件重新绑定
					alert("登陆出错！");
				},
				success:function(data){ //返回成功执行回调函数。
					//alert(data);
					if(data == -1 ) {
						alert('用户名和密码不能为空！');
					}else if(data == -2 ) {
						alert('用户名不存在！');
					}else if(data == -3 ) {
						alert('用户名或密码错误！');
					}else{
							//登录成功后返回首页
							window.location.href = "${basePath}"; 
					}
				}
			});
			
			
		}
		
	</script>

</body>
</html>