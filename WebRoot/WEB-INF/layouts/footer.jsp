<%@ page language="java" pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	$(document).ready(function() {
		$("#about").fancybox({
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
<div class="bottom">
	<div class="bottom_line">
		Copyright © 20012-2012 熊猫超人科技有限公司 Inc.All rights reserved
		闽ICP备07050274号 |
		<a href="${ctx}/about" id="about">关于我们</a>
	</div>
</div>
<div id="topcontrol"
	style="position: fixed; bottom: 40px; right: 40px; cursor: pointer; display: none;">
	<a href="#top"><img src="${ctx}/static/images/gotop.gif"
			style="width: 31px; height: 31px; border: 0;" />
	</a>
</div>
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
