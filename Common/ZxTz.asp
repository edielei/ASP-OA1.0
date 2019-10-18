<!--#include file="../Inc/BbsCs.asp"-->
<%
Easp.C(db)
Dim rs,t,i
Set rs=db.GR("ZxTz:id,bt:5","","id desc")
if Easp.Has(rs) then
t=rs.GetRows()
db.C(rs)
For i=0 to UBound(t,2)
Easp.W "<span><img src=""Images/btyj.gif"" alt="""" /><a href=""BBS/TzShow.asp?id="&t(0,i)&""" target=""mkj"" onclick=""Menus('BBS.asp')"">"&Easp.CutStr(t(1,i),"30:...")&"</a></span>"
Next
Else
Easp.W "<span>&nbsp;暂无帖子！</span>"
End if
Easp.W "<span style=""border:none;font-family:'\5B8B\4F53';text-align:right;""><a href=""BBS"" target=""mkj"" title=""查看更多"" onclick=""Menus('BBS.asp')"">查看更多&gt;&gt;</a>&nbsp;</span>"
%>