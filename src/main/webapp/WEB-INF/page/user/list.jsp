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
	
	$(function () {
		search();
	})

	function search() {
		$.post("<%=request.getContextPath()%>/user/show",
			$("#fm").serialize(),
			function(data){
				var html = "";
                var pageHtml="";
				for (var i = 0; i < data.data.userList.length; i++) {
					var d = data.data.userList[i];
                    html += "<tr>";
                    html += "<td>"+d.id+"</td>";
					html += "<td>"+d.userName+"</td>";
                    html += "<td>"+d.password+"</td>";
                    html += "<td>"+d.age+"</td>";
                    if(d.sex==0){
                        html += "<td>女</td>";
                    }
                    else if(d.sex==1){
                        html += "<td>男</td>";
                    }

                    html += "<td>"+d.email+"</td>";
                    html += "<td>"+d.createTime+"</td>";
                    html += "<td>"+d.hobby+"</td>";
                    if(d.hobby==0){
                        html += "<td>学习</td>";
                    } else if(d.hobby==1){
                        html += "<td>篮球</td>";
                    }else if(d.hobby==2){
                        html += "<td>足球</td>";
                    }
                    html += "<td>"
                    html += "<button type='button'  onclick='update("+d.id+")'>修改</button>"
                    html += "<button type='button'  onclick='del("+d.id+")'>删除</button>"
                    html += "</td>"
                    html += "</tr>";

				}
                $("#tbd").html(html);

			})
	}




    function page(temp,pages){
        var page = $("#pageNo").val();
        if(temp == 0) {
            if(parseInt(page) - 1 < 1) {
                alert("已是首页");
                return;
            }
            $("#pageNo").val(parseInt(page) - 1);
        }
        if(temp == 1){
            if(parseInt(page) + 1 > pages){
                alert("已经尾页了");
                return;
            }
            $("#pageNo").val(parseInt(page) + 1);
        }
        search();

    }


	 
	function update(id) {
        window.location.href="<%=request.getContextPath()%>/user/toUpdate/?id="+id
	}


	function del(id) {
		$.post(
			"<%=request.getContextPath()%>/user/delete",
			{"id":id},
			function(data){
				if (data.code == 200) {
				    alert("删除成功")
					search();
				}
			}) 
	}

</script>
</head>
<body>
<a href="<%=request.getContextPath()%>/user/toAdd">增加</a>
<a href="<%=request.getContextPath()%>/user/toAdds">批量增加</a>

<form id="fm">
<input type="hidden" value="1" id="pageNo" name="pageNo"/>
用户名：<input type="text" name="userName"  >
        女<input type="radio" name="sex" value="0">
        男<input type="radio" name="sex" value="1">
<input  type = "button" value = "搜索"   onclick="search()">
</form>

  <table >
     <thead>
      <tr>
		<th>id</th>
		<th>姓名</th>
		<th>密码</th>
		<th>年龄</th>
		<th>性别</th>
		<th>邮箱</th>
		<th>时间</th>
		<th>爱好</th>
          <th>操作</th>
      </tr> 
    </thead>
     <tbody id="tbd"></tbody>
  </table>
<div id = "pageDiv"></div>
</body>
</html>