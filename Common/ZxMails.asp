<!--#include file="../Inc/MailCs.asp"-->
<%
Dim rs,t,i
Set rs=db.GR("SMail:id,bt,isread:5","isdel = false and sjr='"&Easp.Cookie("uinfo>uname:s")&"'","id desc")
if Easp.IsN(rs) then
Easp.W "<span>&nbsp;暂无邮件！</span>"
Else
t=rs.GetRows()
db.C(rs)
For i = 0 to UBound(t,2)
%>
<span <%Easp.W Easp.IIF(t(2,i),"","style=""font-weight:700;""")%>><img src="../Images/<%Easp.W Easp.IIF(t(2,i),"","n")%>mail.png" alt=""><a href="Mails/See.asp?id=<%=t(0,i)%>" onClick="Menus('Email.asp')" target="mkj"><%Easp.WH Easp.CutStr(t(1,i),"26:...")%></a></span><%
Next
End if
%>
<span style="border:none;font-family:'\5B8B\4F53';text-align:right;"><a href="Mails" target="mkj" title="查看更多" onClick="Menus('Email.asp')">查看更多&gt;&gt;</a>&nbsp;</span>
