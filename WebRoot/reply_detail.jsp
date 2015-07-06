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
