<!--#include file="../Inc/Cse.asp"-->
<%
Dim fwq,uname,pwd,jg
fwq=Easp.Post("fwq:s")
uname=Easp.Post("uname:s")
pwd=Easp.Post("pwd:s")
Easp.XML.Open("EmailSet.xml")
Easp.XML("host").Value=fwq
Easp.XML("user").Value=uname
Easp.XML("pwd").Value=pwd
Easp.XML.Save()
Easp.W "OK"%>