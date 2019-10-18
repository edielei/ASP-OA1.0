<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta charset="UTF-8">
<title>Kq</title>
<style type="text/css">
body {margin:0;padding:0;color:#48795B;font-size:12px;}
select,option{font-size:12jpx;border:1px #B7C7Be solid;}
.table {width:98%;font-size:12px;font-family:Tahoma, Geneva, sans-serif;}
.td {height:24px;padding:2px 2px;border-bottom:1px #DDD dashed;}
.input{border:1px #B7C7Be solid;}
.btn {width:40px;height:20px;margin-top:3px;font-size:12px;font-family:'宋体';background:#84dba8;border:1px #55b47a;color:#345a40;padding:2px 0;}
em{color:#F00;}
#kssj,#jssj{width:105px;}</style>
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/vd.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script src="../DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	$('input:last').click(function(){
		art.dialog.open.api.close();
	});
	var s=$(':submit'),kssj=$('#kssj'),jssj=$('#jssj');
	s.click(function(){
		var uname=$('#zname').vd('请选择姓名！',1);if(!uname){return}
		var types=$('#types').vd('请选择类型！',1);if(!types){return}
		if(0==kssj.val().length){alert('请输入开始时间！');kssj.select();return false;}
		if(0==jssj.val().length){alert('请输入结束时间！');jssj.select();	return false;}
		var nr=$('#nr').vd('请输入内容！',1);if(!nr){return}
		$.post('NewKqC.asp','uname='+uname+'&types='+types+'&kssj='+encodeURIComponent(kssj.val())+'&jssj='+encodeURIComponent(jssj.val())+'&nr='+nr,function(a){
			switch(a){
				case 'OK':
					art.dialog.open.api.hide();
					window.parent.frames["mkj"].location.reload();
					art.dialog.through({
						title:'提示',
						icon:'succeed',
						content:'提交成功！',
						duration:0,
						lock:true,
						time:3,
						resize:false,
						close:function(){
							art.dialog.open.api.close();
						}
					});
				break;
				case 'Err':alert('操作失败！');location.reload();break;
			}
		});
	});
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" class="table">
	<tr><td align="right" nowrap="nowrap" class="td">姓名：</td><td class="td"><%
	Dim rs,t,i
	Set rs=Easp.db.GR("Users:uname,zname","xs=True","id desc")
	if Easp.IsN(rs) then
	Easp.W ""
	Else
	t=rs.GetRows()
	Easp.db.C(rs)
	Easp.W "<select id=""zname""><option value="""">请选择</option>"
	For i=0 to UBound(t,2)
	Easp.W "<option value="""&t(0,i)&""">"&t(1,i)&"</option>"
	Next
	Easp.W "</select>"
	End if
	%> <em title="必填项">*</em></td></tr>
	<tr><td align="right" nowrap="nowrap" class="td">类型：</td><td class="td"><select id="types"><option value="">请选择</option><option value="1">外出登记</option><option value="2">请假登记</option><option value="3">出差登记</option></select> <em title="必填项">*</em></td></tr>
	<tr>
		<td width="68" align="right" nowrap="nowrap" class="td">开始时间：</td><td class="td"><input id="kssj" class="input" onfocus="WdatePicker({dateFmt:'%y-MM-dd HH:mm',maxDate:'#F{$dp.$D(\'jssj\',{m:-1})}'})" /> <em title="必填项">*</em></td>
	</tr>
    <tr>
   	  <td width="68" align="right" class="td">结束时间：</td><td class="td"><input id="jssj" class="input" onfocus="WdatePicker({dateFmt:'%y-MM-dd HH:mm',minDate:'#F{$dp.$D(\'kssj\',{m:+1})}'})" /> <em title="必填项">*</em></td>
  </tr>
	<tr><td width="68" align="right" nowrap="nowrap" class="td">原因：</td><td class="td"><textarea id="nr" class="input" style="width:350px;height:130px;"></textarea></td></tr>
    <tr><td width="68" align="right">&nbsp;</td><td style="padding:0 2px"><input type="submit" value="确定" class="btn" /> <input type="button" value="取消" class="btn" /></td></tr>
</table>
</body>
</html>