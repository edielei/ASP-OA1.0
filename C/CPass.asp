<!--#include file="../Easp/Easp.asp"-->
<%
if not(Easp.CheckDataFrom()) then Easp.RR "/"
Dim upwd,uname,jg
upwd=Easp.Post("upwd:s")
uname=Easp.Cookie("uinfo>uname")
jg=Easp.db.UR("users","uname='"&uname&"'","upwd='"&Easp.MD5(upwd)&"'")
Easp.SetCookie "uname", uname, DateAdd("M", 1, now())
'Easp.SetCookie "upwd", upwd, DateAdd("M", 1, now())
Easp.W Easp.IIF(jg<>0,"OK","Err")
%>