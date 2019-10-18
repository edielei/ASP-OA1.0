<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,jg
id=Easp.Post("id:n:0")
jg=Easp.db.RT("uinfo","id="&id,"uid")
jg=Easp.db.UR("users","id="&jg,"xs=True")
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.Fso.CopyFile "../Common/WdGGCommon.xml" ,"../Common/wdgg/"&id&".xml"
Easp.W jg
%>