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
	<form class="layui-form " action="" lay-filter="dataFrm">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名:</label>
			<div class="layui-input-block">
				<input type="text" name="username" lay-verify="username" autocomplete="off" placeholder="用户名"
					class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户密码:</label>
			<div class="layui-input-block">
				<input type="password" name="pwd" lay-verify="pass" autocomplete="off" 
					placeholder="用户名密码" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户手机</label>
				<div class="layui-input-inline">
					<input type="tel" name="phone"  lay-verify="required|phone" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">用户邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="email" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">籍贯</label>
			<div class="layui-input-block">
				<select name="jiguan" lay-filter="jiguan" id="jiguan" lay-search="">
					<option value="武汉">武汉</option>
					<option value="上海">上海</option>
					<option value="北京">北京</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<input type="radio" name="sex" lay-filter="sex" value="男" title="男" checked="">
				<input type="radio" name="sex" lay-filter="sex" value="女" title="女"> <input
					type="radio" name="sex"  lay-filter="sex" value="禁" title="禁用" disabled="">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">爱好</label>
			<div class="layui-input-block">
				<input type="checkbox" lay-filter='hobby' value="写作" name="hobby" title="写作"> <input
					type="checkbox" lay-filter='hobby' value="阅读" name="hobby" title="阅读" > <input
					type="checkbox" lay-filter='hobby'  value="游戏" name="hobby" title="游戏">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">是否在职</label>
			<div class="layui-input-block">
				<input type="checkbox" name="ishere" lay-filter="ishere" 
					lay-skin="switch" lay-text="是|否">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				<button type="button" class="layui-btn" id="btn1">向select里面添加一个深圳</button>
				<button type="button" class="layui-btn" id="btn2">初始化表单</button>
			</div>
		</div>
	</form>


	<script src="resources/layui/layui.js"></script>
	<script type="text/javascript">
		layui.use([ 'element', 'jquery', 'laydate', 'form'],
				function() {
					var $ = layui.jquery;
					var element = layui.element;
					var laydate = layui.laydate;
					var form = layui.form;
					// 注意:这些监听都是通过页面元素中的lay-filter属性来进行匹配监听的
					//监听提交事件
					form.on('submit(demo1)', function(data){
						  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
						  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
						  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
						  
						  //使用ajax提交
						  //$.post();
						  
						  return false; //阻止表单跳转,也就是阻止同步提交,如果需要表单跳转，去掉这段即可。
						});
					//监听下拉框的改变事件
					form.on('select(jiguan)', function(data){
						  console.log(data.elem); //得到select原始DOM对象
						  console.log(data.value); //得到被选中的值
						  console.log(data.othis); //得到美化后的DOM对象
						}); 
					//监听checkbox框的改变事件
					form.on('checkbox(hobby)', function(data){
						  console.log(data.elem); //得到checkbox原始DOM对象
						  console.log(data.elem.checked); //是否被选中，true或者false
						  console.log(data.value); //复选框value值，也可以通过data.elem.value得到
						  console.log(data.othis); //得到美化后的DOM对象
						});    
					//监听开关的改变事件
					form.on('switch(ishere)', function(data){
						  console.log(data.elem); //得到checkbox原始DOM对象
						  console.log(data.elem.checked); //开关是否开启，true或者false
						  console.log(data.value); //开关value值，也可以通过data.elem.value得到
						  console.log(data.othis); //得到美化后的DOM对象
						});  
					//监听radio的改变事件
					form.on('radio(sex)', function(data){
					  console.log(data.elem); //得到radio原始DOM对象
					  console.log(data.value); //被点击的radio的value值
					});  
					
					
					//向select里面添加一个深圳
					$("#btn1").click(function(){
						//得到select对象
						var jg=$("#jiguan");
						alert(jg.html());
						jg.append("<option value=深圳>深圳</option>");
						alert(jg.html());
						//form.render("select");//渲染下拉框
						form.render();  //渲染所有
					});
					
					//初始化表单
					$("#btn2").click(function(){
						form.val("dataFrm",{
							username:'张大明',
							pwd:'123456',
							phone:'13311112222',
							email:'1231312@qq.com',
							jiguan:'北京',
							sex:'女',
							//hobby:["写作","阅读","游戏"],
							ishere:false
						});
						
						var hobby="写作,游戏";
						var hobbys=hobby.split(",");
						//得到hobbyElem
						var hobbyElem=$("[name='hobby']");
						$.each(hobbys,function(i,str){
							alert(str);
							$.each(hobbyElem,function(j,item){
								var jdom=$(item);// 把dom--转jdom
								if(jdom.val()==str){
									//jdom.attr({"checked",true});
									jdom.attr("checked","checked");
								}
							})
						})
						form.render();
						
					});
					
					//扩展自定义验证规则
					form.verify({
						username: [
						    /^[\S]{6,12}$/
						    ,'用户名必须6到12位间，且不能出现空格'
						  ] ,
						pass: [
						    /^[\S]{6,12}$/
						    ,'密码必须6到12位，且不能出现空格'
						  ] 
					});
				});
	</script>
</body>
</html>