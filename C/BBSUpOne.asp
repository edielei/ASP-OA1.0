<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim id,t,dqpx,mbpx,jg
id=Easp.Get("id:n")
t=Easp.Get("t:s")
dqpx=db.RT(t,"id="&id,"px")  '获取当前排序值
mbpx=db.RT(t,"px > "&dqpx&" order by px asc","id,px")  '上一级ID是mbpx(0)，上一级排序mbpx(1)
if Easp.IsN(mbpx) then
Easp.Ext("ed").rb
end if
Call db.UR(t,"id="&id,"px="&mbpx(1))   '修改当前排序为目标排序
jg=db.UR(t,"id="&mbpx(0),"px="&dqpx)   '修改目标排序为当前排序
if jg<>0 then
Easp.Ext("ed").rb
End if
%>