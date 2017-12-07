<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*, bean.Comment, service.CommentService"%>
<%@ page language="java" import="service.ArticleService"%>
<% ArticleService articleService = new ArticleService(); %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String id = request.getParameter("id");
	Map<String,Object> map = articleService.getContentByArticleId(id);
	pageContext.setAttribute("article", map);
%>

<%
	CommentService commentService = new CommentService();
	List<Map<String, Object> > list = commentService.getCommentsByArticleId(id);
	pageContext.setAttribute("comments", list);
	//System.out.println(list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="pages/css/detail.css" />
<link rel="stylesheet" type="text/css" href="pages/css/public.css" />
<script src="pages/js/jQuery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<!-- 内容区 -->
	<div class='wrap'>
		<div class='left'>
			<!-- 内容区 -->
			<div class='article'>
				<div class='title'>${article.name}</div>
				<div class='category'>
					<span class='light-font'>分类：</span><span class='info'>${article.category_name}</span>
				</div>
				<div class='publicDate'>
					<span class='light-font'>发布时间：</span><span class='info'>${article.create_time}</span>
				</div>
				<hr />
				<div class='content'>${article.content}</div>
			</div>

			<!-- 评论区 -->
			<br />
			<hr />
			<div class='mb64' class="comment_list">
				<c:forEach items="${comments}" var="comment">
					<div class="comment_infor clearfix">
						<div style='border-bottom: 1px solid #ccc' class="comment_word">
							<p style='border-bottom: 20px solid #fff'>${comment.username}说：</p>
							<p class='mb32'>${comment.content}</p>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class='commentBox'>
				<textarea class="comment_input" id="commenttxt"
					placeholder="请输入评论信息(600)..." maxlength="600"></textarea>
				<input type="button" value="保存评论" class="button">
			</div>
			<div class='clearfix'></div>
			<br />
			<hr />


		</div>


		<div class='right mt32'>
			<div class='author'>
				<img src='${basePath}/static/img/1.jpg' class='header_pic'
					width='90' height='90'></img> 作者：张三
			</div>
		</div>


	</div>

	<div class='clearfix'></div>

	<!-- 底部页面 -->
	<%@include file="pages/jsp/common/footer.jsp"%>

	<script>
	$(".button").eq(0).on('click',function(){
	    var txt = $('#commenttxt').val();
		$.post("pages/jsp/controller/CommentController.jsp",{txt : txt, articleId : "${article.id}"},function(data){
			data = data.trim();
			if(data == '-1'){
				alert('请先登录！');
			}else if(data == '1') {
				alert('评论成功！');
				location.reload();
			}
		});
	});
	
</script>
</body>
</html>