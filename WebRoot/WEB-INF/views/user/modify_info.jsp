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
<link href="${ctx}/static/css/secondary_market/bottom.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/default.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
<script type="text/javascript" src="${ctx}/static/js/secondary_market/jquery-1.4.4.js"></script><!--jQUERY ，不能删-->
<script type="text/javascript" src="${ctx}/static/js/scrolltopcontrol.js"></script>
<script src="${ctx}/static/tzSelect/jquery.tzSelect.js"></script>
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
		
		function checkdata(){
	         var numReg = new RegExp("^(0|[1-9][0-9]*)$");
	         var telReg = new RegExp("^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$");
	         var idnum=document.getElementById("idNum").value;
	         var tel=document.getElementById("tel").value;
	         var qq=document.getElementById("qq").value;
	          
	         
	         var school=document.getElementById("school").value;
	         var specialty=document.getElementById("specialty").value;
	         var grade=document.getElementById("grade").value;
	        
			for(var i=0; i<idnum.length; i++)
			{
			if(idnum.charAt(i)<'0' || idnum.charAt(i)>'9')
			{
			alert("学号只能是数字");
			return false;
			}
			}
	         if(null!=qq&&""!=qq&&qq.search(/^[1-9]\d{4,8}$/) == -1){
	             alert("请输入正确QQ格式!");
	             return false;
	         }else if(null!=tel&&""!=tel&&tel.search(/^(((13[0-9]{1})|(15[0-9]{1}))|(18[0-9]{1}))+\d{8})$/) == -1){
	             alert("请输入正确手机号码!");
	             return false;
	         }else if(school=="----请选择学院----"){
	             alert("请选择学院!");
	             return false;
	         }else if(specialty=="----请选择专业----"){
	         	alert("请选择专业!");
	         	return false;
	         }else if(grade=="年级"){
	            alert("请选择年级!");
	            return false;
	         }
	        }
	</script>
		<!-- 用于JS的联动查询 -->
		<script type="text/javascript"
			src="http://www.jqueryajax.com/wp-content/uploads/2009/03/jquery-132min2.js"></script>
		<script type="text/javascript"
			src="http://www.jqueryajax.com/wp-content/uploads/2009/06/jquerydoubleselectmin.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/chain.js"></script>
		<script type="text/javascript">
	$(document).ready(function() {
		$("#school").doubleSelect('specialty', selectOption);
	});
</script>
<script type="text/javascript">
    function check(){
      var school=document.getElementById("school");
      var specialty=document.getElementById("specialty");
      var grade=document.getElementById("grade");
      /*  for(var i=0;i<school.options.length;i++){
         if(school.options[i].value=="${userinfo.school}"){
         school.options[i].selected="selected";
         break;
         }
       }
       //specialty.nodeName="${userinfo.grade}";
        for(var i=0;i<grade.options.length;i++){
         if(grade.options[i].value=="${userinfo.grade}"){
         grade.options[i].selected="selected";
         break;
         }
       }*/
    }
</script>
</head>

<body onload="check()">
<%@ include file="/WEB-INF/layouts/header.jsp"%>
<form action="${ctx}/user/u_info" method="post" id="userinfo">
<div class="content">
  <div class="center" style="z-index:-1;">
    <div class="center_text_border">
      <div class="center_text_top">
  </div>
  <div class="center_text_main">
  <div class="center_text">
  
  <div class="input_border" style="margin:10px auto;" >
  <div class="tittle">真实姓名:</div>
  <div class="input"><input type="text" id="name" name="name" tabindex="2" class="input" value="${userinfo.realName }" /></div>
	</div>
    
      <div class="input_border" style="margin:10px auto;" >
  <div class="tittle">学号:</div>
  <div class="input"><input type="text" id="idNum" name="idNum" tabindex="2" class="input" value="${userinfo.idNumber }"  /></div>
	</div>
    
    

      <div class="input_border" style="margin:10px auto;" >
  <div class="tittle">联系电话:</div>
  <div class="input"><input type="text" id="tel" name="tel" tabindex="2" class="input" value="${userinfo.tel}"  /></div>
	</div>
    
    
      <div class="input_border" style="margin:10px auto;" >
  <div class="tittle">QQ号&nbsp;码:</div>
  <div class="input"><input type="text" id="qq" name="qq" tabindex="2" class="input" value="${userinfo.qq}"  /></div>
	</div>
    
    
      <div class="input_border" style="margin:10px auto;" >
  <div class="tittle">专业年级:</div>
  <div class="input" style="margin-bottom:50px;">
  <div class="input" style="width:340px; ">
	<select id="school" name="school"
									style="background: #FFF; width: 130px; font-family: '微软雅黑'; height: 30px; text-align: center;"
									class="rowElem">
								</select>
								<select id="specialty" name="specialty"
									style="background: #FFF; width: 130px; font-family: '微软雅黑'; height: 30px; text-align: center;"
									class="rowElem">
								</select>
								<select id="grade" name="grade"
									style="background: #FFF; width: 60px; font-family: '微软雅黑'; height: 30px; text-align: center;"
									class="rowElem">
									<option value="年级">
										年级
									</option>
									<option value="2008">
										2008
									</option>
									<option value="2009">
										2009
									</option>
									<option value="2010">
										2010
									</option>
									<option value="2011">
										2011
									</option>
								</select>

</div></div>

	</div>
  <div class="input_border" style="margin:10px auto;" >
  <div class="tittle">性别:</div>
  <div class="input" style="width:220px; color:#069;">
<input type="radio" value="男" id="sex" name="sex"
								style="line-height: 30px;" tabindex="3" checked="checked"/>
							<label for="man">
								男
							</label>
							&nbsp;&nbsp;&nbsp;
							<input type="radio" value="女" id="sex"  name="sex"
								style="line-height: 30px;" tabindex="4" />
							<label for="woman">
								女
							</label>
</div>
	</div>

    <div class="input_border" style="margin:10px auto;" ><input type="submit" class="registration" id="registration" name="registration" value="确认修改"/></div>
    
  </div>
  </div>

  <div class="center_text_bottom">
  </div>
</div>
  </div>
</div>
</form>
</body>
<%@ include file="/WEB-INF/layouts/footer.jsp"%>
</html>