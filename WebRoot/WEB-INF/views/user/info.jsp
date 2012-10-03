<%@page import="me.second.hand.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%
	User user = new User();
	if (request.getAttribute("userinfo") != null) {
		user = (User)request.getAttribute("userinfo");
	}else{
		response.sendRedirect("/secondhand/index");
		return;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="description" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<meta name="keywords" content="西南石油大学,在身边 - 全国最大的大学生交易平台,inside,大学生二手交易平台,,电子商务,和谐节约型社会,专注于大学生的生活,简单,方便,实惠,节约,衣食住行" />
		<title>个人信息</title>
		<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
		<style>
.table {
	font-family: '微软雅黑';
	font-size: 14px;
	width: 100%;
	border: #666 1px solid;
	height: 100%;
}

.table tr td {
	font-family: '微软雅黑';
	font-size: 14px;
	line-height: 30px;
	color: #FFF;
}

.table tr {
	border: #999 1px solid;
}
</style>
	</head>

	<body>
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="table">
			<tr>
				<td  align="center" valign="middle" bgcolor="#006699">
					<strong>姓名 </strong>
				</td>
				<td width="89%" bgcolor="#ACD1D9"
					style="color: #000; text-indent: 2em;">
					<% if(user.getRealName()!=null) {%>
					<%=user.getRealName() %>
					<%}else{%>
					<%="不详" %>
					<%}%>

				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" bgcolor="#006699">
					<strong>性别</strong>
				</td>
				<td bgcolor="#ACD1D9" style="color: #000; text-indent: 2em;">
					<% if(user.getSex()!=null) {%>
					<%=user.getSex() %>
					<%}else{%>
					<%="不详" %>
					<%}%>

				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" bgcolor="#006699">
					<strong>院系</strong>
				</td>
				<td bgcolor="#ACD1D9" style="color: #000; text-indent: 2em;">
					<% if(user.getSchool()!=null) {%>
					<%=user.getSpecialty() %>
					<%}else{%>
					<%="不详" %>
					<%}%>
				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" bgcolor="#006699">
					<strong>专业</strong>
				</td>
				<td bgcolor="#ACD1D9" style="color: #000; text-indent: 2em;">
					<% if(user.getSpecialty()!=null) {%>
					<%=user.getSpecialty() %>
					<%}else{%>
					<%="不详" %>
					<%}%>
				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" bgcolor="#006699">
					<strong>年级</strong>
				</td>
				<td bgcolor="#ACD1D9" style="color: #000; text-indent: 2em;">
					<% if(user.getGrade()!=0) {%>
					<%=user.getGrade()%>级
					<%}else{%>
					<%="不详" %>
					<%}%> 
				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" bgcolor="#006699">
					<strong>联系电话</strong>
				</td>
				<td bgcolor="#ACD1D9" style="color: #000; text-indent: 2em;">
					<% if(user.getTel()!=null) {%>
					<%=user.getTel() %>
					<%}else{%>
					<%="不详" %>
					<%}%>
				</td>
			</tr>
			<tr>
				<td align="center" valign="middle" bgcolor="#006699">
					<strong>QQ号码</strong>
				</td>
				<td bgcolor="#ACD1D9" style="color: #000; text-indent: 2em;">
					<% if(user.getQq()!=null) {%>
					<%=user.getQq() %>
					<%}else{%>
					<%="不详" %>
					<%}%>
				</td>
			</tr>

		</table>

	</body>
</html>
