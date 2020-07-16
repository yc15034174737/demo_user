<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

		function ins() {
			$.post("<%=request.getContextPath()%>/user/inserts",
					$("#fm").serialize(),
					function (data) {
						if(data.code != 200){
							return;
						}
						if(data.code == 200){
							alert("增加成功")
								window.location.href="<%=request.getContextPath()%>/user/toShow"

						}
					})
		}
		var n=0;
		function pl(){
			n++;
			var html="";
			html+="<div>\n" +
					"\t\t用户<input type='text' name='pl["+n+"].userName'/><br/>\n" +
					"\t\t邮箱<input type ='text' name = 'pl["+n+"].email' /><br/>\n" +
					"\t\t密码<input type ='text' name = 'pl["+n+"].password'  /><br/>\n" +
					"\t\t年龄<input type ='text' name = 'pl["+n+"].age'  /><br/>\n" +
					"\t\t爱好:足球<input type='radio' name='pl["+n+"].hobby'  value='0'/><br />\n" +
					"\t\t篮球<input type='radio' name='pl["+n+"].hobby'  value='1'/><br />\n" +
					"\t\t皮球<input type='radio' name='pl["+n+"].hobby'  value='2'/><br />\n" +
					"\t\t性别男<input type='radio' name='pl["+n+"].sex' value='0'>\n" +
					"\t\t女<input type='radio' name='pl["+n+"].sex' value='1'>\n" +
					"\t</div>"
			$("#add").append(html);
		}
</script>
<style>
	.error{
		color:red;
	}
</style>
</head>
<body>
<input type="button" value="加载更多" onclick="pl()">
<form id="fm" >
	<div>
		用户<input type="text" name="pl[0].userName" /><br/>
		邮箱<input type = "text" name = "pl[0].email" /><br/>
		密码<input type = "text" name = "pl[0].password"  /><br/>
		年龄<input type = "text" name = "pl[0].age"  /><br/>
		爱好:足球<input type="radio" name="pl[0].hobby"  value="0"/><br />
		篮球<input type="radio" name="pl[0].hobby"  value="1"/><br />
		皮球<input type="radio" name="pl[0].hobby"  value="2"/><br />
		性别男<input type="radio" name="pl[0].sex" value="0">
		女<input type="radio" name="pl[0].sex" value="1">
	</div>
	<div id="add"></div>
	<input type = "button" value = "增加" onclick="ins()"/>

</form>
</body>
</html>