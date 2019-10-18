<!--#include file="../Inc/BbsCs.asp"--><%Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("Tz_bk","id="&id,"id,bkid,bt,cs,hfcs,tzbt")
if Easp.IsN(r) then Easp.RR "Index.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>TzShow</title>
<link rel="stylesheet" href="../Css/TzShow.css" />
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Editor/kindeditor.js"></script>
<script>
KE.show({
    id:'nr',
	//allowFileManager:true,
    fileManagerJson : '../../filem/file_manager_json.asp',
    imageUploadJson : '../../filem/upload_json.asp',
	items:['bold','italic','underline','strikethrough','removeformat','|','insertorderedlist','insertunorderedlist','|','textcolor','bgcolor','fontname','fontsize','|','link','unlink','emoticons','image','flash','|','selectall','fullscreen'],
    resizeMode:1,
    minHeight:150,
    urlType:'absolute',
	afterCreate : function(id) {
		KE.event.ctrl(document, 13, function() {
			KE.sync(id);
			$('#tj').click();
			return false;
		});
		KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
			KE.sync(id);
			$('#tj').click();
			return false;
		});
	}
});
$(function(){
	var a=$('.page:last').html();
	$('.page:first').html(a);
	var s=$('#tj');
	s.click(function(){
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入回复内容！');KE.focus('nr');return !1;}
		$.post('AddHfC.asp','id=<%=id%>'+'&nr='+nr,function(a){
			switch(a){
				case 'OK':alert('已成功回复！');location.replace('<%=Easp.GetUrl("id")%>');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
//大的回复按钮事件
function hf(){
	window.scrollTo(0,9000);
	KE.focus('nr');
}
//回复具体楼层
function hfhf(num){
	var a=$('.users').eq(num-1).text();	//获取回复哪个人
	var b=$('.lc').eq(num-1).text();
	KE.html('nr','<strong>回复 <a href="<%=Easp.GetUrl(1)%>#'+num+'">'+b+'</a> '+a+'</strong><br /><br />');
	hf();
}
</script>
</head>
<body>
<div class="dh"><img src="../Images/home.png" alt="" />&nbsp;<a href="Index.asp">社区首页</a>&nbsp;&gt;&nbsp;<a href="BkT.asp?id=<%=r(1)%>"><%Easp.WH r(2)%></a>&nbsp;&gt;&nbsp;<%Easp.WH r(5)%></div>
<div class="page"></div>
<table border="0" cellpadding="0" cellspacing="0" class="ta">
<tr>
	<td width="135" align="center">查看:<%=r(3)%> | 回复:<%=r(4)%></td><td><strong><%Easp.WH r(5)%></strong></td>
</tr>
</table>
<table class="tz" border="0" cellpadding="0" cellspacing="0">
<%
Dim sql,rs,t,i
Set sql=db.GRS("select bt,nr,uname,sj,fj from thread where id="&id&" union all select bt,nr,uname,sj,'' as fj from hf where tid="&id)
Set rs=db.GPR("rs:10",sql)	'分页数设置
if Easp.IsN(rs) then
Easp.RR "BkT.asp?id="&r(1)
Else
t=rs.GetRows(rs.PageSize)
db.C(rs)
db.SetPager "default", "{prev}{liststart}{list}{listend}{next}",Array("listlong:5","prev:上一页","next:下一页")
For i=0 to UBound(t,2)
%><tr><td width="135" align="center"><strong><a class="users" href="mailto:<%Easp.WH Easp.db.RT("V_U","uname='"&t(2,i)&"'","email")%>"><%Easp.WH Easp.db.RT("V_U","uname='"&t(2,i)&"'","zname")%></a></strong></td><td><div style="position:relative;"><img src="../Images/online_member.gif" alt="" align="absbottom" />&nbsp;发表于：<%=Easp.DateTime(t(3,i),"yyyy-mm-dd hh:ii:ss")%><div class="lc" style="position:absolute;right:0;top:0;"><a name="<%=i+1%>" href="#<%=i+1%>"><%Easp.Ext("ed").lc("&nbsp;"&(db.PageIndex-1)*db.PageSize+1+i&"楼")%></a></div></div></td></tr>
<tr><td width="135" align="center" valign="top" class="face"><img src="../Images/face.png" alt="" width="120" height="120" /><div style="font-weight:700;margin-top:2px;"><%Easp.WH Easp.db.RT("V_U","uname='"&t(2,i)&"'","bm")%></div></td><td valign="top" class="nr"><%Easp.W t(1,i)%><br /><br /><%Easp.W Easp.IIF(Easp.Has(t(4,i)),"<a href=""../"&t(4,i)&""" target=""_blank""><strong>附件下载："&t(4,i)&"</strong></a>","")%></td></tr>
<tr><td align="center" valign="top" style="border-bottom:2px #DDD solid;">&nbsp;</td><td valign="top" class="nr" style="border-bottom:2px #DDD solid;"><a href="javascript:hfhf(<%=i+1%>);"><img src="../Images/fastreply.gif" alt="" align="absmiddle" /> 回复</a></td></tr><%Next%></table>
<div class="page"><div><a href="AddTz.asp?bkid=<%=r(1)%>"><img src="../Images/ftie.png" alt="" /></a> <a href="javascript:hf();"><img src="../Images/hftie.png" alt="" /></a></div><%Easp.W db.GetPager("")%></div><%End if%>
<table border="0" cellpadding="0" cellspacing="0" class="hf">
<tr>
<td width="135" align="center" valign="top"><span class="face"><img src="../Images/face.png" alt="" width="120" height="120" /></span>
<div style="font-weight:700;"><%Easp.WH Easp.db.RT("V_U","uname='"&Easp.Cookie("uinfo>uname")&"'","zname")%></div></td>
<td><textarea id="nr" style="width:99.9%;height:168px;visibility:visible"></textarea><input id="tj" type="submit" value="回复帖子" class="btn" /> (提交快捷键：Ctrl+Enter)</td>
</tr>
</table>
<div style="height:10px;font-size:0;"></div>
<%
call db.UR("thread","id="&id,"cs=cs+1")
%>
</body>
</html>