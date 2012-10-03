<%@page import="me.second.hand.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<% 
	User user = (User)request.getSession().getAttribute(StaticInfo.USER_SESSION); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description"
			content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<meta name="keywords"
			content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<title>Inside</title>
		<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
		<link href="${ctx}/static/css/secondary_market/top_design.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/main.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/center.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/left.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/bottom.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/default.css"
			rel="stylesheet" type="text/css" />

		<script type="text/javascript"
			src="${ctx}/static/js/secondary_market/jquery-1.4.4.js"></script>
		<!--jQUERY ，不能删-->
		<script type="text/javascript"
			src="${ctx}/static/js/scrolltopcontrol.js"></script>
		<script src="${ctx}/static/tzSelect/jquery.tzSelect.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/js/ordering/filter.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css"
			media="screen" />
		<script type="text/javascript">
	$(document).ready(function() {

		$("#seller_box").fancybox({
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

	});
</script>
	</head>

	<body>
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
		<div class="content">
			<div class="center" style="z-index: -1;">

				<div class="control_border">
					<div class="center_text_top">
					</div>
					<div style="background: #FFF;">
						<div class="control_border_main">
							<div class="control_left">

								<img src="${goods.imgUrl}" height="100%" />
							</div>
							<div class="control_right">
								<div class="control_top">
									<div>
										<c:choose>
											<c:when test="${!empty goods.title}">
									  	 商品全名:&nbsp;${goods.title}
									   </c:when>
											<c:otherwise>  
									   		 商品全名:&nbsp; 未知 
									   </c:otherwise>
										</c:choose>
									</div>
								</div>
								<div class="control_low">
									<div class="control_low_right">
										<div class="control_line">
											商品价格:&nbsp;${goods.price}&nbsp;元
										</div>
										<div class="control_line">
											新旧程度:&nbsp;${goods.newLevel}
										</div>
									</div>
									<div class="control_low_left">
										<div class="control_line">
											联系卖家：&nbsp;${goodsowner.tel}&nbsp;&nbsp;
											上线日期：&nbsp;${fn:substring(goods.releaseTime,0,10)}
										</div>
										<div class="control_line">
											<div
												style="width: 80px; float: left; margin-top: 8px; height: 22px;">
												<a target="_top"
													href="http://wpa.qq.com/msgrd?v=3&uin=${goodsowner.qq}&site=qq&menu=yes">
													<img border="0"
														src="http://wpa.qq.com/pa?p=2:${goodsowner.qq}:41 &r=0.6710106690879911"
														alt="点击这里给卖家发消息" title="点击这里给卖家发消息"> </a>
											</div>
											<div
												style="width: 80px; float: left; margin-top: 8px; margin-left:8px; height: 22px;">
												<a id="seller_box" href="${ctx}/user/info/${goodsowner.id}">
													<img border="0"
														src="${ctx}/static/images/secondary_market/element/seller.jpg"
														alt="点击这里查看卖家信息" title="点击这里查看卖家信息"> </a>
											</div>
											<div
												style="width: 80px; float: left; height: 22px;margin-left:8px; margin-top: 8px;">
												<a href="${ctx}/goods/report/${goods.id}"
													class="center_link"> <img border="0"
														src="${ctx}/static/images/secondary_market/element/jubao.jpg"
														alt="该商家发布不良信息，我要举报" title="该商家发布不良信息，我要举报"></a>
											</div>
											
										</div>
									</div>
									<div style="float: left; width: 20%; height: 70px;">
												<a href="javascript:history.go(-1);"><div class="return"></div>
												</a>
											</div>
								</div>
							</div>
						</div>
					</div>
					<div class="center_text_bottom">
					</div>
				</div>


				<div class="center_text_border">
					<div class="center_text_top">
					</div>
					<div class="center_text_main">
						<div class="center_text">
							<span> <%=((Goods)(request.getAttribute("goods"))).getIntroduction() %>
							</span>
						</div>
					</div>
					<div class="center_text_bottom">
					</div>
				</div>




			</div>
		</div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
		<div style="display: none;">
			<div id="Message1"
				style="width: 400px; height: 200px; overflow: auto;">
				<textarea style="width: 95%; height: 150px;"></textarea>
				<input type="button" value="提交留言"
					style="width: 80px; line-height: 25px; height: 25px; margin-left: 20px; margin-top: 10px;" />
			</div>
		</div>

		<div style="display: none; background: none;">
			<div id="Message2"
				style="width: 250px; height: 100px; overflow: auto; background: none;">
				<font size="+2">是否要提交订单！</font>
				<br />

				<input type="button" value="确认"
					style="width: 80px; line-height: 25px; height: 25px; margin-left: 20px; margin-top: 10px;" />
				<input type="button" value="取消"
					style="width: 80px; line-height: 25px; height: 25px; margin-left: 20px; margin-top: 10px;" />
			</div>
		</div>
</html>