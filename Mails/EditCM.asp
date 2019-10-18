<!--#include file="../Inc/MailCs.asp"--><%
Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("CMail","id="&id,"unames,bt,fj,nr,sjr")
if Easp.IsN(r) then Easp.RR "CMail.aso"
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Edit</title>
<link rel="stylesheet" href="../Css/Inc.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
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
	art.dialog.removeData('unames');
	art.dialog.removeData('znames');
	$('#sjr').focus(function(){
		var unames=encodeURIComponent($(this).attr('unames'));
		if(unames===undefined){unames=''}
		art.dialog.open('/Mails/Lxr.asp?unames='+unames,{id:'mailsjr',title:'选择收件人',lock:true,resize:false,duration:0,
			ok:function(){
				zx();
			},
			cancel:true
		},false);
		function zx(){
			var unames=art.dialog.data('unames');
			var znames=art.dialog.data('znames');
			if(unames===undefined){
				$('#sjr').val('');
				$('#sjr').attr('unames','');
			}else{
				$('#sjr').val(''+znames+'');
				$('#sjr').attr('unames',''+unames+'');
			}
			art.dialog.close();
		}
	});
	var s=$('#tj'),bc=$('#bc');
	//发送邮件
	s.click(function(){		
		var sjr=$('#sjr').vd('请选择收件人！',1);if(!sjr){return}
		sjr=encodeURIComponent($('#sjr').attr('unames'));
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		var files=$('#files').contents().find('span');
		if(files.length==0){files='';}else{files=files.html()}
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入内容！');KE.focus('nr');return !1;}
		var fjx=$('#fjx').attr('checked');
		$('body').html('<p style="font-weight:700;padding:5px">邮件发送中，请稍后...</p>');
		$.post('WMailC.asp','sjr='+sjr+'&bt='+bt+'&files='+files+'&nr='+nr+'&fjx='+fjx,function(a){
			switch(a){
				case 'OK':alert('发送成功！');location.replace('SMail.asp');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
	
	//保存修改
	bc.click(function(){
		var unames=$('#sjr').vd('请选择收件人！',1);if(!unames){return}
		var sjr=encodeURIComponent($('#sjr').attr('unames'));
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		var files=$('#files').contents().find('span');
		if(files.length==0){files='';}else{files=files.html()}
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入内容！');KE.focus('nr');return !1;}
		$.post('CMailBc.asp','id=<%=id%>&sjr='+sjr+'&bt='+bt+'&files='+files+'&nr='+nr+'&unames='+unames,function(a){
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
<table border="0" cellpadding="0" cellspacing="00" class="table">
<tr><th class="th" colspan="2">&nbsp;编辑草稿箱</th></tr>
<tr><td width="50" align="right" class="td">收件人：</td><td class="td"><input id="sjr" class="input" value="<%Easp.WH r(0)%>" style="width:400px;" readonly="readonly" unames="<%Easp.WH r(4)%>" /> <em title="必填项">*</em></td></tr>
<tr><td width="50" align="right" class="td">主题：</td><td class="td"><input id="bt" class="input" value="<%Easp.WH r(1)%>" style="width:350px;" /> <em title="必填项">*</em></td></tr>
<tr><td align="right" class="td">附件：</td><td class="td"><iframe id="files" src="../C/UpF.asp" frameborder="0" height="24" width="400"></iframe></td></tr>
<tr><td width="50" align="right" class="td">内容：</td><td class="td"><textarea id="nr" style="width:100%;height:250px;"><%Easp.W Easp.Ext("ed").htmlspecialchars(r(3))%></textarea></td></tr>
<tr>
  <td align="right" class="td">&nbsp;</td>
  <td class="td"><label for="isf"><input id="fjx" type="checkbox" />保存到发件箱(发送邮件才能保存发件箱)</label></td>
</tr>
<tr><td width="50" align="right">&nbsp;</td><td style="padding:2px;"><input id="tj" type="submit" value="发送" class="btn" /> <input id="bc" type="button" value="保存" class="btn" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td></tr>
</table>
</body>
</html>