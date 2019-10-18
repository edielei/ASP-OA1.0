<!--#include file="Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>什么什么什么有限公司内部网络办公系统</title>
<link rel="stylesheet" href="Css/Style.css">
<link rel="stylesheet" href="Css/Admin.css">
<link rel="stylesheet" href="Js/skins/aero.css">
<link rel="stylesheet" href="Css/powerFloat.css" />
<script src="Js/jQuery.js"></script>
<script src="Js/jquery.artDialog.js"></script>
<script src="Js/artDialog.iframeTools.js"></script>
<script src="Js/jquery-powerFloat-min.js"></script>
<script src="Js/Admin.js"></script>
<script>
function EditMM(){
	$.getScript('Js/vd.js');
	var editmm=art.dialog({id:'editmm',title:'修改密码',content:'<div id="xgmm">用 户 名：<input value="<%=Easp.Cookie("uinfo>uname:s")%>" readonly="readonly" /><br />新的密码：<input type="password" id="xgmma" /><br />确认密码：<input type="password" id="xgmmb" /></div>',duration:0,padding:0,resize:false,lock:true,
	ok:function(){
		var xgmma=$('#xgmma').vd('请输入新的密码！',1);if(!xgmma){return false}
		var xgmmb=$('#xgmmb').vd('请输入确认密码！',1);if(!xgmmb){return false}
		if(xgmma!=xgmmb){
			alert('两次输入密码不相同，请重新输入！');
			$('#xgmm').find(':password').val("").end().add('#xgmma').focus();
			return false;
		}
		$.post("C/CPass.asp",{'upwd':xgmma},function(a){
			switch(a){
				case 'Err':alert('操作失败！');location.reload();break;
				case 'OK':editmm.close();
				art.dialog({title:'提示',icon:'succeed',duration:0,content:'修改密码成功，您的当前密码为：<strong style="color:#FF0000;font-family:Tahoma;">'+xgmma+'</strong>',resize:false,lock:true,ok:true})
				break;
			}
		});
	},
	cancel:true});
	$('#xgmma').focus();
}
</script>
</head>
<body>
<!-- 头部 -->
<div id="top">
<div class="tleft"></div>
<div class="tright">
<div class="lj"><a href="Main.asp" class="asy" target="mkj">网站首页</a> <a href="javascript:Exit()" class="atc">安全退出</a></div>
<div class="sj"><%Easp.W Easp.DateTime(now(),"yyyy年mm月dd日 星期w")%></div>
</div>
<div class="tcenter"><span><img src="Images/AM_u.gif" alt="" /><strong><%Easp.WH Easp.db.RT("V_U","uname='"&Easp.Cookie("uinfo>uname")&"'","zname")%></strong> 欢迎您登录本系统！</span></div>
</div>
<!-- 中间部分 -->
<div id="center">
<div class="cl">
<div class="logo"></div>
<div style="position:relative">
  <div class="menus">
    <div id="mm">
      <h3>用户管理设置</h3>
      <div><a href="Main.asp" target="mkj">后台首页</a></div>
      <div><a href="javascript:EditMM();">修改密码</a></div>
      <div><a href="javascript:Exit();">退出系统</a></div>
    </div>
    <div id="menus"><!--#include file="Inc/MainM.asp"--></div>
  </div>
  <div class="sq"><img src="Images/sq.png" alt="" /></div>
</div>
</div>
<!-- 中间右边 -->
<div class="cr">
<h3>内部邮件</h3><div id="mails"></div>
<h3>工作日程</h3><div id="rl"><!--#include file="Inc/IncDate.asp"--></div>
<h3>讨论区</h3><div id="bbs" style="border-bottom:1px #B7C7BE solid;"></div>
</div>
<!-- 中间中间部分 -->
<div class="cc">
<div class="tp"></div>
<div id="mains">
<!-- 中间中间部门上方导航栏 -->
<div id="nav"><a href="Main.asp" target="mkj">我的办公桌</a><%if Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname")&"'","ishr") then%><a href="Hr" target="mkj">人力资源</a><%End If%><a href="BBS" target="mkj">企业社区</a><a href="Office" target="mkj">个人办公</a><a href="Mails" target="mkj">我的邮箱</a><%if Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname:s")&"'","issys") then%><a href="Manager" target="mkj">系统管理</a><%End if%><a href="Help" target="mkj">系统帮助</a><a href="javascript:Exit();">注销退出</a></div>
<div id="main"><iframe id="mkj" name="mkj" frameborder="0" src="Main.asp"></iframe></div>
</div>
</div>
</div>
<!-- 版权 -->
<div id="copyright">技术支持：<a href="http://www.edielei.com/" target="_blank">雷德明</a></div>
</body>
</html>