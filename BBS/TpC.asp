<!--#include file="../Inc/BbsCs.asp"-->
<%
Dim id,xx,r,tp,list,i,jg,a,u
id=Easp.Post("id:n")
xx=Easp.Post("xx:s")	'投票项
if Easp.IsN(id) then Easp.WE "Err"
r=db.RT("Tp","id="&id,"sl,unames")	'r(0)投票数 r(1)投票用户
tp=Replace(r(0),","," ")
Set list=Easp.list.New
list.data=tp
xx=split(xx,",")
For i=0 to UBound(xx)
a=Cint(xx(i))
list(a)=list(a)+1
Next
xx=list.tostring	'xx投票数+1
u=Replace(r(1),","," ")
list.data=u
list.Push Easp.Cookie("uinfo>uname:s")	'增加投票用户
u=list.tostring		'u投票用户+1
jg=db.UR("Tp","id="&id,Array("sl:"&xx,"unames:"&u))
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.W jg
%>