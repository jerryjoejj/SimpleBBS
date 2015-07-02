<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	int errorCode = Integer.parseInt(request.getParameter("errorCode"));
	switch(errorCode) {
		case 1:
			%>
				<script type="text/javascript">
					alter("帖子id错误")
				</script> 
			<%
		case 2:
			%>
				<script type="text/javascript">
					alter("访问的帖子不存在")
				</script> 
			<%
	}
%>