<!--#include file="../Easp/Easp.asp"-->
<%
if not(Easp.CheckDataFrom()) then Easp.RR "/"
Dim uname,da,jg,m,a,b
uname=Easp.Post("uname:s")
da=Easp.Post("da:s")
jg=Easp.db.RT("Users","uname='"&uname&"' and da='"&da&"'","id")
if Easp.Has(jg) then
da=Easp.RandStr("10")
Call Easp.db.UR("Users","id="&jg,Array("upwd:"&Easp.Md5(da)))
Easp.SetCookie "uname", uname, DateAdd("M", 1, now())
Easp.SetCookie "upwd", da, DateAdd("M", 1, now())
m=Easp.db.RT("Users","uname='"&uname&"'","email,zname")
Easp.W da
a=Easp.GetUrl("")
b=Easp.GetUrl(1)
a=Replace(a,b,"")
Easp.Ext("ed").Send_EMail m(0), "网络办公系统", "您的网络办公系统登录密码已被重置，请立即登录并更换新密码！", "尊敬的"&m(1)&" ,您好:<br />您的用户名是："&uname&"<br />密码重置为："&da&"<br />网络办公系统网址：<a href="""&a&""" target=""_blank"">"&a&"</a><br />注：系统自动发送邮件，请勿直接回复。"
Else
Easp.W "Err"
End if
%>