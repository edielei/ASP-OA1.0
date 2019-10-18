<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,qx,isgg,iszy,istxl,iskq,isyj,yjlx,ishr,isbbs,istp,issys,iswl,jg
id=Easp.Post("id:n:0")
qx=Easp.Post("qx:n")
if qx=1 then	'普通员工
jg=Easp.db.UR("Users","id="&id,Array("isgg:false","iszy:false","iswl:false","istxl:false","iskq:false","isyj:false","ishr:false","isbbs:false","istp:false","issys:false","yjlx:"&yjlx,"qx:1"))		'修改用户权限
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.WE jg
ElseIf qx=2 then	'所有权限
yjlx=Easp.Post("yjlx")	'获取意见类型，0为办公室，1为经理读
jg=Easp.db.UR("Users","id="&id,Array("isgg:true","iszy:true","iswl:true","istxl:true","iskq:true","isyj:true","ishr:true","isbbs:true","istp:true","issys:true","yjlx:"&yjlx,"qx:2"))		'修改用户权限
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.WE jg
Else					'【自定义权限】
isgg=Easp.Post("isgg")	'获取公告及政策法规管理权限
iszy=Easp.Post("iszy")	'获取资源共享管理权限
istxl=Easp.Post("istxl")	'获取通讯录管理权限
iskq=Easp.Post("iskq")		'获取考勤管理权限
yjlx=Easp.Post("yjlx")		'获取意见类型管理权限
isyj=Easp.IIF(yjlx<2,true,false)	'获取意见管理权限
ishr=Easp.Post("ishr")		'获取人力资源管理权限
isbbs=Easp.Post("isbbs")	'获取讨论区管理权限
istp=Easp.Post("istp")		'获取投票管理权限
issys=Easp.Post("issys")	'获取系统管理权限
iswl=Easp.Post("iswl")		'获取网络会议管理权限
yjlx=Easp.Post("yjlx")	'获取意见类型，0为办公室，1为经理
jg=Easp.db.UR("Users","id="&id,Array("isgg:"&isgg,"iszy:"&iszy,"iswl:"&iswl,"istxl:"&istxl,"iskq:"&iskq,"isyj:"&isyj,"ishr:"&ishr,"isbbs:"&isbbs,"istp:"&istp,"issys:"&issys,"yjlx:"&yjlx,"qx:3"))		'修改用户权限
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.WE jg
End if
%>