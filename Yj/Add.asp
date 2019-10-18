<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Add</title>
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
    minHeight:200,
    urlType:'absolute'
})
$(function(){
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		var dx=$('#dx').vd('请选择要发给的对象！');if(!dx){return}	
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入内容！');KE.focus('nr');return !1;}
		$.post('AddC.asp','bt='+bt+'&dx='+dx+'&nr='+nr,function(a){
			switch(a){
				case 'OK':alert('发表成功，将跳转到我的办公桌！');location.replace('../Main.asp');break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="table">
	<tr><th colspan="2" class="th">&nbsp;发表意见</th></tr>
    <tr>
    	<td width="38" class="td">标题：</td>
    	<td class="td"><input id="bt" class="input" style="width:250px;" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
      <td width="38" class="td">发给：</td><td class="td"><select id="dx"><option value="">请选择</option><option value="0">办公室</option><option value="1">总经理</option></select> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="38" class="td">内容：</td>
    	<td class="td"><textarea id="nr" style="width:100%;height:280px;"></textarea></td>
    </tr>
    <tr>
    	<td width="38">&nbsp;</td>
    	<td><input id="tj" type="submit" value="确定" class="btn" /> <input type="reset" value="重置" class="btn" onclick="location.reload()" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td>
    </tr>
</table>
</body>
</html>