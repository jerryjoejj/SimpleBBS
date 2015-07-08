<%@page pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");
	String userName = "";
	String password = "";
	if(action != null && action.trim().equals("login")) {
		userName = request.getParameter("admin");
		password = request.getParameter("pwd");
		if(userName.trim().equals("admin") && password.trim().equals("admin")) {
			session.setAttribute("adminLogined", "true");
			response.sendRedirect("article_flat.jsp");
		} else {
			out.println("用户名或密码错误！");
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0076)https://www.oschina.net/home/login?goto_page=http%3A%2F%2Fwww.oschina.net%2F -->
<html  lang="zh-CN"  xml:lang="zh-CN"  xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link  rel="shortcut icon"  type="image/x-icon"  href="./login_style/favicon.ico"/>
<title>后台管理</title>
<link  rel="stylesheet"  href="./login_style/channel.css"  type="text/css"  media="screen"/>
<link  rel="stylesheet"  type="text/css"  href="./login_style/jquery.fancybox-1.3.4.css"  media="screen"/>
<link  rel="alternate"  type="application/rss+xml"  title="开源中国 - 源码列表"  href="http://www.oschina.net/code/source_rss"/>
<style  type="text/css"></style>
<link  rel="stylesheet"  href="./login_style/tip-yellowsimple.css"  type="text/css"/>
<style>
/* 登录注册等相关页面的样式 */

#OSC_Footer {border:0;}
#user_page {
	font-size:10pt;
	overflow:hidden;
	background:#fff;
	border:1px solid #ddd;
	padding:20px;
}
#user_page #form_user {float:left;width:650px;}
#user_page #form_user h2 {font-size:16pt;f
ont-weight:normal;color:#333;border-bottom:2px solid #ddd;margin:0 50px 0 0;padding-bottom:10px;}

#OSChinaLoginTip {clear:both;display:block;margin:40px 0 20px 0;color:#060;}
#OSChinaLoginTip ul {overflow:hidden;margin:15px 0 0 0;}
#OSChinaLoginTip ul li {float:left; width:100px;}
#OSChinaLoginTip ul li#openid_gmail img {margin-top:8px;}
#OSChinaLoginTip ul li#openid_yahoo img {margin-top:15px;}
#OSChinaLoginTip ul li#openid_msn img {}
#OSChinaLoginTip ul li#openid_github img {margin-top:8px;}
#OSChinaLoginTip ul li#openid_sina img {margin-top:8px;}

#user_page #login_tip {float:right;width:300px;font-size:10.5pt;color:#666;}
#user_page #login_tip h3 {margin:30px 0 10px 0;font-size:11pt;}
#user_page #login_tip ol {
	font-size:10pt;
	padding:10px 5px;
	list-style-type: decimal;
	list-style-position: inside;
}

#user_page form th {font-size:10.5pt;text-align:right;padding:10px;}
#user_page form td {vertical-align:middle;}
#user_page form input.TEXT {font-size:16px;padding:3px;border:1px solid #ccc;}
#user_page form input.TEXT:focus {border:1px solid #40AA53;outline: none;}
#user_page form select {font-size:16px;padding:3px;}
#user_page form input.BUTTON {
	font-size:14px;
	padding:0 5px;
	height:30px;
}
#user_page form input.SUBMIT {font-weight:bold;}
</style>
</head>
<body>
<div  id="OSC_Banner">
  <div  class="wp998">
    <h1>后台管理系统</h1>
    <div  class="clear"></div>
  </div>
</div>
<div  id="OSC_Screen">
  <div  id="OSC_Content"  class="CenterDiv">
    <div  id="user_page">
      <form  id="form_user" method="post" action="login.jsp">
      	<input type="hidden" name="action" value="login"/>
        <div>
          <h2  style="margin:5px; border-bottom:2px solid #080707;float:left;margin:8px;"  id="login_h2">登录后台</h2>
          <div  style="clear:both;"></div>
        </div>
        <div  style="float: left;"  id="login_osc">
          <table>
            <tbody>
              <tr>
                <th></th>
                <td><div  id="error_msg"  class="error_msg"  style="display:none;"></div></td>
              </tr>
              <tr>
                <th >管理员账号：</th>
                <td><input  type="text"  name="admin"  id="f_email"  class="TEXT" style="width:200px;"/></td>
              </tr>
              <tr>
                <th>登录密码：</th>
                <td><input  type="password"  name="pwd"  id="f_pwd"  class="TEXT"  style="width:200px;"/></td>
              </tr>
              <tr  class="buttons">
                <th>&nbsp;</th>
                <td><input  type="submit"  value="登录"  class="BUTTON SUBMIT"/></td>
              </tr>
            </tbody>
          </table>
        </div>       
      </form>   
    </div>
    <div  class="clear"></div>
  </div>
</div>
<div  id="fancybox-tmp"></div>
<div  id="fancybox-loading">
  <div></div>
</div>
<div  id="fancybox-overlay"></div>
<div  id="fancybox-wrap">
  <div  id="fancybox-outer">
    <div  class="fancybox-bg"  id="fancybox-bg-n"></div>
    <div  class="fancybox-bg"  id="fancybox-bg-ne"></div>
    <div  class="fancybox-bg"  id="fancybox-bg-e"></div>
    <div  class="fancybox-bg"  id="fancybox-bg-se"></div>
    <div  class="fancybox-bg"  id="fancybox-bg-s"></div>
    <div  class="fancybox-bg"  id="fancybox-bg-sw"></div>
    <div  class="fancybox-bg"  id="fancybox-bg-w"></div>
    <div  class="fancybox-bg"  id="fancybox-bg-nw"></div>
    <div  id="fancybox-content"></div>
    <a  id="fancybox-close"></a>
    <div  id="fancybox-title"></div>
  <a  href="javascript:;"  id="fancybox-left"><span  class="fancy-ico"  id="fancybox-left-ico"></span></a><a  href="javascript:;"  id="fancybox-right"><span  class="fancy-ico"  id="fancybox-right-ico"></span></a></div>
</div>
</body>
</html>