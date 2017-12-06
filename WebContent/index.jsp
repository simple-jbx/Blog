<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="service.ArticleService"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="pages/jsp/common/header.jsp"%>

<% ArticleService articleService = new ArticleService(); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script src="${basePath}/pages/js/jQuery.js"></script>
<link rel="stylesheet" type="text/css"
	href="${basePath}/pages/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="${basePath}/pages/css/index.css" />
<link rel="stylesheet" type="text/css"
	href="${basePath}/pages/css/default.css" />

</head>
<body>

	<!-- 头部页面 -->


	<!-- banner区 -->
	<div class="banner">
		<div class='content'>
			<!-- 轮播图 -->
			<ul>
				<li class='fl'><a href="javascript:void(0)"> <img
						src="${basePath}/images/50.jpg" /></a></li>
				<li class='fl'><a href="javascript:void(0)"> <img
						src="${basePath}/images/10.jpg" /></a></li>
				<li class='fl'><a href="javascript:void(0)"> <img
						src="${basePath}/images/20.jpg" /></a></li>
				<li class='fl'><a href="javascript:void(0)"> <img
						src="${basePath}/images/30.jpg" /></a></li>
				<li class='fl'><a href="javascript:void(0)"> <img
						src="${basePath}/images/40.jpg" /></a></li>
				<li class='fl'><a href="javascript:void(0)"> <img
						src="${basePath}/images/50.jpg" /></a></li>
				<li class='fl'><a href="javascript:void(0)"> <img
						src="${basePath}/images/10.jpg" /></a></li>
			</ul>
			<!-- 按钮区 -->
			<span class='banner_left'><i class='btn_left'></i></span> <span
				class='banner_right'><i class='btn_right'></i></span>
		</div>
	</div>

	<div id="wrapper">
		<!-- start page -->
		<div id="page">
			<!-- start content -->
			<div id="content">
				<div class="post">
					<h1 class="title">
						<a href="#">Welcome to Our Website!</a>
					</h1>
					<p class="byline">
						<small>Posted on January 1st, 2008 by <a href="#">Free
								CSS Templates</a></small>
					</p>
					<div class="entry">
						<p>
							<strong> </strong>
						<p></p>
					</div>
				</div>
				<div class="post">
					<h2 class="title">
						<a href="#">Web前端</a>
					</h2>
					<p class="byline">
						<small>Posted on January 1st, 2008 by <a href="#">Free
								CSS Templates</a></small>
					</p>
					<div class="entry">
						<p></p>
					</div>
				</div>
				<%
   				 //查询出编程代码类的相关文章
    			List<Map<String,Object>>  articles2 = articleService.getArticlesByCategoryId(2, 0, 6);
    			pageContext.setAttribute("articles2", articles2);
				%>

				<div class="post">
					<h2 class="title">
						<a href="#">编程语言</a>
					</h2>
					<p class="byline">
						<small>Posted on January 1st, 2008 by <a href="#">Free
								CSS Templates</a></small>
					</p>
					<div class="entry">
						<p></p>
						<h3></h3>
					</div>
				</div>
				<div class="post">
					<h2 class="title">
						<a href="#">数据库</a>
					</h2>
					<p class="byline">
						<small>Posted on January 1st, 2008 by <a href="#">Free
								CSS Templates</a></small>
					</p>
					<div class="entry">
						<p></p>
						<h3></h3>
						<blockquote>
							<p></p>
						</blockquote>
						<h3></h3>
						<ul>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- end content -->

			<!-- start sidebars -->
			<!--
			<div id="sidebar1" class="sidebar">
				<ul>
					<li>
						<h2>Recent Posts</h2>
						<ul>
							<li><a href="#">Aliquam libero</a></li>
							<li><a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Urnanet non molestie semper</a></li>
							<li><a href="#">Proin gravida orci porttitor</a></li>
						</ul>
					</li>
					<li>
						<h2>Recent Comments</h2>
						<ul>
							<li><a href="#">Free CSS Templates</a> on <a href="#">Aliquam
									libero</a></li>
							<li><a href="#">Free CSS Templates</a> on <a href="#">Consectetuer
									adipiscing elit</a></li>
							<li><a href="#">Free CSS Templates</a> on <a href="#">Metus
									aliquam pellentesque</a></li>
							<li><a href="#">Free CSS Templates</a> on <a href="#">Suspendisse
									iaculis mauris</a></li>
							<li><a href="#">Free CSS Templates</a> on <a href="#">Urnanet
									non molestie semper</a></li>
							<li><a href="#">Free CSS Templates</a> on <a href="#">Proin
									gravida orci porttitor</a></li>
						</ul>
					</li>
					<li>
						<h2>Archives</h2>
						<ul>
							<li><a href="#">September</a> (23)</li>
							<li><a href="#">August</a> (31)</li>
							<li><a href="#">July</a> (31)</li>
							<li><a href="#">June</a> (30)</li>
							<li><a href="#">May</a> (31)</li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="sidebar2" class="sidebar">
				<ul>
					<li>
						<h2>Calendar</h2>
						<div id="calendar_wrap">
							<table width="80%" summary="Calendar">
								<caption>January 2008</caption>
								<thead>
									<tr>
										<th abbr="Monday" scope="col" title="Monday">M</th>
										<th abbr="Tuesday" scope="col" title="Tuesday">T</th>
										<th abbr="Wednesday" scope="col" title="Wednesday">W</th>
										<th abbr="Thursday" scope="col" title="Thursday">T</th>
										<th abbr="Friday" scope="col" title="Friday">F</th>
										<th abbr="Saturday" scope="col" title="Saturday">S</th>
										<th abbr="Sunday" scope="col" title="Sunday">S</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<td abbr="September" colspan="3" id="prev"><a href="#"
											title="View posts for September 2007">&laquo; Sep</a></td>
										<td class="pad">&nbsp;</td>
										<td colspan="3" id="next">&nbsp;</td>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td>1</td>
										<td>2</td>
										<td>3</td>
										<td id="today">4</td>
										<td>5</td>
										<td>6</td>
										<td>7</td>
									</tr>
									<tr>
										<td>8</td>
										<td>9</td>
										<td>10</td>
										<td>11</td>
										<td>12</td>
										<td>13</td>
										<td>14</td>
									</tr>
									<tr>
										<td>15</td>
										<td>16</td>
										<td>17</td>
										<td>18</td>
										<td>19</td>
										<td>20</td>
										<td>21</td>
									</tr>
									<tr>
										<td>22</td>
										<td>23</td>
										<td>24</td>
										<td>25</td>
										<td>26</td>
										<td>27</td>
										<td>28</td>
									</tr>
									<tr>
										<td>29</td>
										<td>30</td>
										<td>31</td>
										<td class="pad" colspan="4">&nbsp;</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li>
						<h2>Categories</h2>
						<ul>
							<li><a href="#">Aliquam libero</a></li>
							<li><a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Urnanet non molestie semper</a></li>
							<li><a href="#">Proin gravida orci porttitor</a></li>
							<li><a href="#">Aliquam libero</a></li>
							<li><a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Urnanet non molestie semper</a></li>
							<li><a href="#">Proin gravida orci porttitor</a></li>
							<li><a href="#">Aliquam libero</a></li>
							<li><a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="#">Urnanet non molestie semper</a></li>
							<li><a href="#">Proin gravida orci porttitor</a></li>
						</ul>
					</li>
				</ul>
			</div>
			-->
			<!-- end sidebars -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end page -->

	</div>


	<!-- 底部页面 -->
	<script>
	var leftBtn = $('.btn_left').eq(0); //左按钮
	var rightBtn = $('.btn_right').eq(0);//右按钮

	var ul = $('.banner .content ul').eq(0); 

	var index = 0;
	var timer = null; 

	var imgwidth = $('.banner .content ul li').width(); //获取轮播图片的宽度
	var len =  $('.banner .content ul li').length - 2//获取总共的图片数量

	rightBtn.on('click',function(){
	    clearTimeout(timer); //定时器清零
	    timer = setTimeout(function(){
	        index ++;
	        movePicture();
	    },500);
	    
	});

	leftBtn.on('click',function(){
	    clearTimeout(timer); //定时器清零
	    timer = setTimeout(function(){
	        index --;
	        movePicture();
	    },500);
	});
	        

	function movePicture(){
	    
	    $('.banner .content ul').animate({'margin-left':-imgwidth * (index+1)},1000,function(){
	        if(index == len){
	            $(this).css('margin-left',-imgwidth);
	            index = 0;
	        }
	        if(index == -1){
	            $(this).css('margin-left',-imgwidth * len);
	            index = len - 1;
	        }
	    });
	}
</script>
	<%@include file="pages/jsp/common/footer.jsp"%>
</body>
</html>