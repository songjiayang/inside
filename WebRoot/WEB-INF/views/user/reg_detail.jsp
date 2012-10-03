<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page
	import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
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
		<link href="${ctx}/static/css/login/bottom.css" type="text/css"
			rel="stylesheet" />
<link rel="shortcut icon" href="${ctx}/static/images/logo.ico" />		
		<link href="${ctx}/static/css/login/registration.css" type="text/css"
			rel="stylesheet" />

		<link href="${ctx}/static/css/login/top.css" type="text/css"
			rel="stylesheet" />

		<script type="text/javascript"
			src="${ctx}/static/js/login/jquery-1.4.4.js"></script>
		<!--jQUERY -->

		<link rel="stylesheet" type="text/css"
			href="${ctx}/static/ss/login/ddsmoothmenu.css" />
		<!--下拉菜单-->

		<script type="text/javascript"
			src="${ctx}/static/js/login/ddsmoothmenu.js"></script>
		<!--联动下拉菜单-->
		<!--下拉菜单-->
		<script type="text/javascript">
	ddsmoothmenu.init({

		mainmenuid : "smoothmenu1", //menu DIV id

		orientation : 'h', //Horizontal or vertical menu: Set to "h" or "v"

		classname : 'ddsmoothmenu', //class added to menu's outer DIV

		//customtheme: ["#1c5a80", "#18374a"],

		contentsource : "markup" //"markup" or ["container_id", "path_to_menu_file"]

	})
</script>

		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>

		<script type="text/javascript"
			src="${ctx}/static/fancybox/jquery.fancybox-1.3.4.pack.js"></script>

		<link rel="stylesheet" type="text/css"
			href="${ctx}/static/fancybox/jquery.fancybox-1.3.4.css"
			media="screen" />

		<script type="text/javascript">
	$(document).ready(function() {

		$("#school").fancybox({

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
	</head>

	<body style="overflow: hidden;">

		<div class="out_border1">

			<form action="${ctx}/user/doreg_detail" method="post" onsubmit="return checkdata()">
				<div class="in_border_detail">

					<div class="input_border" style="margin-top: 40px;">
						<div class="input_border_left">

							<div class="tittle_2">
								真实姓名:
							</div>

							<div class="input">

								<input type="text" class="login_detail" id="realName"
									name="realName" tabindex="1" />

							</div>
						</div>
						
					</div>

					<div class="input_border" style="margin-top: 20px;">
						<div class="input_border_left">

							<div class="tittle">
								学号:
							</div>

							<div class="input">

								<input type="text" class="login_detail" id="idNum" name="idNum"
									tabindex="2" />

							</div>
						</div>

					</div>



					<div class="input_border" style="margin-top: 20px;">
						<div class="tittle">
							性&nbsp;&nbsp;别:
						</div>

						<div class="input" style="width: 120px; color: #069;">
							<input type="radio" value="男" id="man" name="sex"
								style="line-height: 30px;" tabindex="3" checked="checked" />
							<label for="man">
								男
							</label>
							&nbsp;&nbsp;&nbsp;
							<input type="radio" value="女" id="woman" name="sex"
								style="line-height: 30px;" tabindex="4" />
							<label for="woman">
								女
							</label>
						</div>
						<div class="tittle">
							专业年级:</div>
							<div class="input" style="width: 340px;">
								<select id="school" name="school"
									style="background: #FFF; width: 130px; font-family: '微软雅黑'; height: 30px; text-align: center;"
									class="rowElem">
								</select>
								<select id="specialty" name="specialty"
									style="background: #FFF; width: 130px; font-family: '微软雅黑'; height: 30px; text-align: center;"
									class="rowElem">
								</select>
								<select
									style="background: #FFF; width: 60px; font-family: '微软雅黑'; height: 30px; text-align: center;" class="rowElem" id="grade" name="grade">
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

							</div>
						</div>
					<div class="input_border" style="margin-top: 20px;">
						<div class="input_border_left">

							<div class="tittle">
								联系电话:
							</div>

							<div class="input">

								<input type="text" class="login_detail" id="tel" name="tel"
									tabindex="5" />

							</div>
						</div>
					</div>

					<div class="input_border" style="margin-top: 20px;">
						<div class="input_border_left">
							<div class="tittle">
								QQ号码:
							</div>
							<div class="input">

								<input type="text" class="login_detail" id="qq" name="qq"
									tabindex="6" />

							</div>
						</div>
					</div>
					<div class="input_border">

						<input type="submit" class="registration" id="registration" style='border-left:0px;border-top:0px;border-right:0px;border-bottom:0px'
							name="registration" value="提交信息" />

						<a href="${ctx}/index"><input type="button" style='border-left:0px;border-top:0px;border-right:0px;border-bottom:0px'
								class="registration" id="registration" name="registration"
								value="跳过该步骤" /> </a>
					</div>

				</div>
			</form>
		</div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>

	</body>

</html>

