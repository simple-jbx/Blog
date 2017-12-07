<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/a.css" />
<link rel="stylesheet" type="text/css" href="css/b.css" />
<title>Blog后台管理</title>
</head>
<body>
	<script>
        /**
         * @file 禁止pc浏览器使用ctrl/cammond + +/- 或 Windows下ctrl + 滚轮 缩放页面 (prevent borwser zoom)
         * 众所周知：移动端页面禁止用户缩放界面只需要在<meta name="viewport" content="user-scalable=0"> 即可，但是pc端确实比较麻烦，只能通过js来控制了
         */

        // 原生js来实现，避免依赖jquery。需要注意的是：addEventListener/DOMContentLoaded在ie中是只支持>=ie9的，一般足够了
        document.addEventListener('DOMContentLoaded', function (event) {
            // chrome 浏览器直接加上下面这个样式就行了，但是ff不识别
            document.body.style.zoom = 'reset';
            document.addEventListener('keydown', function (event) {
                if ((event.ctrlKey === true || event.metaKey === true)
                && (event.which === 61 || event.which === 107
                    || event.which === 173 || event.which === 109
                    || event.which === 187  || event.which === 189))
                    {
                       event.preventDefault();
                    }
            }, false);
            document.addEventListener('mousewheel DOMMouseScroll', function (event) {
                if (event.ctrlKey === true || event.metaKey) {
                    event.preventDefault();
                }
            }, false);
        }, false);

    </script>
	<div class="left-content">
		<div class="inner-content">
			<!-- header-starts -->
			<div class="header-section">
				<!-- top_bg -->
				<div class="top_bg">

					<div class="header_top">
						<div class="top_right">
							<ul>
								<li><a href="contact.html">help</a></li>|
								<li><a href="contact.html">Contact</a></li>|
								<li><a href="checkout.html">Delivery information</a></li>
							</ul>
						</div>
						<div class="top_left">
							<h2>
								<span></span> Call us : 029 - 8888 8888
							</h2>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
				<div class="clearfix"></div>
				<!-- /top_bg -->
			</div>
			<div class="header_bg">

				<div class="header">
					<div class="head-t">
						<div class="search">
							<form>
								<input type="text" value="" placeholder="search..."> <input
									type="submit" value="">
							</form>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>

		</div>

	</div>
	<div class="sidebar-menu">
		<div style="border-top: 1px ridge rgba(255, 255, 255, 0.15)"></div>
		<div class="menu">
			<ul id="menu">
				<div class='logo'>SNNU博客园</div>
				<li><a href="index.html"><span>HOME</span></a></li>
				<li id="menu-academico"><a href="customer1.html"><span>用户管理</span></a></li>

				</li>
				<li id="menu-academico"><a href="artical.html"> <span>文章管理</span></a></li>
				<li class="manager"><a href="manager.html"><span>管理员信息</span></a></li>
				<li id="menu-academico"><a href="announce.html"><span>发布公告</span></a></li>

				</li>
			</ul>
		</div>
	</div>
	<div id="main-content">
		<div class="monthly-grid">
			<div class="panel panel-widget">
				<div class="panel-title">......Content.....</div>
				<div class="panel-body">
					<!-- status -->
					<div class="contain"></div>
					<!-- status -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>