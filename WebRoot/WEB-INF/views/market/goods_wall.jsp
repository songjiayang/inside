<%@page import="me.second.hand.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="me.second.hand.entity.User,me.second.hand.cons.StaticInfo"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
 <% 
 	User user = (User)request.getSession().getAttribute(StaticInfo.USER_SESSION); 
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
<link href="${ctx}/static/css/secondary_market/wall.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/css/secondary_market/reset.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/static/css/secondary_market/wall.css" />
	<script type="text/javascript"
			src="${ctx}/static/js/secondary_market/jquery-1.4.4.js"></script>
		<!--jQUERY ，不能删-->

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
  
  <div style="height:50px; margin-top:30px; font-size:36px; color:#069;" >
 宝贝墙
 </div>
  <div class="iw_wrapper">
				<ul class="iw_thumbs" id="iw_thumbs">
				<c:forEach items="${goods}" var="good"> 
					<li>
					<img src="${good.imgUrl}" data-img="${good.imgUrl}" title="${good.title}"/>
					<!--<div>
					<h2>${good.title}</h2><p>价格：${good.price}元  <br />新旧程度：${good.newLevel}<br /><a href="${ctx}/goods/${good.id}">点击查看商品详细信息</a></p>
					</div>
					--></li>
				</c:forEach>
				</ul>
</div>
			<div id="iw_ribbon" class="iw_ribbon">
				<span class="iw_close"></span>
			</div>
  </div>
</div>
<div class="bottom">
<%@ include file="/WEB-INF/layouts/footer.jsp"%>
</div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/secondary_market/jquery.masonry.min.js"></script>
		<script type="text/javascript" src="${ctx}/static/js/secondary_market/jquery.easing.1.3.js"></script>
		<script type="text/javascript">
			$(window).load(function(){
				var $iw_thumbs			= $('#iw_thumbs'),
					$iw_ribbon			= $('#iw_ribbon'),
					$iw_ribbon_close	= $iw_ribbon.children('span.iw_close'),
					$iw_ribbon_zoom		= $iw_ribbon.children('span.iw_zoom');
					
					ImageWall	= (function() {
							// window width and height
						var w_dim,
						    // index of current image
							current				= -1,
							isRibbonShown		= false,
							isFullMode			= false,
							// ribbon / images animation settings
							ribbonAnim			= {speed : 500, easing : 'easeOutExpo'},
							imgAnim				= {speed : 400, easing : 'jswing'},
							// init function : call masonry, calculate window dimentions, initialize some events
							init				= function() {
								$iw_thumbs.imagesLoaded(function(){
									$iw_thumbs.masonry({
										isAnimated	: true
									});
								});
								getWindowsDim();
								initEventsHandler();
							},
							// calculate window dimentions
							getWindowsDim		= function() {
								w_dim = {
									width	: $(window).width(),
									height	: $(window).height()
								};
							},
							// initialize some events
							initEventsHandler	= function() {
								
								// click on a image
								$iw_thumbs.delegate('li', 'click', function() {
									if($iw_ribbon.is(':animated')) return false;
									
									var $el = $(this);
									
									if($el.data('ribbon')) {
										showFullImage($el);
									}
									else if(!isRibbonShown) {
										isRibbonShown = true;
										
										$el.data('ribbon',true);
										
										// set the current
										current = $el.index();
									
										showRibbon($el);
									}
								});
								
								// click ribbon close
								$iw_ribbon_close.bind('click', closeRibbon);
								
								// on window resize we need to recalculate the window dimentions
								$(window).bind('resize', function() {
											getWindowsDim();
											if($iw_ribbon.is(':animated'))
												return false;
											closeRibbon();
										 })
								         .bind('scroll', function() {
											if($iw_ribbon.is(':animated'))
												return false;
											closeRibbon();
										 });
								
							},
							showRibbon			= function($el) {
								var	$img	= $el.children('img'),
									$descrp	= $img.next();
								
								// fadeOut all the other images
								$iw_thumbs.children('li').not($el).animate({opacity : 0.2}, imgAnim.speed);
								
								// increase the image z-index, and set the height to 100px (default height)
								$img.css('z-index', 100)
									.data('originalHeight',$img.height())
									.stop()
									.animate({
										height 		: '100px'
									}, imgAnim.speed, imgAnim.easing);
								
								// the ribbon will animate from the left or right
								// depending on the position of the image
								var ribbonCssParam 		= {
										top	: $el.offset().top - $(window).scrollTop() - 6 + 'px'
									},
									descriptionCssParam,
									dir;
								
								if( $el.offset().left < (w_dim.width / 2) ) {
									dir = 'left';
									ribbonCssParam.left 	= 0;
									ribbonCssParam.right 	= 'auto';
								}
								else {
									dir = 'right';
									ribbonCssParam.right 	= 0;
									ribbonCssParam.left 	= 'auto';
								}
								
								$iw_ribbon.css(ribbonCssParam)
								          .show()
										  .stop()
										  .animate({width : '100%'}, ribbonAnim.speed, ribbonAnim.easing, function() {
												switch(dir) {
													case 'left' :
														descriptionCssParam		= {
															'left' 			: $img.outerWidth(true) + 'px',
															'text-align' 	: 'left'

														};
														break;
													case 'right' :	
														descriptionCssParam		= {
															'left' 			: '-200px',
															'text-align' 	: 'right'
														};
														break;
												};
												$descrp.css(descriptionCssParam).fadeIn();
												// show close button and zoom
												$iw_ribbon_close.show();
												$iw_ribbon_zoom.show();
										  });
								
							},
							// close the ribbon
							// when in full mode slides in the middle of the page
							// when not slides left
							closeRibbon			= function() {
								isRibbonShown 	= false
								
								$iw_ribbon_close.hide();
								$iw_ribbon_zoom.hide();
								
								if(!isFullMode) {
								
									// current wall image
									var $el	 		= $iw_thumbs.children('li').eq(current);
									
									resetWall($el);
									
									// slide out ribbon
									$iw_ribbon.stop()
											  .animate({width : '0%'}, ribbonAnim.speed, ribbonAnim.easing); 
										  
								}
								else {
									$iw_ribbon.stop().animate({
										opacity		: 0.8,
										height 		: '0px',
										marginTop	: w_dim.height/2 + 'px' // half of window height
									}, ribbonAnim.speed, function() {
										$iw_ribbon.css({
											'width'		: '0%',
											'height'	: '126px',
											'margin-top': '0px'
										}).children('img').remove();
									});
									
									isFullMode	= false;
								}
							},
							resetWall			= function($el) {
								var $img		= $el.children('img'),
									$descrp		= $img.next();
									
								$el.data('ribbon',false);
								
								// reset the image z-index and height
								$img.css('z-index',1).stop().animate({
									height 		: $img.data('originalHeight')
								}, imgAnim.speed,imgAnim.easing);
								
								// fadeOut the description
								$descrp.fadeOut();

								// fadeIn all the other images
								$iw_thumbs.children('li').not($el).animate({opacity : 1}, imgAnim.speed);								
							},
							showFullImage		= function($el) {
								isFullMode	= true;
								
								$iw_ribbon_close.hide();
								
								var	$img	= $el.children('img'),
									large	= $img.data('img'),
								
									// add a loading image on top of the image
									$loading = $('<span class="iw_loading"></span>');
								
								$el.append($loading);
								
								// preload large image
								$('<img/>').load(function() {
									var $largeImage	= $(this);
									
									$loading.remove();
									
									$iw_ribbon_zoom.hide();
									
									resizeImage($largeImage);
									
									// reset the current image in the wall
									resetWall($el);
									
									// animate ribbon in and out
									$iw_ribbon.stop().animate({
										opacity		: 1,
										height 		: '0px',
										marginTop	: '63px' // half of ribbons height
									}, ribbonAnim.speed, function() {
										// add the large image to the DOM
										$iw_ribbon.prepend($largeImage);
										
										$iw_ribbon_close.show();
										
										$iw_ribbon.animate({
											height 		: '100%',
											marginTop	: '0px',
											top			: '0px'
										}, ribbonAnim.speed);
									});
								}).attr('src',large);
									
							},
							resizeImage			= function($image) {
								var widthMargin		= 100,
									heightMargin 	= 100,
								
									windowH      	= w_dim.height - heightMargin,
									windowW      	= w_dim.width - widthMargin,
									theImage     	= new Image();
									
								theImage.src     	= $image.attr("src");
								
								var imgwidth     	= theImage.width,
									imgheight    	= theImage.height;

								if((imgwidth > windowW) || (imgheight > windowH)) {
									if(imgwidth > imgheight) {
										var newwidth 	= windowW,
											ratio 		= imgwidth / windowW,
											newheight 	= imgheight / ratio;
											
										theImage.height = newheight;
										theImage.width	= newwidth;
										
										if(newheight > windowH) {
											var newnewheight 	= windowH,
												newratio 		= newheight/windowH,
												newnewwidth 	= newwidth/newratio;
										
											theImage.width 		= newnewwidth;
											theImage.height		= newnewheight;
										}
									}
									else {
										var newheight 	= windowH,
											ratio 		= imgheight / windowH,
											newwidth 	= imgwidth / ratio;
										
										theImage.height = newheight;
										theImage.width	= newwidth;
										
										if(newwidth > windowW) {
											var newnewwidth 	= windowW,
											    newratio 		= newwidth/windowW,
												newnewheight 	= newheight/newratio;
									
											theImage.height 	= newnewheight;
											theImage.width		= newnewwidth;
										}
									}
								}
									
								$image.css({
									'width'			: theImage.width + 'px',
									'height'		: theImage.height + 'px',
									'margin-left'	: -theImage.width / 2 + 'px',
									'margin-top'	: -theImage.height / 2 + 'px'
								});							
							};
							
						return {init : init};	
					})();
				
				ImageWall.init();
			});
		</script>
</body>
</html>