<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@page import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
 <% 
 	User user = (User)request.getSession().getAttribute(StaticInfo.USER_SESSION); 
%>
<% 
	String email="电子邮箱";
	if(request.getAttribute("email")!=null){
		email = request.getAttribute("email").toString();
	}
	
	String errorMsg1="请输入正确的电子邮箱地址";
	if(request.getAttribute("errorMsg1")!=null){
		errorMsg1 = request.getAttribute("errorMsg1").toString();
	}
	
	String errorMsg2="昵称不能为空";
	if(request.getAttribute("errorMsg2")!=null){
		errorMsg2 = request.getAttribute("errorMsg2").toString();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<meta name="description" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<meta name="keywords" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<title>Inside</title>
		<link href="${ctx}/static/css/login/bottom.css" type="text/css"
			rel="stylesheet" />
		<link href="${ctx}/static/css/login/registration.css" type="text/css"
			rel="stylesheet" />
			<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
		<link href="${ctx}/static/css/login/top.css" type="text/css"
			rel="stylesheet" />
		<script type="text/javascript"
			src="${ctx}/static/js/login/jquery-1.4.4.js"></script>
		<!--jQUERY -->
		<!--Email自动提示-->
		<script type="text/javascript" src="${ctx}/static/js/email/jquery.mailAutoComplete-3.1.js"></script>

		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css"
			media="screen" />
		<script type="text/javascript">
		function validateEmail(){
			var emailInfor=$.trim($('#email').val());
			$.ajax({
				url:'/user/EmailVilidate',
				type:'post',
				data:$('#emailInfor').serialize(),
				dataType:'json',
				success:function(data){
					if(data.success==false){
						alert(data.msg);
						return;
					}else{
						return data.msg;	
					}
				}

			});
			
		}


		$(document).ready(function() {
		document.getElementById('emailError').style.display="none";
		document.getElementById('passwordError').style.display="none";
		document.getElementById('nickname').style.display="none";
		$("#tems").fancybox({
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

		$("#email").mailAutoComplete({
    		'boxClass': 'out_box', //外部box样式
    		'listClass': 'list_box', //默认的列表样式
    		'focusClass': 'focus_box', //列表选样式中
    		'markCalss': 'mark_box', //高亮样式
    		'autoClass': false,
   			'textHint': true, //提示文字自动隐藏
    		'hintText': '电子邮箱'
		});
	});
	</script>

	<style type="text/css">
		.out_box{border:1px solid #ccc; background:#fff; font:15px/28px Tahoma;}
		.list_box{border-bottom:1px solid #eee; padding:0 6px; cursor:pointer;}
		.focus_box{background:#f0f3f9;}
		.mark_box{color:#c00;}
	</style>

	</head>

	<body style="overflow: hidden;">
	<div class="out_border">
		<a href="${ctx}/index">
					<div class="left_border">
					</div> </a>
			<form action="${ctx}/user/new" method="post">	
			<div class="in_border">
							
			
						<div class="input_border_error" style="color: red; margin-top: 20px" align="center" >
							${errorMsg }
						</div>
				
				
					<div class="input_border_email" >
						<div class="input_border_left">
							<div class="tittle">
								邮&nbsp;&nbsp;箱:
							</div>
							<div class="input">
								<input type="text" class="login_hui" id="email" name="email"
									tabindex="1" value=<%=email %>
									onclick="if(this.value=='电子邮箱'){this.value='';this.className='login_hei';}"
									onblur="if(this.value==''){this.value='电子邮箱';this.className='login_hui';
									document.getElementById('emailError').style.display='block';}
									else{
									if((this.value!=''&&!/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value))){
										this.className='login_hui';
										document.getElementById('emailError').style.display='block';
									}else{
										validateEmail();
										document.getElementById('emailError').style.display='none';
									}}" />
							</div>
						</div>
						
							<div id="emailError" class="message">
								<%=errorMsg1 %>
							</div>
							<span id="emailErrorSpan"></span>
						
					</div>
					<div class="input_border">
						<div class="input_border_left">
							<div class="tittle">
								密&nbsp;&nbsp;码:
							</div>
							<div class="input">
								<input type="password" class="login_hui" id="password"
									name="password" tabindex="2" value="创建密码"
									onclick="if(this.value=='创建密码'){this.type='password';this.value='';this.className='login_hei';this.style='font-weight:bold;';}"
									onblur="if(this.value==''||(this.value.length<6)||(this.value.length>12)){this.type='text';this.value='创建密码';this.className='login_hui';document.getElementById('passwordError').style.display='block';
									}else{
									document.getElementById('passwordError').style.display='none';
									}" />
							</div>
						</div>
						<div class="message" id="passwordError">密码6-12位</div>
					</div>
					<div class="input_border">
						<div class="input_border_left">
							<div class="tittle">
								昵&nbsp;&nbsp;称:
							</div>
							<div class="input">
								<input type="text" class="login_hui" id="username"
									name="username" tabindex="3" value="昵&nbsp;&nbsp;称"
									onclick="if(this.value=='昵&nbsp;&nbsp;称'){this.value='';this.className='login_hei';}"
									onblur="if(this.value==''){this.value='昵&nbsp;&nbsp;称';this.className='login_hui';
									document.getElementById('nickname').style.display='block';
									}else{
									document.getElementById('nickname').style.display='none';
									}" />
							</div>
						</div>
						<div class="message" id="nickname"><%=errorMsg2 %></div>
					</div>
					<div class="input_border">
						<div class="input_border" style="height: 40px; margin-top: 0px;">
							<input type="submit" class="registration" id="registration" tabindex="4"
								name="registration" value="提交注册" style='border-left: 0px; border-top: 0px; border-right: 0px; border-bottom: 0px'/>
						<div class="input_border_left"
							style="height: 40px; line-height: 40px; font-size: 12px; margin-left: 20px;">
							<a href="${ctx}/system" id="tems">《“身边二手交易平台”使用协议》</a><a href="#"></a>
						</div>
				</div>
		</div>
		
		</div>
</form>
		</div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</body>
</html>

