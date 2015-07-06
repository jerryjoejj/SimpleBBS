<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.lovemanai.db.DB" %>
<%@page import="java.sql.ResultSet" %>

<%
	request.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	
	//使用上一个帖子的最大id作为rootid，解决帖子rootid的问题
	String sqlMaxId = "select max(id) from article";
	ResultSet rs = DB.excuteSelect(sqlMaxId);
	int maxId = 0;
	if(rs.next()) {
		maxId = rs.getInt(1);
	}
	
	//为啥进行这样的判断
	if(action != null && action.trim().equalsIgnoreCase("post")) {
		String title = request.getParameter("title");
		String cont = request.getParameter("cont");
		String sql = "insert into article values(null,?,?,?,?,now(),?)";
		DB.excuteDML(sql,0,maxId+1,title,cont,0);
		response.sendRedirect("article_flat.jsp");
	}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    <title>发表新主题</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script src="ckeditor/ckeditor.js"></script>
	<link rel="stylesheet" href="ckeditor/samples/sample.css" />
	
  </head>
  
  <body>
   <form method="post" action="post.jsp">
   		<input type="hidden" name="action" value="post" />
   		<div align="left">
		<label>
			请输入主题：
		</label>
		<input type="text" name="title" /><br />
		<label for="editor1">
			请输入帖子内容：
		</label>
		<textarea class="ckeditor" cols="80" id="editor1" name="cont" rows="10"></textarea>
		<input type="submit" value="发表" />
	</div>
   </form>
  </body>
</html>
