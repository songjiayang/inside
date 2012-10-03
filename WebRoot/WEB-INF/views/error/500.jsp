<%@page import="me.second.hand.entity.*, java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<% 
	Object user = request.getSession().getAttribute(StaticInfo.USER_SESSION);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>出错了</title>
		<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
		<link href="${ctx}/static/css/login/bottom.css" type="text/css"
			rel="stylesheet" />
		<link href="${ctx}/static/css/login/login.css" type="text/css"
			rel="stylesheet" />
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

		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css"
			media="screen" />
		<style type="text/css">
</style>
	</head>

	<body>
		<div class="bg_border"
			style="background:url(${ctx}/static/images/secondary_market/element/500.png);">
			<div class="out_border">
				<form action="${ctx}/index" method="get">
					<input type="button" class="login" id="login" name="login"
						value="返回主页"
						style="border-left: 0px; border-top: 0px; border-right: 0px; border-bottom: 0px; margin-top: 230px; margin-right: 150px;" />
				</form>
			</div>
		</div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>

	</body>
</html>

