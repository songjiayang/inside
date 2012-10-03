<%@page import="me.second.hand.cons.StaticInfo"%>
<%@page import="me.second.hand.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<% 
	User user=(User)request.getSession().getAttribute(StaticInfo.EMAIL_STR);
	if(user==null){
		response.sendRedirect("user/login");
	}
	
	String emailAddress="";	
	
	emailAddress="http://mail."+user.getEmail().substring(user.getEmail().indexOf('@')+1,user.getEmail().length());

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>Inside</title>
<meta name="description" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
<meta name="keywords" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
<link href="${ctx}/static/css/login/bottom.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/css/login/login.css" type="text/css" rel="stylesheet" />  
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />   
<script type="text/javascript">  
    function dosubmit() {   
        document.forms[0].submit();    
    }   
</script> 
</head>
<body>
	<form action="user/activeuser/resend" method="post" >

<div class="bg_border">
<div class="out_border">
  <a href="${ctx}/index"><div class="left_border">
</div></a>

<div class="right_border">
<div class="in_border">
  <input type="hidden" value="<%=user.getEmail()%>" id="email" name="email"/>
  <div style="margin-top:60px;"></div>
  <div class="login_hui">验证邮件已超时，验证邮件已重发至你的邮箱。</div>
  <div class="login_hui" style="height:45px;"><a href="<%=emailAddress %>"><input type="button" class="login" value="查看邮箱" style="float:left;"/></a></div>
   <div class="login_hui"></div>
  <div class="login_hui">没有收到激活邮件？</div>
  <div class="tip"  style="height:20px;">-试试到邮箱中的垃圾邮件、广告邮件目录中找找</div>
  <div class="tip"  style="height:20px;">-或者，<a onclick="dosubmit()" style="text-decoration: none; color: #069">重新确认发邮件</a></div>
  <div class="tip">如果仍然无法完成激活，请将情况描述发送给in_side@sina.com</div>
</div>
</form>
</body>
</html>