<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.lovemanai.db.DB" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String goTo = request.getParameter("goto");
	int pid = Integer.parseInt(request.getParameter("pid"));
	int rootId = Integer.parseInt(request.getParameter("rootid"));
	String sql = "delete from article where rootid = " + rootId + " and pid >= " + pid;
System.out.println(sql);
	DB.excuteDML(sql);
	response.sendRedirect(goTo);
%>