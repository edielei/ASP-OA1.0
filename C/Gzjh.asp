<!--#include file="../Inc/GzjhCs.asp"-->
<%
Dim sj,r
sj=Easp.Post("sj:d:"&now)
r=db.RT("Gzjh","format(kssj,'yyyy-mm-dd')='"&Easp.DateTime(sj,"yyyy-mm-dd")&"' and uname='"&Easp.Cookie("uinfo>uname:s")&"'","id")
if Easp.Has(r) then
Easp.W "OK"
Else
Easp.W "No"
End if
%>