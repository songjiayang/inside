<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page
	import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
<%
	if (user == null) {
%>
<div class="design" id="top">
	<div class="design_center">
		<div class="design_left">
			<a href="${ctx}/" title="Home"> <img
					src="${ctx}/static/images/secondary_market/element/logo.png"
					width="200" height="80" border="0" /> </a>
		</div>
		<div class="design_right">
			<span class="design_cloud"><a href="${ctx}/user/login"><img
						src="${ctx}/static/images/secondary_market/element/cloud12.png"
						width="60" height="40" border="0" /> </a> </span>
			<span class="design_cloud"><a href="${ctx}/user/new"><img
						src="${ctx}/static/images/secondary_market/element/cloud13.png"
						width="60" height="40" border="0" /> </a> </span>
		</div>
	</div>
</div>

<%
	} else {
%>
<div class="design" id="top">
	<div class="design_center">
		<div class="design_left">
			<a href="${ctx}/" title="Home"> <img
					src="${ctx}/static/images/secondary_market/element/logo.png"
					width="200" height="80" border="0" /> </a>
		</div>
		<div class="design_right">
			<span class="design_cloud"><a href="${ctx}/user/doLogout"><img
						src="${ctx}/static/images/secondary_market/element/cloud14.png"
						width="60" height="40" border="0" /> </a> </span>
			<span class="design_cloud"><a href="${ctx}/user/goods"><img
						src="${ctx}/static/images/secondary_market/element/cloud1.png"
						width="60" height="40" border="0" /> </a> </span>
			<span class="design_cloud"><a href="${ctx}/user/make_goods"><img
						src="${ctx}/static/images/secondary_market/element/cloud2.png"
						width="60" height="40" border="0" /> </a> </span>
			<span class="design_cloud"><a href="${ctx}/user/pass_change"><img
						src="${ctx}/static/images/secondary_market/element/cloud3.png"
						width="60" height="40" border="0" /> </a> </span>
			<span class="design_cloud"><a href="${ctx}/user/u_info"><img
						src="${ctx}/static/images/secondary_market/element/cloud4.png"
						width="60" height="40" border="0" /> </a> </span>
		</div>
	</div>
</div>
<%
	}
%>
