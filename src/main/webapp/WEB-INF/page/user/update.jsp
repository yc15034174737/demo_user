<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/res/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

		

	 function upd() {
		 $.post("<%=request.getContextPath()%>/user/update",
				 $("#fm").serialize(),
				 function (data) {
					 if(data.code != 200){
						 return;
					 }
					 if(data.code == 200){
						 alert("修改成功")
							 parent.window.location.href="<%=request.getContextPath()%>/user/toShow"

					 }
				 })
	 }

	 $(function(){
		 // 实现复选框回显  所有的爱好(把所有爱好的值那过来)
		 var boxObj = $("input:checkbox[name='hobby']");
		 // 用户选择的爱好  0,1,2,3  ${user.hobby}就是选择的修改对象的爱好值
		 var hobbys = "${user.hobby}";
		 // 数组对象
		 var hobbyArr = hobbys.split(',');
		 //index是固定的代表下标， hobby代表相当遍历数组的那个变量名，即出来的东西；
		 $.each(hobbyArr, function(index, hobby){
			 boxObj.each(function () {
				 if($(this).val() == hobby) {  //如果所有的爱好(把所有爱好的值那过来)的值和用户选的相等，那就默认被选中
					 $(this).attr("checked",true);
				 }
			 });
		 });
	 });

</script>
<!-- 错误时提示颜色 -->
<style>
	.error{
		color:red;
	}
</style>
</head>
<body>
<form id="fm" >
         <input type="hidden" name="id" value="${user.id}"/>
	用户名:<input type="text" name="userName" value="${user.userName}"/><br />
	密    码:<input type="text" name="password" value="${user.password}"/><br />
	邮箱<input type = "text" name = "email" value="${user.email}"/><br/>
	年龄<input type = "text" name = "age"  value="${user.age}"/><br/>
	爱好:足球<input type="radio" name="hobby"  value="0"/><br />
	篮球<input type="radio" name="hobby"  value="1"/><br />
	皮球<input type="radio" name="hobby"  value="2"/><br />
	女<input type= "radio" name= "sex" value ="0"<c:if test="${user.sex==0}">checked="checked"</c:if>>
	男<input type= "radio" name= "sex" value ="1"<c:if test="${user.sex==1}">checked="checked"</c:if>><br/>
	<input type="button" value="修改" onclick="upd()"/>
</form>
</body>
</html>