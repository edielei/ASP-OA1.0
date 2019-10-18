<%
Class EasyAsp_Ed
    
	
	Private Author_s

	Private Sub Class_Initialize()
		Author_s = "EdieLei"
		Easp.Error(10001) = "Error! Accept number only."
	End Sub
	
	'设置属性
	Public Property Get Author()
		Author = Author_s
	End Property
	
	'ASP时间戳
	Public Function TimeStamp()
	    TimeStamp = DateDiff("s","1970-1-1 0:0:0", now)
	End Function
	
	
	'跳回上一来源
	Public Sub Rb()
		Easp.Ext("ed").rb
	End Sub
	
	'显示【显示或隐藏】图 a是显示字段值，b是Id值
	Public Sub IsShow(ByVal a,ByVal b)
	    Easp.W "<img class=""xs"" src=""../Images/"&Easp.IIF(a,"yes.gif","no.gif")&""" alt="""&b&"""/>"
	End Sub
	
	'普通删除，t是数据库表
	Public Sub PtDel(ByVal t)
	    id=Easp.Get("id:n")
		jg=Easp.db.DR(t,"id="&id)
		If jg<>0 then
        Rb()
        End If
	End Sub
	
	'删除所选，t是数据库表
	Public Sub DelAll(ByVal t)
	    id=Easp.Get("id")
		id=Easp.db.DR(t,"id in ("&id&")")
		If id<>0 then
		Rb()
		Else
		Easp.Alert("删除失败！")
		End If
	End Sub
	
	'后台显示类型选择，传数据库表t
	Public Sub XzTypes(ByVal t)
	    Easp.W "<select id=""types""><option value="""">请选择</option>"
	    Set XzTypesrs=Easp.db.GR(t&":id,types","xs=true","px desc")
    	If Easp.IsN(XzTypesrs) Then
        Easp.W "<option value="""">暂无分类</option>"
        Else
        t=XzTypesrs.GetRows()
        Easp.db.C(XzTypesrs)
        For i=0 to UBound(t,2)
    	Easp.W "<option value="""&t(0,i)&""">"&t(1,i)&"</option>"
    	Next
        End If
        Easp.W "</select>"
	End Sub
	
	'工作计划类别
	Public Sub JhTypes()
	    Easp.W "<select id=""typesid"" class=""input""><option value="""">请选择</option>"
	    Set JhTypesrs=db.GR("types:id,types","uname='"&Easp.Cookie("uinfo>uname:s")&"'","id desc")
    	If Easp.IsN(JhTypesrs) Then
        Easp.W "<option value="""">请先添加分类</option>"
        Else
        t=JhTypesrs.GetRows()
        db.C(JhTypesrs)
        For i=0 to UBound(t,2)
    	Easp.W "<option value="""&t(0,i)&""">"&t(1,i)&"</option>"
    	Next
        End If
        Easp.W "</select>"
	End Sub
	
	'网址类别
	Public Sub WzTypes()
	    Easp.W "<select id=""typesid"" class=""input""><option value="""">请选择</option>"
	    Set WzTypesrs=db.GR("types:id,types","uname='"&Easp.Cookie("uinfo>uname:s")&"'","px desc")
    	If Easp.IsN(WzTypesrs) Then
        Easp.W "<option value="""">请先添加分类</option>"
        Else
        t=WzTypesrs.GetRows()
        db.C(WzTypesrs)
        For i=0 to UBound(t,2)
    	Easp.W "<option value="""&t(0,i)&""">"&t(1,i)&"</option>"
    	Next
        End If
        Easp.W "</select>"
	End Sub
	
	'论坛版块列表框
	Public Sub BkTypes()
	    Easp.W "<select id=""bkid"" class=""input""><option value="""">请选择</option>"
	    Set BkTypesrs=db.GR("Bk:id,bt","xs=true","px desc")
    	If Easp.IsN(BkTypesrs) Then
        Easp.W "<option value="""">请先添加论坛板块</option>"
        Else
        t=BkTypesrs.GetRows()
        Easp.db.C(BkTypesrs)
        For i=0 to UBound(t,2)
    	Easp.W "<option value="""&t(0,i)&""">"&t(1,i)&"</option>"
    	Next
        End If
        Easp.W "</select>"
	End Sub
	
	'部门选择
	Public Sub BmXz()
	    Easp.W "<select id=""bm""><option value="""">请选择</option>"
	    Set BmXzrs=Easp.db.GR("Bm:id,bt","","px desc")
    	If Easp.IsN(BmXzrs) Then
        Easp.W "<option value="""">请添加部门</option>"
        Else
        t=BmXzrs.GetRows()
        Easp.db.C(BmXzrs)
        For i=0 to UBound(t,2)
    	Easp.W "<option value="""&t(1,i)&""">"&t(1,i)&"</option>"
    	Next
        End If
        Easp.W "</select>"
	End Sub
	
	'后台显示类型选择，传数据库表t,id【用于修改】
	Public Sub XzTypesId(ByVal t,ByVal id)
	    Easp.WC "<select id=""types"">"
	    Set XzTypesIdrs=Easp.db.GR(t&":id,types","","px desc")
    	If Easp.IsN(XzTypesIdrs) Then
        Easp.WC "<option value="""">暂无分类</option>"
        Else
        t=XzTypesIdrs.GetRows()
        Easp.db.C(XzTypesIdrs)
        For i=0 to UBound(t,2)
		if t(0,i)=Cint(id) then
		    Easp.WC "<option value="""&t(0,i)&""" selected=""selected"">"&t(1,i)&"</option>"
		Else
		   	Easp.WC "<option value="""&t(0,i)&""">"&t(1,i)&"</option>"
		End if
    	Next
        End If
        Easp.W "</select>"
	End Sub
	
	'jQuery 显示或隐藏操作
	Public Sub jqxs(ByVal t)
	jqxsstr = "$('.xs').click(function(){var zhi=$(this).attr('src'),id=$(this).attr('alt'),t=$(this);"
	jqxsstr = jqxsstr & "$.post('../C/Xs.asp','zhi='+zhi+'&id='+id+'&table="&t&"',function(a){switch(a){case 'Error':location.reload();break;"
	jqxsstr = jqxsstr & "case '0':t.attr('src','../Images/no.gif');break;case '1':t.attr('src','../Images/yes.gif');break;"
	jqxsstr = jqxsstr & "}})});"
	Easp.W jqxsstr
	End Sub
	
	'BBS版块 显示或隐藏操作
	Public Sub bbsxs(ByVal t)
	jqxsstr = "$('.xs').click(function(){var zhi=$(this).attr('src'),id=$(this).attr('alt'),t=$(this);"
	jqxsstr = jqxsstr & "$.post('../C/BBSXs.asp','zhi='+zhi+'&id='+id+'&table="&t&"',function(a){switch(a){case 'Error':location.reload();break;"
	jqxsstr = jqxsstr & "case '0':t.attr('src','../Images/no.gif');break;case '1':t.attr('src','../Images/yes.gif');break;"
	jqxsstr = jqxsstr & "}})});"
	Easp.W jqxsstr
	End Sub
	
	'右键排序
	Public Sub yjpx(ByVal id)
	yjpxstr = "<div style=""display:none;position:absolute;border:1px #CCC solid;background:#FFF;padding:2px 5px;line-height:18px;letter-spacing:1px"">"
	yjpxstr = yjpxstr & "<a href=""javascript:toTop("&id&");"">置 顶</a><br />"
	yjpxstr = yjpxstr & "<a href=""javascript:UpOne("&id&");"">上 移</a><br />"
	yjpxstr = yjpxstr & "<a href=""javascript:DownOne("&id&");"">下 移</a><br />"
	yjpxstr = yjpxstr & "<a href=""javascript:toBottom("&id&");"">置 后</a></div>"
	Easp.W yjpxstr
	End Sub
	
	'后台操作（修改|删除） 传ID
	Public Sub htcz(ByVal id)
	Easp.W Easp.Str("<a href=""Edit.asp?id={1}"">修改</a> | <a href=""Del.asp?id={1}"">删除</a>",id)
	End Sub
	
	'输出换行
	Public Function br(ByVal n)
	For i = 1 to n
	Easp.W "<br />"
	Next
	End Function
	
	'OA更新在线时间
	Public Sub online()
	Easp.XML.Open("/Common/Online.xml")
	Easp.XML("u[mz='admin']").Text=Easp.DateTime(now(),"yyyy-mm-dd hh:ii:ss")
	Easp.XML.Save
	Easp.XML.Close
	End Sub
	
	'企业社区楼层
	Public Sub lc(ByVal str)
	str=Replace(str,"&nbsp;1楼","楼主")
	str=Replace(str,"&nbsp;2楼","沙发")
	str=Replace(str,"&nbsp;3楼","板凳")
	str=Replace(str,"&nbsp;4楼","地板")
	str=Replace(str,"&nbsp;5楼","地下室")
	str=Replace(str,"&nbsp;","")
	Easp.W str
	End Sub
	
	'显示内容到编辑器里
	Public Function htmlspecialchars(ByVal str)
	str = Replace(str, "&", "&amp;")
	str = Replace(str, "<", "&lt;")
	str = Replace(str, ">", "&gt;")
	str = Replace(str, """", "&quot;")
	htmlspecialchars = str
	End Function
	
	'压缩数据库
	Public Function CompactDb(ByVal db,ByVal cdb)
		IF Easp.Fso.IsFile(Server.MapPath(db)) then
		Easp.C(Easp.db.Conn)
			Set Engine = Server.CreateObject("JRO.JetEngine")
			strPvd = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
			Engine.CompactDatabase strPvd&Server.MapPath(db),strPvd & Server.MapPath(cdb)
			Set Engine = Nothing
			Easp.Fso.DelFile Server.MapPath(db)
			Easp.Fso.MoveFile Server.MapPath(cdb),Server.MapPath(db)
			CompactDb = True
			Easp.C(Easp.Fso)
		Else
			CompactDb = False
		End IF
	End Function
	
	'SendEMail("收件人@qq.com", "发件人姓名", "标题", "正文内容")
	Public Sub Send_Email(ByVal toSend, ByVal FromName, ByVal subject, ByVal content)
	if Easp.IsInstall("Jmail.Message") then
	Easp.XML.Open("/Common/EmailSet.xml")
	Set jmail = Server.CreateObject("Jmail.Message")
	jmail.Silent = true
	jmail.Logging = true
	jmail.Charset = "utf-8"
	jmail.ContentType = "text/html"
	jmail.AddRecipient toSend
	jmail.From = Easp.XML("user").Text
	jmail.FromName = FromName
	jmail.Subject = subject
	jmail.Body = content
	jmail.Priority = 1
	jmail.MailServerUserName = Easp.XML("user").Text
	jmail.MailServerPassword = Easp.XML("pwd").Text
	jmail.Send(Easp.XML("host").Text)
	jmail.Close()
	Easp.XML.Close()
	End if
	End Sub
	
	
	'Define a 'Function'
	Public Function Return(ByVal s)
		Return = s
	End Function

End Class
%>