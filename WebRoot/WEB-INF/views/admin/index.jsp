<%@page import="me.second.hand.entity.Administor"%>
<%@page import="java.util.List"%>
<%@page import="me.second.hand.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=utf-8"pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 <%@ page import=" me.second.hand.cons.StaticInfo"%>
 <% 
 	int id = Integer.parseInt(request.getAttribute("id").toString());
 	int count = Integer.parseInt(session.getAttribute("count").toString());
 	int mix =0;
 	int max =0;
 	if(id<=1){
 		id=1;
 		mix =0;
 	}else{
 		mix = id-1;
 	}
 	if(count<=1){
 		count=1;
 		max=1;
 	}else{
 		max=count-1;
 	}
 	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
<meta name="keywords" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
<title>Inside</title>
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
<link href="${ctx}/static/css/secondary_market/top_design.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/main.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/center.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/personel.css" rel="stylesheet" type="text/css" />
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

			  $(".check_box").fancybox({
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
<div class="design" id="top">
	<div class="design_center">
		<div class="design_left">
			<a href="${ctx}/" title="Home"> <img
					src="${ctx}/static/images/secondary_market/element/logo.png"
					width="200" height="80" border="0" /> </a>
		</div>
			<span class="design_cloud"><a href="${ctx}/admin/loginout"
				title="注销退出"><img
						src="${ctx}/static/images/secondary_market/element/cloud3.png"
						width="60" height="40" border="0" /> </a> </span>
		</div>
	</div>
</div>
<div style="position: absolute; margin-top: 100px; height: 10px; width: 100%; background: url(${ctx}/static/images/projection.png); background-repeat: repeat-x; z-index: 1000;"></div>
<div class="content">
  <div class="center" style="z-index:-1;">
    <div class="center_text_border">
      <div class="center_text_top">
  </div>
  <div class="center_text_main">
  <div class="center_text">
  <c:if test="${!empty sessionScope.goods}">
	  <c:forEach items="${sessionScope.goods}" var="good"> 
	     <div class="history">
	  <div class="history_time">${fn:substring(good.releaseTime,0,10)}</div>
	  <div class="history_left">
	  <a href="${ctx}/goods/${good.id}" class="check_box">${good.title}</a>&nbsp;
	   <c:if test="${good.condition==0}">
	  	
	  		
	  	<font color="red">(商品已下线)</font>
	  </c:if>
	  <c:if test="${good.condition==1&&good.isReport==1}">
	  		<font color="red">
	  			(商品被举报)
	  		</font>
	  </c:if></div>
  <div class="history_right">
  <span class="delet" ><a class="fun_a" href="${ctx}/admin/warning/${good.id}">邮件警告</a> &nbsp;
  |</span><span class="delet" ><a class="fun_a" href="${ctx}/admin/delete/${good.id}">确认删除</a></span>
  </div>
  </div>
</c:forEach>
</c:if> 
 <div class="history_left1" >
 <a href="${ctx}/admin/goods/<%=mix %>">上一页</a>&nbsp;当前第<%=id%>页 | 共<%=count %>页&nbsp;<a href="${ctx}/admin/goods/<%=max %>">下一页</a>
 </div>
  </div>
 
  
  </div>
  <div class="center_text_bottom">
  </div>
</div>
  </div>
</div>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>
</html>