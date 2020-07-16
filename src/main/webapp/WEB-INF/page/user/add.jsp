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
			$.post("<%=request.getContextPath()%>/user/insert",
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
</script>
<style>
	.error{
		color:red;
	}
</style>
</head>
<body>
<form id="fm" >
		用户<input type="text" name="userName" /><br/>
		邮箱<input type = "text" name = "email" /><br/>
		密码<input type = "text" name = "password"  /><br/>
		年龄<input type = "text" name = "age"  /><br/>
		爱好:足球<input type="radio" name="hobby"  value="0"/><br />
		篮球<input type="radio" name="hobby"  value="1"/><br />
		皮球<input type="radio" name="hobby"  value="2"/><br />
		性别男<input type="radio" name="sex" value="0">
		女<input type="radio" name="sex" value="1">
		<input type = "button" value = "增加" onclick="ins()"/>
</form>
</body>
</html>