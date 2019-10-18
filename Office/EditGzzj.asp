<!--#include file="../Inc/Cse.asp"--><%Dim id,rs
id=Easp.Get("id:n:0")
rs=Easp.db.RT("Gzzj","id="&id,"bt,sj")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<link rel="stylesheet" href="../Css/Add.css">
<title>Edit</title>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Editor/kindeditor.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
KE.show({
    id:'nr',
    allowFileManager:true,
    fileManagerJson : '../../filem/file_manager_json.asp',
    imageUploadJson : '../../filem/upload_json.asp',
    allowPreviewEmoticons:false,
    resizeMode:1,
    minHeight:300,
    urlType:'absolute'
})
$(function(){
	var s=$('#tj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入内容！');KE.focus('nr');return !1;}
		var sj=encodeURIComponent($.trim($('#sj').val()));
		if(sj.length==0){alert('请输入时间！');$('#sj').select();return false;}
		$.post('EditGzzjC.asp','id=<%=id%>&bt='+bt+'&nr='+nr+'&sj='+sj,function(a){
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
	<tr>
		<th colspan="2" class="th">&nbsp;修改工作总结</th>
	</tr>
    <tr>
    	<td width="38" class="td">标题：</td>
    	<td class="td"><input id="bt" class="input" style="width:250x;" value="<%Easp.WH rs(0)%>" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="38" class="td">内容：</td>
    	<td class="td"><textarea id="nr" style="width:100%;height:280px;"><%Easp.W Easp.Fso.Read("GzzjNr/"&id&".html")%></textarea></td>
    </tr>
    <tr>
    	<td width="38" class="td">时间：</td>
    	<td class="td"><input id="sj" class="input" value="<%=Easp.DateTime(rs(1),"yyyy-mm-dd")%>" style="width:80px;" onfocus="WdatePicker()" /> <em title="必填项">*</em></td>
    </tr>
    <tr>
    	<td width="38">&nbsp;</td>
    	<td><input id="tj" type="submit" value="确定" class="btn" /> <input type="reset" value="重置" class="btn" /> <input type="button" value="取消" class="btn" onclick="history.back()" /></td>
    </tr>
</table>
</body>
</html>