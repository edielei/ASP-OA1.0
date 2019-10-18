<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim id,jg
id=Easp.Get("id:n:0")
jg=db.RT("thread","bkid="&id,"id")
if Easp.Has(jg) then
Easp.Alert "该版块下存在帖子信息，请先将此版块下的所有帖子删除！"
Else
jg=db.DR("bk","id="&id)
if jg<>0 then
Easp.Ext("ed").rb
else
Easp.Alert "操作失败！"
End if
End if
%>