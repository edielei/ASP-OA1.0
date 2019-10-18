<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="../Css/Add.css">
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
    minHeight:150,
    urlType:'absolute'
})
$(function(){
	var s=$('#tj');
	s.click(function(){
		var mc=$('#mc').vd('请输入公司名称！',1);if(!mc){return}
		var dh=$('#dh').vd('请输入公司电话！',1);if(!dh){return}
		var cz=$('#cz').vd('请输入公司传真！',1);if(!cz){return}
		var wz=$('#wz').vd('请输入公司网址！',1);if(!wz){return}
		var yb=$('#yb').vd('请输入公司邮编！',1);if(!yb){return}
		var dz=$('#dz').vd('请输入公司地址！',1);if(!dz){return}
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入公司简介！');KE.focus('nr');return !1;}
		$.post("IndexC.asp",'mc='+mc+'&dh='+dh+'&cz='+cz+'&wz='+wz+'&yb='+yb+'&dz='+dz+'&nr='+nr,function(a){
			alert('修改成功！');
			location.reload();
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr>
		<th colspan="2" class="th">&nbsp;单位管理</th>
	</tr><%Easp.XML.Open("Index.xml")%>
    <tr>
    	<td width="62" class="td">公司名称：</td>
   	  <td class="td"><input id="mc" class="input" style="width:250px;" value="<%Easp.WH Easp.XML("info>mc").Text%>" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="62" class="td">公司电话：</td>
   	  <td class="td"><input id="dh" class="input" style="width:250px;" value="<%Easp.WH Easp.XML("info>dh").Text%>" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="62" class="td">公司传真：</td>
   	  <td class="td"><input id="cz" class="input" style="width:250px;" value="<%Easp.WH Easp.XML("info>cz").Text%>" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="62" class="td">网站地址：</td>
   	  <td class="td"><input id="wz" class="input" style="width:250px;" value="<%Easp.WH Easp.XML("info>wz").Text%>" /> ("http://" 开头) <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="62" class="td">邮政编号：</td>
   	  <td class="td"><input id="yb" class="input" style="width:250px;" value="<%Easp.WH Easp.XMl("info>yb").Text%>" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="62" class="td">公司地址：</td>
   	  <td class="td"><input id="dz" class="input" style="width:320px;" value="<%Easp.WH Easp.XML("info>dz").Text%>" /> <em title="必填项">*</em></td>
    </tr><%Easp.XML.Close%>
    <tr>
    	<td width="62" class="td">公司简介：</td>
   	  <td class="td"><textarea id="nr" style="width:100%;height:200px;"><%Easp.W Easp.Ext("ed").htmlspecialchars(Easp.Fso.Read("IndexNr.html"))%></textarea></td>
    </tr>
    <tr>
    	<td width="62">&nbsp;</td>
   	  <td style="padding:2px;"><input id="tj" type="submit" value="确定" class="btn" /> <input type="reset" value="重置" class="btn" onclick="location.reload()" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td>
    </tr>
</table>
</body>
</html>