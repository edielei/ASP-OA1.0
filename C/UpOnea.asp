<!--#include file="../Inc/CSe.asp"-->
<%
Dim id,t,dqpx,mbpx,jg
id=Easp.Get("id:n")
t=Easp.Get("t:s")
dqpx=Easp.db.RT(t,"id="&id,"pxa")  '获取当前排序值
mbpx=Easp.db.RT(t,"pxa > "&dqpx&" order by pxa asc","id,pxa")  '上一级ID是mbpx(0)，上一级排序mbpx(1)
if Easp.IsN(mbpx) then
Easp.Ext("ed").rb
end if
Call Easp.db.UR(t,"id="&id,"pxa="&mbpx(1))   '修改当前排序为目标排序
jg=Easp.db.UR(t,"id="&mbpx(0),"pxa="&dqpx)   '修改目标排序为当前排序
if jg<>0 then
Easp.Ext("ed").rb
End if
%>