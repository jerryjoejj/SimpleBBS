<!-- 帖子详情 -->

<%@page pageEncoding="UTF-8" %>

<%@page import="java.sql.ResultSet" %>

<%@page import="com.lovemanai.entity.Article" %>
<%@page import="com.lovemanai.db.DB" %>

<%
	request.setCharacterEncoding("UTF-8");
	String strId = request.getParameter("id");
	Article a = null;
	int errorCode = 0;
	
	
	if(strId == null || strId.trim() == null) {
		errorCode = 1;//错误代码为1，传入帖子编码错误 
		%>
			<jsp:forward page="" >
				<jsp:param value="<%=errorCode %>" name="errorCode"/>
			</jsp:forward>
		<%
		return;
	}
	
	int id = 0;
	try {
		id = Integer.parseInt(strId);
	} catch(NumberFormatException e) {
		errorCode = 1;
		%>
			<jsp:forward page="" >
				<jsp:param value="<%=errorCode %>" name="errorCode"/>
			</jsp:forward>
		<%
		return;
	}
%>


<%
	String sql = "select * from article where id = " + id;
	ResultSet rs =(ResultSet)DB.excuteSQL(sql);
	if(rs.next()) {
		a = Article.initFromResultSet(rs);
	}
	
	if(a == null) {
		errorCode = 2;//错误代码为2，访问帖子不存在
		%>
			<jsp:forward page="" >
				<jsp:param value="<%=errorCode %>" name="errorCode"/>
			</jsp:forward>
		<%
		return;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0042)http://bbs.51cto.com/thread-1139316-1.html -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>本人收集了一套零基础从Java开始到Android的学习资料 - Java论坛 -  51CTO技术论坛_中国领先的IT技术社区</title>
<meta name="keywords" content="IT论坛"></meta>
<meta name="MSSmartTagsPreventParsing" content="True"></meta>
<meta http-equiv="MSThemeCompatible" content="Yes"></meta>
<link href="./page_style/global.css" rel="stylesheet" type="text/css" />
<link href="./page_style/viewthread.css" rel="stylesheet" type="text/css" />
<link href="./page_style/map_menu.css" rel="stylesheet" type="text/css" />
<link href="./page_style/add.css" rel="stylesheet" type="text/css" />
<link href="./page_style/nav.css" rel="stylesheet" type="text/css" />
<link href="./page_style/art_master_top.css" rel="stylesheet" type="text/css" />
<link href="./page_style/shCore.css" type="text/css" rel="stylesheet" />
<link href="./page_style/shThemeDefault.css" type="text/css" rel="stylesheet" />
<link href="./page_style/bbspass.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="first"> <a href="http://bbs.51cto.com/"><img src="./page_style/logo.jpg" /></a></div>
<div class="w960">
  <div class="pagebox">
    <ul>
      <li><a href="http://bbs.51cto.com/forum-133-1.html" class="pre">返回列表</a></li>
      <li><a class="abg">1</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=2">2</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=3">3</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=4">4</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=5">5</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=6">6</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=7">7</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=8">8</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=9">9</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=10">10</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=18" class="last">... 18</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=2" class="next">下一页</a></li>
    </ul>
  </div>
</div>
<div class="clear hr10"></div>
<div class="tz_main">
  <form method="post" name="modactions">
    <input type="hidden" name="formhash" value="0c6e4035" />
    <table id="pid5824360" summary="pid5824360" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tbody>
        <tr>
          <td class="postauthor bd4b" valign="top"><div class="popupmenu_popup userinfopanel" id="userinfo5824360_menu" style="display: none;">
              <dl>
                <dt>积分</dt>
                <dd>44&nbsp;</dd>
                <dd>当前离线 </dd>
                <dt>注册时间</dt>
                <dd>2014-12-16&nbsp;</dd>
                <dt>最后登录</dt>
                <dd>2015-1-22&nbsp;</dd>
              </dl>
              <p><a href="http://bbs.51cto.com/space-uid-9737346.html" target="_blank">论坛详细资料</a></p>
            </div>
            
            <!--标签信息-->
            
            <div class="author01 bd4b"> 查看:<span>6449</span><em>|</em>回复：<span>349</span></div>
            <cite> <a href="http://home.51cto.com/index.php?s=/space/9737346" target="_blank" id="userinfo5824360" class="dropmenu" onmouseover="showMenu(this.id)">lovemanai</a>&nbsp;<img src="./page_style/arrow.gif" class="ml5"  /> </cite>
            <div class="avatar"><img src="./page_style/avatar.php" /></div>
            <p class="post_zw">新新人类 <img src="./page_style/star_level1.gif" alt="Rank: 1" /></p>
            <dl class="profile">
              <!-- edit at 20120601 by jacena-->
              <dt>帖子</dt>
              <dd><a href="http://home.51cto.com/apps/bbs/index.php?s=/Index/index/uid/9737346" style="color:#336699;text-decoration: underline;" target="_blank">13</a>&nbsp;</dd>
              <dt>精华</dt>
              <dd><a href="http://bbs.51cto.com/digest.php?authorid=9737346" target="_blank" style="color:#336699;text-decoration: underline;">0</a>&nbsp;</dd>
              <dt>无忧币</dt>
              <dd style="color:#666666"><a style="color:#336699;text-decoration: underline;" href="http://home.51cto.com/index.php?s=/Account/credit" target="_blank" rel="523">523 </a></dd>
            </dl>
            <ul>
              <li class="space"><a href="http://pay.51cto.com/space.php?uid=9737346" target="_blank">个人空间</a></li>
              <li class="pm"><a href="http://home.51cto.com/index.php?s=/Notify/write/uid/9737346" target="_blank">发短消息</a></li>
              <li class="buddy"><a href="http://home.51cto.com/index.php?s=/space/9737346" target="_blank" id="ajax_buddy_0">家园好友</a></li>
              <li class="blog"> <a target="_blank" href="http://blog.51cto.com/blog.php?uid=9737346">他的博客</a> </li>
              <li class="online"><a target="_blank" href="http://down.51cto.com/9737346">他的资源</a></li>
              <li style="background:url(http://home.51cto.com/thumb.php?w=15&amp;h=15&amp;t=f&amp;url=http://home.51cto.com/data/uploads/20130625/15/51c94d8136342.gif) no-repeat left center;width:100px"><a target="_blank" href="http://edu.51cto.com/user/user_id-9737346.html?edu_recommend_adid=103">他的课程中心</a></li>
            </ul></td>
          <td align="center" valign="top" class="tz_right bd4"><div class="postinfo01 bd4">
              <h2 style="float: left;font-size:16px;vertical-align:middle">&nbsp;&nbsp;<strong><a title="本人收集了一套零基础从Java开始到Android的学习资料" href="./page_style/本人收集了一套零基础从Java开始到Android的学习资料 - Java论坛 - 51CTO技术论坛_中国领先的IT技术社区.html"><%=a.getTitle() %></a></strong>&nbsp;</h2>
              <p class="fr">  
              </p>
            </div>
            <div class="clear"></div>
            <div class="postinfo02">
              <p class="postinfo02a">发表于&nbsp;2015-1-20 14:01&nbsp;<span>|</span>&nbsp;来自&nbsp; <a href="http://bbs.51cto.com/" target="_blank" title="">51CTO网页</a> </p>
            </div>
            <p class="postinfo03"> </p>
            <span id="postnum5824360"></span>
            <div class="postmessage defaultpost">
              <div id="ad_thread3_0"></div>
              <div id="ad_thread4_0"></div>
              <div id="postmessage_5824360" class="t_msgfont"><%=a.getCont() %><br />
                <br />
              </div>
              <script src="./page_style/tag.php" type="text/javascript"></script>
              <div id="post_rate_div_5824360"></div>
              <br />
              <br />
              <br />
              <div style="color:#a3a3a3;font-size:12px;text-align:right;height:30px;line-height:30px;"> 本帖最后由 yuke198907 于 2015-3-2 13:37 编辑 </div>
              <div style=""></div>
            </div></td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </form>
  <!--提交--> 
</div>
<div class="w960">
  <div class="pagebox">
    <ul>
      <li><a href="http://bbs.51cto.com/forum-133-1.html" class="pre">返回列表</a></li>
      <li><a class="abg">1</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=2">2</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=3">3</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=4">4</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=5">5</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=6">6</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=7">7</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=8">8</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=9">9</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=10">10</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=18" class="last">... 18</a></li>
      <li><a href="http://bbs.51cto.com/viewthread.php?tid=1139316&extra=&page=2" class="next">下一页</a></li>
    </ul>
  </div>
</div>
<div class="clear hr10"></div>

</body>
</html>