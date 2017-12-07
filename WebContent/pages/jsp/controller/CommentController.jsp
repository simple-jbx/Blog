<%@ page language="java"
	import="java.util.*, service.CommentService, bean.Comment"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.User"%>
<%
	//评论需要登陆
	User user = (User) session.getAttribute("user");
	if(user == null) {
		out.println("-1");
		return;
	}else {
		out.println("1");
	}
	 String txt = request.getParameter("txt").toString();
	 //System.out.println(txt);
	 String articleId = request.getParameter("articleId").toString();
	 
	 CommentService commentService = new CommentService();
	 Comment comment = new Comment();
	 comment.setId((UUID.randomUUID()).toString());
	 comment.setUserId(user.getId());
	 comment.setArticleId(articleId);
	 comment.setContent(txt);
	 commentService.saveComment(comment);
%>