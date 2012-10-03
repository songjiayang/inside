<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page
	import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content1") != null
			? request.getParameter("content1")
			: "";
%>
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
		<link href="${ctx}/static/css/secondary_market/top_design.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/main.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/center.css"
			rel="stylesheet" type="text/css" />
			<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
		<link href="${ctx}/static/css/secondary_market/personel.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/upload.css"
			rel="stylesheet" type="text/css" />
		<link href="${ctx}/static/css/secondary_market/bottom.css"
			rel="stylesheet" type="text/css" />
		<link href="css/secondary_market/default.css" rel="stylesheet"
			type="text/css" />
		<link rel="stylesheet" type="text/css"
			href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css"
			media="screen" />

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
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript"
			src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/js/secondary_market/jquery-1.4.4.js"></script>
		<!--jQUERY ，不能删-->
		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>

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
		<link rel="stylesheet" href="${ctx}/editor/themes/default/default.css" />
		<link rel="stylesheet" href="${ctx}/editor/plugins/code/prettify.css" />
		<script charset="utf-8" src="${ctx}/editor/kindeditor.js"></script>
		<script charset="utf-8" src="${ctx}/editor/lang/zh_CN.js"></script>
		<script charset="utf-8" src="${ctx}/editor/plugins/code/prettify.js"></script>
		<script>
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content1"]', {
		    resizeType:3,
			cssPath : '${ctx}/editor/plugins/code/prettify.css',
			uploadJson : '${ctx}/editor/jsp/upload_json.jsp',
			fileManagerJson : '../jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>
		<script type="text/javascript">
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 101) {
				$('#topcontrol').css({
					"display" : "block"
				});
			} else {
				$('#topcontrol').css({
					"display" : "none"
				});
			}
		})
	})
</script>
		<script type="text/javascript">
        function checkdata(){
         var numReg = new RegExp("^[0-9]+(.[0-9]{1,3})?$");
         var img=document.getElementById("img").value;
         var goodname=document.getElementById("title").value;
         var price=document.getElementById("price").value;
         var newlevel=document.getElementById("newlevel").value;
         if(!numReg.exec(price)){
             alert("请输入正确的价格格式!");
             return false;
         }if(null==img||""==img){
             alert("请请选择文件!");
             return false;
         }if(null==goodname||""==goodname){
             alert("请输入商品标题!");
             return false;
         }if(null==newlevel||""==newlevel){
             alert("请输入商品新旧程度!");
             return false;
         }
        }
     </script>

	</head>

	<body>

		<%@include file="/WEB-INF/layouts/header.jsp"%>
		<form:form action="make_goods" methond="post"
			enctype="multipart/form-data" onsubmit="return checkdata()">
			<div class="content">
				<div class="center" style="z-index: -1;">
					<div class="center_text_border">
						<div class="center_text_top">
						</div>
						<div class="center_text_main"
							style="min-height: 400px; color: #069;">
							<div class="center_text">
								<div class="errorMsg1">
									${error}
								</div>
								
								<div class="part">
									<div class="part_name">
										商品简图:&nbsp;
									</div>
									<div class="part_input" style="width: 300px;">
										<input type="file" class="part_input" id="img" name="img"
											tabindex="1"
											style="width: 300px; height:40px; margin-top:10px;"
											value="选择图片">

									</div>
								</div>

								<div class="part">
									<div class="part_name">
										商品名称:&nbsp;

									</div>
									<div class="part_input">
										<input type="text" class="part_input" id="title" name="title"
											tabindex="1" style="width: 400px;">

									</div>
								</div>

                                <div class="part">
									<div class="part_name">
										商品类别:&nbsp;

									</div>
									<div class="part_input">
										<select id="category" name="category" class="part_input" style="width: 105px;">
										<c:if test="${!empty categories}">
										  <c:forEach items="${categories}" var="category"> 
										   <option value="${category.id}">${category.name}</option>
										  </c:forEach>
										</c:if>
										</select>

									</div>
								</div>

								<div class="part">
									<div class="part_name">
										商品价格:&nbsp;
									</div>
									<div class="part_input">
										<input type="text" class="part_input" id="price" name="price"
											tabindex="2" style="width: 100px;">
										&nbsp;&nbsp;元
									</div>
								</div>

								<div class="part">
									<div class="part_name">
										新旧程度:&nbsp;
									</div>
									<div class="part_input">
										<select id="newlevel" name="newlevel" class="part_input" style="width: 105px;">
											<option value="全新">全新</option>
											<option value="九成新">九成新</option>
											<option value="八成新">八成新</option>
											<option value="七成新">七成新</option>
											<option value="六成新">六成新</option>
											<option value="五成新">五成新</option>
											<option value="四成新">四成新</option>
											<option value="三成新">三成新</option>
											<option value="二成新">二成新</option>
											<option value="一成新">一成新</option>
										</select>
									</div>
								</div>
                                <div class="part">
									<div class="part_name">
										商品简介:&nbsp;
									</div>
									<div class="part_input">
										
									</div>
								</div>
								<div class="" style="margin-bottom: 40px; margin-top: 10px; ">
									<textarea name="content1" id="content1" cols="100" rows="8"
										style="width: 770px; height: 300px; visibility: hidden; float:left; margin-top: 10px;"></textarea>
									<br>
									<input type="submit" class="" name="button" value="提交内容" style="margin-left:40px; height:30px; width:80px; font-family:"微软雅黑"">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
</html>