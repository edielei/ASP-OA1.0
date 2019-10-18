<!--#include file="../Easp/Easp.asp"-->
<%
if not(Easp.CheckDataFrom()) then Easp.RR "/"
Easp.RemoveCookie "uinfo"
%>