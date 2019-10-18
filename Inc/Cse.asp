<!--#include file="../Easp/Easp.asp"-->
<%
IF Easp.IsN(Easp.Cookie("uinfo>uname")) Then
Easp.WE Easp.JsCode("window.top.location.replace('/');")
End if
%>