<!--#include file="Cse.asp"-->
<%
Dim db
Set db=Easp.db.New
db.Conn=db.OpenConn(1,"/db/bbs.asp","")
Response.Charset = "UTF-8"
%>