<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.lovemanai.db.DB" %>


<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int rootId = Integer.parseInt(request.getParameter("rootid"));
	int pId = Integer.parseInt(request.getParameter("pid"));
	String title = request.getParameter("title");
	String cont = request.getParameter("cont");
	
	String sql = "insert into article values(null,?,?,?,?,now(),?)";	
	DB.excuteDML(sql, pId, rootId, title, cont, 0);
	DB.excuteDML("update article set isleaf = 1 where id = " + pId);
%>

<%
		String jspName = request.getParameter("jspName");
System.out.println(jspName);
%>
<html>
<head>
<script type="text/javascript">

function delayURL(url) {
	var delay = document.getElementById("time").innerHTML;
	if(delay > 0) {
		delay--;
		document.getElementById("time").innerHTML = delay;
	} else {
		window.top.location.href = url;
	}
    setTimeout("delayURL('" + url + "')", 1000);
}

</script>
</head>
<body>
	<span id="time">5</span>秒后自动跳转，如果没有跳转，请点击下面链接
	<a href="<%=jspName %>">主题列表</a>
	<script type="text/javascript">
		var url = "<%= jspName%>";
		delayURL(url);
alert(url);
	</script>
</body>

</html>

