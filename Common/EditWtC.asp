<!--#include file="../Inc/Cse.asp"-->
<%
Dim wt,da,jg
wt=Easp.Post("wt:s")
da=Easp.Post("da:s")
jg=Easp.db.UR("Users","uname='"&Easp.Cookie("uinfo>uname:s")&"'",Array("wt:"&wt,"da:"&da))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>