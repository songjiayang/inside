<%@page import="me.second.hand.entity.*, java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page
	import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<% 
	User user = (User)request.getSession().getAttribute(StaticInfo.USER_SESSION);
	Random r = new Random();
	int i=0;
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Inside</title>
		<meta name="description"
			content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<meta name="keywords"
			content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
			<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
		<link href="${ctx}/static/css/secondary_market/top_design.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/main.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/center.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/bottom.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/default.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript"
			src="${ctx}/static/js/secondary_market/jquery-1.4.4.js"></script>
		<!--jQUERY ，不能删-->
	<script type="text/javascript" src="${ctx}/static/js/secondary_market/jquery-1.7.min.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css"
			media="screen" />

<script type="text/javascript">
	var totalheight = 0;
	function loadData() {
		totalheight = parseFloat($(window).height())
				+ parseFloat($(window).scrollTop());
		if ($(document).height() <= totalheight) {
			$.ajax({  
	            type: "GET",  
	            url: "${ctx}/more",    
	            success: function(data) { 
	            	 $("#listTest").append(data);
	            }  
	        });  
	        return false;
		}
	}

	$(window).scroll(function() {
		loadData();
	});

	$(document).ready(function() {
		/*
		 *   Examples - images
		 */

		$("a#example1").fancybox();

		/*
		 *   Examples - various
		 */

		$(".Message").fancybox({
			'overlayShow' : false,
			'autoScale' : false,
			'titlePosition' : 'inside',
			'transitionIn' : 'none',
			'transitionOut' : 'none'
		});

		$("#school").fancybox({
			'overlayShow' : true,
			'width' : '75%',
			'height' : '75%',
			'autoScale' : false,
			'transitionIn' : 'elastic',
			'transitionOut' : 'elastic',
			'type' : 'iframe',
			'overlayColor' : '#000',
			'overlayOpacity' : 0.7
		});
		$(".share").fancybox({
			'overlayShow' : false,
			'width' : '40%',
			'height' : '40%',
			'autoScale' : true,
			'transitionIn' : 'elastic',
			'transitionOut' : 'elastic',
			'type' : 'iframe'
		});
		$("#various4").fancybox({
			'padding' : 0,
			'autoScale' : false,
			'transitionIn' : 'none',
			'transitionOut' : 'none'
		});
	});
</script>
	</head>

	<body>
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
		<div class="content">
			<div id="display_goods">
				<div class="selecter">
					<div class="selecterBtns">
						<ul class="nolist" id="list">
							<li>
								<a href="${ctx}/goods_wall">宝贝墙</a>
							</li>

							<li>
								<a href="${ctx}/category/0" rel="all">全部</a>
							</li>

							<c:forEach items="${sessionScope.CATEGORY_CONTEXT}"
								var="category">
								<li>
									<a href="${ctx}/category/${category.id}" rel="all">${category.name}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="selecterContent">
						<ul class="nolist" id="listTest">
							<c:forEach items="${goods}" var="good">
								<% 
									if(i==6)
										i = 0; 
									i++;
								%>
								<li class="all"
									style="background:url(${ctx}/static/images/secondary_market/li_bg/<%=i%>.png)">
									<a href="${ctx}/goods/${good.id}">
										<div class="image">
											<img src="${good.imgUrl}" alt="poster1" />
										</div>
										<div class="small">
											${good.title}
										</div>
										<div class="small">
											${good.price} 元
										</div> </a>
								</li>
							</c:forEach>													
							
						</ul>
					</div>
								
					
				</div>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</body>
</html>