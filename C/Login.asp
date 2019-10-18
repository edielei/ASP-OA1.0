<!--#include file="../Easp/Easp.asp"-->
<%
IF Not(Easp.CheckDataFrom()) Then Easp.RR "/"
Dim yzm,yz
yzm = Session("yzcode")
if Easp.isN(yzm) then
Easp.WE "xtcs"
End IF
yz=Easp.post("yzcode")
IF yz<>yzm Then
Easp.WE "yzerr"
End if
Dim uname,upwd,rs,jg
uname=Easp.post("uname:s:0")
upwd=Easp.post("upwd:s:0")
rs=Easp.db.RT("Users","uname='"&uname&"' and upwd='"&Easp.Md5(upwd)&"' and xs=True","zid,isgg,ishr,iszy")
jg=Easp.IIF(Easp.Has(rs),"OK","Err")
IF jg="OK" Then
Session.Abandon()
Call Easp.db.UR("Users","uname='"&uname&"'",Array("ltime:"&now,"uip:"&Easp.GetIp(),"ucs:ucs+1"))
Easp.SetCookie "uname", uname, DateAdd("M", 1, now())
'Easp.SetCookie "upwd", upwd, DateAdd("M", 1, now())
Dim rd
rd=Easp.db.RT("Uinfo","id="&rs(0),"bmid")
Easp.SetCookie "uinfo>uid", rs(0), 0	'用户编号
Easp.SetCookie "uinfo>uname", uname, 0	'用户名
Easp.SetCookie "uinfo>bmid", rd, 0	'部门Id
Easp.SetCookie "uinfo>iszy", rs(3), 0
Easp.W "OK"
Else
Easp.W "Err"
End if
%>