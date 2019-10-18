<!--#include file="../Inc/Cse.asp"-->
<%
Dim id,qx,isgg,iszy,istxl,iskq,isyj,yjlx,ishr,isbbs,istp,issys,iswl,jg,mailr
id=Easp.Post("id:n:0")
qx=Easp.Post("qx:n")
if qx=1 then	'普通员工
jg=Easp.db.RT("Users","id="&id,"zcgh")	'获取注册时填写的工号
jg=Easp.db.UR("uinfo","gh='"&jg&"'","uid="&id)	'判断档案中是否存在此工号档案
jg=Easp.db.RT("uinfo","uid="&id,"id")	'关联用户名信息
Call Easp.Fso.CopyFile("../Common/WdGGCommon.xml","../Common/wdgg/"&jg&".xml")	'创建公告文件，用作判断是否已读及未读
jg=Easp.db.UR("Users","id="&id,Array("xs:True","utime:"&now,"zid:"&jg,"qx:1"))		'使该用户可以登录系统，审核通过时间及管理用户档案信息
'==============================================================
'【这里面写发送电子邮件通知审核通过信息】
mailr=Easp.db.RT("Users","id="&id,"zname,uname,email")
Easp.Ext("ed").Send_EMail mailr(2), "网络办公系统", "用户注册审核通过", "尊敬的"&mailr(0)&"，你的注册信息已审核通过，请使用你的用户名："&mailr(1)&"进行登录<br />网络办公系统网址：<a href=""http://"&Request.ServerVariables("SERVER_NAME")&""" target=""_blank"">"&Request.ServerVariables("SERVER_NAME")&"</a><br />注：系统自动发送邮件，请勿直接回复。"
'==============================================================
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.WE jg
ElseIf qx=2 then	'所有权限
yjlx=Easp.Post("yjlx")	'获取意见类型，0为办公室，1为经理
jg=Easp.db.RT("Users","id="&id,"zcgh")	'获取注册时填写的工号
jg=Easp.db.UR("uinfo","gh='"&jg&"'","uid="&id)	'判断档案中是否存在此工号档案
jg=Easp.db.RT("uinfo","uid="&id,"id")	'关联用户名信息
Call Easp.Fso.CopyFile("../Common/WdGGCommon.xml","../Common/wdgg/"&jg&".xml")	'创建公告文件，用作判断是否已读及未读
jg=Easp.db.UR("Users","id="&id,Array("xs:True","utime:"&now,"zid:"&jg,"isgg:true","iszy:true","iswl:true","istxl:true","iskq:true","isyj:true","ishr:true","isbbs:true","istp:true","issys:true","yjlx:"&yjlx,"qx:2"))		'使该用户可以登录系统，审核通过时间及管理用户档案信
'==============================================================
'【这里面写发送电子邮件通知审核通过信息】
mailr=Easp.db.RT("Users","id="&id,"zname,uname,email")
Easp.Ext("ed").Send_EMail mailr(2), "网络办公系统", "用户注册审核通过", "尊敬的"&mailr(0)&"，你的注册信息已审核通过，请使用你的用户名："&mailr(1)&"进行登录<br />网络办公系统网址：<a href=""http://"&Request.ServerVariables("SERVER_NAME")&""" target=""_blank"">"&Request.ServerVariables("SERVER_NAME")&"</a><br />注：系统自动发送邮件，请勿直接回复。"
'==============================================================
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
jg=Easp.db.RT("Users","id="&id,"zcgh")	'获取注册时填写的工号
jg=Easp.db.UR("uinfo","gh='"&jg&"'","uid="&id)	'判断档案中是否存在此工号档案
jg=Easp.db.RT("uinfo","uid="&id,"id")	'关联用户名信息
Call Easp.Fso.CopyFile("../Common/WdGGCommon.xml","../Common/wdgg/"&jg&".xml")	'创建公告文件，用作判断是否已读及未读
jg=Easp.db.UR("Users","id="&id,Array("xs:True","utime:"&now,"zid:"&jg,"isgg:"&isgg,"iszy:"&iszy,"iswl:"&iswl,"istxl:"&istxl,"iskq:"&iskq,"isyj:"&isyj,"ishr:"&ishr,"isbbs:"&isbbs,"istp:"&istp,"issys:"&issys,"yjlx:"&yjlx,"qx:3"))		'使该用户可以登录系统，审核通过时间及管理用户档案信
'==============================================================
'【这里面写发送电子邮件通知审核通过信息】
mailr=Easp.db.RT("Users","id="&id,"zname,uname,email")
Easp.Ext("ed").Send_EMail mailr(2), "网络办公系统", "用户注册审核通过", "尊敬的"&mailr(0)&"，你的注册信息已审核通过，请使用你的用户名："&mailr(1)&"进行登录<br />网络办公系统网址：<a href=""http://"&Request.ServerVariables("SERVER_NAME")&""" target=""_blank"">"&Request.ServerVariables("SERVER_NAME")&"</a><br />注：系统自动发送邮件，请勿直接回复。"
'==============================================================
jg = Easp.IIF(jg<>0, "OK", "Err")
Easp.WE jg
End if
%>