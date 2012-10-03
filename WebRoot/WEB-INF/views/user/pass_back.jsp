<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 <%@page import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
 <% 
	User user = (User)request.getSession().getAttribute(StaticInfo.USER_SESSION); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Inside</title>
		<meta name="description" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<meta name="keywords" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
<link href="${ctx}/static/css/secondary_market/top_design.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/main.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/center.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/personel.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
<link href="${ctx}/static/css/secondary_market/bottom.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${ctx}/static/js/secondary_market/jquery-1.4.4.js"></script><!--jQUERY ，不能删-->
<script type="text/javascript" src="${ctx}/static/js/scrolltopcontrol.js"></script>
<script src="tzSelect/jquery.tzSelect.js"></script>
<script type="text/javascript" src="${ctx}/static/js/ordering/filter.js"></script>
	<script type="text/javascript" src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
	<script type="text/javascript" src="${ctx}/static/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script type="text/javascript">
		$(document).ready(function() {

			  $("#seller_box").fancybox({
				'overlayShow'	: true,
				'width'				: '75%',
				'height'			: '75%',
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
  <form action="${ctx}/user/pass_back" method="post">
  <div class="center_text">
  <div class="input_border" style="margin:10px auto;" >
  <div class="tittle">注册邮箱:</div>
  <div class="input"><table><tr><td><input type="text" id="email" name="email" tabindex="2" class="input" /></td><td><input type="submit" class="registration" id="registration" name="registration" value="提交申请"/></td></tr></table></div>
	
</div>
	</div>
      <div class="input_border" style="margin:12px auto; margin-left: 180px" >
      <c:if test="${!empty error1}">	
		  <div class="message"> <font color="red">	
			${error1}	</font>
		 </div>
	</c:if>
       <div calss="left"> 
	</div>
      </div>
      
    </form>
  </div>
  
  </div>
</div>
  </div>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>
</html>