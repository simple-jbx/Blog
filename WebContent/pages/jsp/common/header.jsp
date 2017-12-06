<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	int port = request.getServerPort();
	String basePath  = null;
	if(port==80){
		basePath = request.getScheme()+"://"+request.getServerName()+path;
	}else{
		basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
	}
	request.setAttribute("basePath", basePath);
%>
<div class="header">
	<div class='logo'>SNNU博客园</div>
	<ul>
		<li class='first'><a href="index.jsp">首页</a></li>
		<li><a href="javascript:void(0)">关于我们</a></li>
		<li><a href="javascript:void(0)">联系我们</a></li>
		<li><a href="javascript:void(0)">搜索</a></li>
	</ul>
	<div class='login'>
		<c:choose>
			<c:when test="${empty sessionScope.username}">
				<span><a href="login.jsp">登陆</a></span>
				<span>|</span>
				<span><a href="register.jsp">注册</a></span>
			</c:when>
			<c:otherwise>
				<span><a href="javascript:void(0)">欢迎您，${sessionScope.username}</a></span>
				<span>&nbsp;|&nbsp;</span>
				<span><a
					href="${basePath}/pages/jsp/controller/logoutController.jsp">登出</a></span>
			</c:otherwise>
		</c:choose>
	</div>
</div>