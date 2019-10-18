<!--#include file="../Easp/Easp.asp"-->
<%
if not(Easp.CheckDataFrom()) then Easp.RR "/"
Dim uname,wt,jg
uname=Easp.Post("uname:s")
wt=Easp.db.RT("Users","uname='"&uname&"'","wt")
if Easp.isN(wt) then
Easp.WE "Err"
Else
Easp.W wt
End if
%>