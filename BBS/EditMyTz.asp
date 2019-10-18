<!--#include file="../Inc/BbsCs.asp"--><%
Dim id,a
id=Easp.Get("id:n:0")
a=db.RT("thread","uname='"&Easp.Cookie("uinfo>uname")&"' and id="&id,"bt,bkid,fj,nr")
if Easp.IsN(a) then Easp.RR "MyTz.asp"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>EditTz</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Editor/kindeditor.js"></script>
<script>
KE.show({
    id:'nr',
    allowFileManager:true,
    fileManagerJson : '../../filem/file_manager_json.asp',
    imageUploadJson : '../../filem/upload_json.asp',
    allowPreviewEmoticons:false,
    resizeMode:1,
    minHeight:100,
    urlType:'absolute'
});
$(function(){
	$('.td:eq(3)').load('Inc/BkXz.asp?'+ +new Date,function(){
		$('#bkid').val('<%=a(1)%>');
	});	
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		var bkid=$('#bkid').vd('请选择所属版块！',1);if(!bkid){return}
		var files=$('#files').contents().find('span');
		if(files.length==0){files=$('#tu').val()}else{files=files.html()}
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入内容！');KE.focus('nr');return !1;}
		$.post('EditMyTzC.asp','id=<%=id%>&bt='+bt+'&bkid='+bkid+'&files='+files+'&nr='+nr,function(a){
			switch(a){
				case 'OK':alert('修改成功！');location.replace('<%=Request.ServerVariables("HTTP_REFERER")%>');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
<tr><th class="th" colspan="2">&nbsp;编辑帖子</th></tr>
<tr><td width="62" align="right" class="td">标题：</td><td class="td"><input id="bt" class="input" value="<%Easp.WH a(0)%>" /></td></tr>
<tr><td width="62" align="right" class="td">所属版块：</td><td class="td"></td></tr>
<tr><td width="62" align="right" class="td">附件：</td><td class="td"><input type="hidden" id="tu" value="<%=a(2)%>" /><iframe id="files" src="../C/UpF.asp" frameborder="0" height="24" width="400"></iframe><br />不修改请留空！</td></tr>
<tr><td width="62" align="right" class="td">内容：</td><td class="td"><textarea id="nr" style="width:100%;height:260px;"><%Easp.W Easp.Ext("ed").htmlspecialchars(a(3))%></textarea></td></tr>
<tr><td>&nbsp;</td><td style="padding:2px;"><input id="tj" type="submit" value="确定" class="btn" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td></tr>
</table>
</body>
</html>