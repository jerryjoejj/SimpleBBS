<!-- 树状形式展现帖子 -->


<%@page pageEncoding="UTF-8"%>
<%@page import="com.lovemanai.entity.Article" %>
<%@page import="com.lovemanai.db.DB" %>

<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.SQLException" %>



<%
//分页问题
	int pageSize = 3;

	String strPageNo = request.getParameter("pageNo");
	int pageNo = 0;
	
	int totalRecords = 0;
	ResultSet rsPage = DB.excuteSelect("select count(*) from article where pid = 0");
	if(rsPage.next()) {
		totalRecords = rsPage.getInt(1);
	}
	
	if(strPageNo == null || strPageNo.trim().equals("") || strPageNo.trim().equals("0")) {
		pageNo = 1;
	}
	 else {
		pageNo = Integer.parseInt(strPageNo);
	}
	
	int totalPage = totalRecords/pageSize + 1;
	if(pageNo > totalPage) {
		pageNo = totalPage;
	}
	int startPos = (pageNo - 1) * pageSize; 
	ResultSet rs = DB.excuteSelect("select * from article where pid = 0 order by pdate desc limit " + startPos + ","+ pageSize);
	
	List<Article> articles = new ArrayList<Article>();
	try {
		while(rs.next()) {
			Article a = Article.initFromResultSet(rs);
			articles.add(a);
		}
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		DB.close(rs);
	}
%>

<%
	String url = request.getScheme() + "://" + request.getHeader("host") 
				+ request.getRequestURI() + (request.getQueryString() == null ? "" : "?" + request.getQueryString()) ;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0037)http://bbs.51cto.com/forum-133-1.html -->
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Java论坛 -  51CTO技术论坛_中国领先的IT技术社区</title>
<link  href="./page_style/global.css"  rel="stylesheet"  type="text/css" />
<link  href="./page_style/map_menu.css"  rel="stylesheet"  type="text/css" />
<link  href="./page_style/style.css"  rel="stylesheet"  type="text/css" />
<link  href="./page_style/sidebar.css"  rel="stylesheet"  type="text/css" />
<link  href="./page_style/art_master_top.css"  rel="stylesheet"  type="text/css" />
<link  href="./page_style/nav.css"  rel="stylesheet"  type="text/css" />
<link  href="./page_style/jiathis_share.css"  rel="stylesheet"  type="text/css" />
<link  href="./page_style/bbspass.css"  rel="stylesheet"  type="text/css" />
</head>
<body>
<div  class="first"><a  href="http://bbs.51cto.com/"  target="_blank"  class="logo"><img  src="./page_style/logo.jpg" /></a> </div>
<div  class="w960">
  <div  class="row01z">
    <div  class="wlgl">
      <div  class="wlgl_tit">
        <h3  id="cdis">Java论坛</h3>
      </div>
      <div  class="banz"></div>
    </div>
  </div>
  <div  class="clear hr10"></div>
</div>
<div  id="ad_plate"></div>
<div  class="tabbox">
  <div  class="tab_z01"> <a  class="sd03 fl"  href="http://bbs.51cto.com/forumdisplay.php?fid=133">全部主题</a></div>
  <div  class="fr"  style="width:308px;">
    <div  class="btnbox"  id="newspecial"> <a  href="post.jsp"  title="发新话题"> <img  src="./page_style/newtopic_hov.gif"  class="fr" /> </a>
      <div  id="newspecial_menu"  style="display:none;"  class="tw_float">
        <ul>
          <li><a  href="http://bbs.51cto.com/post.php?action=newthread&fid=133&extra=page%3D1"><img  src="./page_style/folder_s.gif"  />发新话题</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div  class="clear"></div>
<div  class="t_main"  style="position:relative;">
  <div  class="t_main01">
    <div  class="t_header">
      <p  class="t_author">作者</p>
      <p  class="t_reply">回复/查看</p>
      <p  class="t_lastPost">最后发表</p>
    </div>
  </div>
  <form  method="post"  name="moderate"  action="http://bbs.51cto.com/topicadmin.php?action=moderate&fid=133">
    <div  class="trbg">
      <table  width="100%"  border="0"  cellspacing="0"  cellpadding="0"  align="center"  id="mytable">
      
      <%
      	for(int i = 0; i < articles.size(); i++) {
      		Article a = articles.get(i);
      		String pStr = "";
      		
      %>
      
        <tbody>
          <tr>
            <td  colspan="8"  align="center"  valign="middle"  id="fjx"  class="fjx"></td>  
          </tr>
          <tr  class="t_item">
          	<td><a href="delete_article_flat.jsp?rootid=<%=a.getRootId()%>&from=<%=url%>">DEL</a></td> 
            <td  width="27"  align="center"  valign="middle"><a  href="javascript:void(0)"></a></td>
            <td width="32"  colspan="3"  align="left"  valign="middle"  class="common"><span  id="thread_1139316"> <a  href="article_flat_detail.jsp?id=<%=a.getId() %>&rootid=<%=a.getRootId() %>"  target="_blank"  ><%=a.getTitle() %></a> </span></td>
            <td  width="120"  align="left"  valign="middle"  class="by"><a  href="http://bbs.51cto.com/space-uid-9737346.html">lovemanai</a> <br />
              <%=new SimpleDateFormat("yyyy-MM-dd HH:MM").format(new Date(System.currentTimeMillis())) %> </td>
            <td  width="70"  align="left"  valign="middle"  class="td03"><a  href="http://bbs.51cto.com/thread-1139316-1.html"  target="_blank">348</a> <br />
              6437 </td>
            <td  width="130"  align="left"  valign="middle"  class="by"><a  href="http://bbs.51cto.com/space-username-doggiejohn.html">doggiejohn</a> <br />
              2015-06-17 20:30:13 </td>
          </tr>
        </tbody>
        
        <%
        	}
        %>
      </table>
    </div>
    <div  class="clear"></div>
  </form>
</div>
<div  class="pagebox">
  <ul>
  	<li><a  href="article_flat.jsp?pageNo=<%=pageNo - 1 %>" >上一页</a></li>
    <li><a  href="article_flat.jsp?pageNo=<%=1 %>">1</a></li>
    <li><a  href="article_flat.jsp?pageNo=<%=pageNo + 1 %>" >下一页</a></li>
  </ul>
</div>
<div  style="display:none">  
</div>
</body>
</html>