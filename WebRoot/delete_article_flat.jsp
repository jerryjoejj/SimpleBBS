<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.lovemanai.db.DB" %>
<%@include file="_sessioncheck.jsp" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
//删除帖子，将数据库中rootid相同的帖子删除
	String strRootId = request.getParameter("rootid");
	int rootId = Integer.parseInt(strRootId);
	String url = request.getParameter("from");
	DB.excuteDML("delete from article where rootid = " + rootId);
	response.sendRedirect(url);
%>