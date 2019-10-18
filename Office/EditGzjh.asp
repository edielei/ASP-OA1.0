<!--#include file="../Inc/GzjhCs.asp"--><%
Dim id,r
id=Easp.Get("id:n:0")
r=db.RT("Gzjh","id="&id,"bt,typesid,kssj,jssj,nr")
%><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Edit</title>
<link rel="stylesheet" href="../Css/Inc.css">
<style type="text/css">html{overflow:hidden;}body{background:none;}.table{margin:2px 3px 10px;}.td{padding:2px;}</style>
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script src="../Editor/kindeditor.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
KE.show({
    id:'nr',
    imageUploadJson : '../../filem/upload_json.asp',
    resizeMode:0,
    minHeight:100,
    urlType:'absolute',
	afterCreate : function(id) {
		KE.event.ctrl(document, 13, function() {
			KE.sync(id);
			$('#tj').click();
		});
		KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
			KE.sync(id);
			$('#tj').click();
		});
	}
});
$(function(){
	$('#typesid').val('<%=r(1)%>');
	var s=$('#tj'),kssj=$('#kssj'),jssj=$('#jssj');
	s.click(function(){
		var bt=$('#bt').vd('请输入标题！',1);if(!bt){return}
		var typesid=$('#typesid').vd('请选择类别！',1);if(!typesid){return}
		if(0==kssj.val().length){alert('请输入开始时间！');kssj.select();return false;}
		if(0==jssj.val().length){alert('请输入结束时间！');jssj.select();return false;}
		var nr=encodeURIComponent($.trim(KE.html('nr')));
		if(KE.isEmpty('nr')){alert('请输入内容！');KE.focus('nr');return !1;}
		$.post('EditGzjhC.asp','id=<%=id%>&bt='+bt+'&typesid='+typesid+'&kssj='+encodeURIComponent(kssj.val())+'&jssj='+encodeURIComponent(jssj.val())+'&nr='+nr,function(a){
			switch(a){
				case 'OK':art.dialog.open.api.hide();
				art.dialog.through({
					title:'消息',
					content:'修改成功！',
					icon:'succeed',
					duration:0,
					time:3,
					close:function(){
						var win = art.dialog.open.origin;
						win.location.reload();
					}
				});break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table class="table">
<tr><td width="65" align="right" nowrap="nowrap" class="td">标题：</td><td class="td"><input class="input" id="bt" style="width:180px;" value="<%Easp.WH r(0)%>" /> <em title="必填项">*</em></td></tr>
<tr><td width="65" align="right" nowrap="nowrap" class="td">类别：</td><td class="td"><%Easp.Ext("ed").JhTypes()%> <em title="必填项">*</em></td></tr>
<tr><td width="65" align="right" nowrap="nowrap" class="td">开始时间：</td><td class="td"><input id="kssj" class="input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'jssj\',{m:-1})}',doubleCalendar:true})" style="width:110px;" value="<%=Easp.DateTime(r(2),"yyyy-mm-dd hh:ii")%>" /> <em title="必填项">*</em></td></tr>
<tr><td width="65" align="right" nowrap="nowrap" class="td">结束时间：</td><td class="td"><input id="jssj" class="input" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',minDate:'#F{$dp.$D(\'kssj\',{m:+1})}',doubleCalendar:true})" style="width:110px;" value="<%=Easp.DateTime(r(3),"yyyy-mm-dd hh:ii")%>" /> <em title="必填项">*</em></td></tr>
<tr><td width="65" align="right" nowrap="nowrap" class="td">内容：</td><td class="td"><textarea id="nr" style="width:540px;height:220px;"><%Easp.W Easp.Ext("ed").htmlspecialchars(r(4))%></textarea></td></tr>
<tr>
	<td>&nbsp;</td><td style="padding:2px;"><input id="tj" type="submit" class="btn" value="确定" /> <input type="button" class="btn" onclick="art.dialog.close()" value="取消" /></td>
</tr>
</table>
</body>
</html>