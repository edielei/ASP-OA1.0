<!--#include file="../Inc/CSe.asp"--><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpF</title>
<style type="text/css">body{margin:0; font-family:\5B8B\4F53; font-size:12px}span{height:20px; line-height:20px}</style>
</head>
<body><%
Dim sj,path,jpeg
Easp.Use "Upload"
Easp.Upload.Allowed = "jpg|jpeg|gif|psd|doc|docx|rar|7z|pdf|png|flv|zip|xls|csv|txt"
Easp.Upload.FileMaxSize = 1024*25	'只能上传25M以内的文件
Easp.Upload.SavePath = "../Upfiles/files/<yyyymm>/"
Easp.Upload.StartUpload()
If Easp.Error.LastError>"" Then
Set Easp.Upload = Nothing
Easp.Alert Easp.Error(Easp.Error.LastError)
Easp.W("Err")
End If
sj=Easp.DateTime(now(),"ddhhiiss")&Easp.RandStr("100000-999999")&"."&Easp.Upload.File("pic").Ext
Easp.Upload.File("pic").SaveAs Easp.Upload.File("pic").NewPath &sj
path="Upfiles/files/"&Easp.DateTime(now(),"yyyymm")&"/"&sj
Easp.W("<lable>文件上传成功，文件保存在：</lable><span id=""p"">"&path&"</span>")
%></body>
</html>