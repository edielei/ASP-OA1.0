<!--#include file="Easp/Easp.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>什么什么有限公司内部网络办公系统</title>
<link rel="stylesheet" href="Css/Login.css" />
<link rel="stylesheet" href="Js/skins/aero.css">
<script src="Js/jQuery.js"></script>
<script src="Js/jquery.artDialog.js"></script>
<script src="Js/artDialog.iframeTools.js"></script>
<script src="Js/Login.js"></script>
</head>
<body>
<div id="all">
  <div id="top"></div>
  <div id="main">
    <div style="position:relative">
      <div id="mainl"></div>
      <div id="mainr">
        <div class="dl"></div>
        <div class="sr">
          <table cellspacing="0">
            <tr><td align="right">用户名：</td><td><input id="uname" class="srk" value="<%Easp.W Easp.Cookie("uname:s")%>" /></td></tr>
            <tr><td align="right">密　码：</td><td><input id="upwd" type="password" class="srk" /></td></tr>
            <tr><td align="right">验证码：</td><td><input id="yzcode" class="srk" maxlength="4" /><img id="yzm" src="Images/yzcode.asp" alt="验证码" title="看不清楚？点击刷新" /></td></tr>
          </table>
          <div id="dlan"><input type="image" src="Images/dl_bntdl.jpg" alt="" /><input type="image" src="Images/dl_btnqx.jpg" alt="" /><input type="image" src="Images/dl_btnzc.jpg" alt="" onClick="reg()" /><input type="image" src="Images/dl_btnwjmm.jpg" alt="" onClick="mm()" /></div>
        </div>
      </div>
    </div>
  </div>
  <div id="bottom"><span class="right">技术支持：<a href="http://www.edielei.com/" target="_blank">雷德明</a>&emsp;</span><span class="center">Copyright &copy; 2010-<%=year(now)%> All Rights Reserved</span></div>
</div>
</body>
</html>