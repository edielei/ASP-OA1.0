<%if Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname")&"'","isgg") then%><h3>公司公告</h3><span><a href="GongGao/list.asp" target="mkj">浏览公司公告</a></span><span><a href="GongGao/Add.asp" target="mkj">发布公司公告</a></span><span><a href="GongGao/Gl.asp" target="mkj">管理公司公告</a></span><h3>政策法规</h3><span><a href="Zcfg/list.asp" target="mkj">浏览政策法规</a></span><span><a href="Zcfg/Add.asp" target="mkj">发布政策法规</a></span><span><a href="Zcfg/Gl.asp" target="mkj">管理政策法规</a></span>
<%Else%>
<h3><a href="GongGao/list.asp" target="mkj">公司公告</a></h3>
<h3><a href="Zcfg/list.asp" target="mkj">政策法规</a></h3>
<%end if%>
<h3>资源共享</h3>
<span><a href="Zy/List.asp" target="mkj">查看资源文件</a></span><span><a href="Zy/Add.asp" target="mkj">发布资源文件</a></span><span><a href="Zy/Gl.asp" target="mkj">管理资源文件</a></span>
<h3>通讯录</h3>
<span><a href="Txl/Nb.asp" target="mkj">内部通讯录</a></span><span><a href="Txl/Bsc.asp" target="mkj">办事处通讯录</a><%if Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname")&"'","istxl") then%>| <a href="Txl/BscGl.asp" target="mkj">管理</a><%End if%></span><span><a href="Txl/Kh.asp" target="mkj">客户通讯录</a><%if Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname")&"'","istxl") then%>| <a href="Txl/KhGl.asp" target="mkj">管理</a><%End if%></span>
<h3>办公常用信息</h3>
<span><a href="Common/Gsjj.asp" target="mkj">公司简介</a></span><span><a href="Wz/List.asp" target="mkj">常用网址</a></span><span><a href="javascript:Wnl();">万年历</a></span><span><a href="javascript:ybcx()">邮编号码</a></span><span><a href="javascript:void((function(d){if(!!d){d.toggle();return;};var src='http://dict.qq.com/cloudgetjs';var e=document.createElement('script');e.setAttribute('src',src);document.getElementsByTagName('head')[0].appendChild(e);})(window.QQCloudDict))">在线翻译</a></span>
<h3>考勤登记</h3>
<span><a href="javascript:kqwc();">外出登记</a> | <a href="KaoQin/SeeWc.asp" target="mkj">查看</a></span> <span><a href="javascript:kqqj();">请假登记</a> | <a href="KaoQin/SeeQj.asp" target="mkj">查看</a></span><span><a href="javascript:kqcc();">出差登记</a> | <a href="KaoQin/SeeCc.asp" target="mkj">查看</a></span><%if Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname")&"'","iskq") then%><span><a href="KaoQin/Gl.asp" target="mkj">考勤登记管理</a></span><%End If%><%if Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname")&"'","isyj") then%><h3>意见信箱</h3><span><a href="Yj/Add.asp" target="mkj">发表意见</a></span><span><a href="Yj/Gl.asp" target="mkj">意见管理</a></span><%Else%><h3><a href="Yj/Add.asp" target="mkj">发表意见</a></h3><%End if%>