<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表单元素</title>
<link rel="stylesheet" href="resources/layui/css/layui.css">
</head>
<body style="padding: 20px">
	<button type="button" class="layui-btn" id="btn1">alert</button>
	<button type="button" class="layui-btn" id="btn2">confirm</button>
	<button type="button" class="layui-btn" id="btn3">prompt</button>
	<button type="button" class="layui-btn" id="btn4">tab</button>
	<button type="button" class="layui-btn" id="btn5">photos</button>
	<button type="button" class="layui-btn" id="btn6">layer.msg</button>
	
	<div style="height: 200px;text-align: center;padding: 50px" 
	>
		<button type="button" class="layui-btn" id="btn7">layer.tips</button>
	
	</div>

	<script src="resources/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use([ 'element', 'jquery', 'layer', 'form' ], function() {
			var $ = layui.jquery;
			var element = layui.element;
			var layer = layui.layer;
			var form = layui.form;
			//alert
			$("#btn1").click(function() {
				//layer.alert('只想简单的提示'); 
				// layer.alert('加了个图标', {icon: 5}); //图标1-7
				layer.alert('有了回调', function(index){
					alert("ok");
					  layer.close(index);
					});   
			});

			//confirm
			$("#btn2").click(function() {
				layer.confirm('你真的要退出吗?', {icon: 3, title:'提示'}, function(index){
					  alert("ok");
					  layer.close(index);
					});
			});
			//prompt
			$("#btn3").click(function() {
				/* layer.prompt(function(value, index, elem){
					  alert(value); //得到value
					  layer.close(index);
					}); */
				//例子2
				layer.prompt({
				  formType: 2,
				  value: '初始值',
				  title: '请输入值',
				  area: ['800px', '350px'] //自定义文本域宽高
				}, function(value, index, elem){
				  alert(value); //得到value
				  layer.close(index);
				});
			});
			//tab
			$("#btn4").click(function() {
				layer.tab({
					  area: ['600px', '300px'],
					  tab: [{
					    title: 'TAB1', 
					    content: '内容1'
					  }, {
					    title: 'TAB2', 
					    content: '内容2'
					  }, {
					    title: 'TAB3', 
					    content: '内容3'
					  }]
					});      
			});
			//photos
			$("#btn5").click(function() {
				$.get("resources/json/images.json",function(json){
					layer.photos({
					    photos: json
					    ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
					  });
				})
			});
			//msg
			$("#btn6").click(function() {
				//layer.msg('只想弱弱提示');
				//layer.msg('有表情地提示', {icon: 6}); 
			});
			//tips
			$("#btn7").click(function() {
				layer.tips('只想提示地精准些', '#btn7',{tips:4});
			});

		});
	</script>
</body>
</html>