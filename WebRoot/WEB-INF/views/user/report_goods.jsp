<%@page import="java.util.List"%>
<%@page import="me.second.hand.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=utf-8"pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 <%@page import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
 <% 
 	User user = (User)request.getSession().getAttribute(StaticInfo.USER_SESSION); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<meta name="keywords" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
<title>Inside</title>
<link href="${ctx}/static/css/secondary_market/top_design.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/main.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/center.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/personel.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/bottom.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/default.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
<script type="text/javascript" src="${ctx}/static/js/secondary_market/jquery-1.4.4.js"></script><!--jQUERY ，不能删-->
<script type="text/javascript" src="${ctx}/static/js/scrolltopcontrol.js"></script>
<script src="tzSelect/jquery.tzSelect.js"></script>
<script type="text/javascript" src="${ctx}/static/js/ordering/filter.js"></script>
	<script type="text/javascript" src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/static/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script type="text/javascript">
		$(document).ready(function() {

			  $("#check_box").fancybox({
				'overlayShow'	: true,
				'width'				: '90%',
				'height'			: '80%',
				'autoScale'			: false,
				'transitionIn'		: 'elastic',
				'transitionOut'		: 'elastic',
				'type'				: 'iframe',
				'overlayColor'		: '#000',
				'overlayOpacity'	: 0.7
			});
		});
	</script>
</head>

<body>
<%@ include file="/WEB-INF/layouts/header.jsp"%>
<div class="content">
  <div class="center" style="z-index:-1;">
    <div class="center_text_border">
      <div class="center_text_top">
  </div>
  <div class="center_text_main">
  <div class="center_text">
  <c:if test="${!empty goods}">
	  <c:forEach items="${goods}" var="good"> 
	     <div class="history">
	  <div class="history_time">${fn:substring(good.releaseTime,0,10)}</div>
	  <div class="history_left"><a href="${ctx}/goods/${good.id}" id="check_box">${good.title}</a></div>
  <div class="history_right">
  <span class="delet" ><a class="fun_a" href="#">邮箱提醒</a></span><span class="delet" ><a class="fun_a" href="#">删除</span>
  </div>
  </div>
</c:forEach>
</c:if> 
  </div>
  </div>
  <div class="center_text_bottom">
  </div>
</div>
  </div>
</div>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>
<div style="display: none;">
<div id="Message1" style="width:400px;height:200px;overflow:auto;">
	<textarea style="width:95%; height:150px;"></textarea>
    <input type="button" value="提交留言"  style="width:80px; line-height:25px; height:25px; margin-left:20px; margin-top:10px;"/>
</div>
</div>

<div style="display: none; background:none;">
  <div id="Message2" style="width:250px;height:100px;overflow:auto; background:none;">
    <font size="+2">是否要提交订单！</font><br />
    
  <input type="button" value="确认"  style="width:80px; line-height:25px; height:25px; margin-left:20px; margin-top:10px;"/>
  <input type="button" value="取消"  style="width:80px; line-height:25px; height:25px; margin-left:20px; margin-top:10px;"/></div>
</div>
</html>