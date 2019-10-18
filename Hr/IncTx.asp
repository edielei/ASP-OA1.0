<!--#include file="../Inc/Cse.asp"--><%Dim id
id=Easp.Get("id:n:0")
%>
<!DOCTYPE html>
<html lang="cn">
<head>
<meta name="author" content="EdieLei">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<title>Tx</title>
<style type="text/css">
html{overflow:hidden;}
body{margin:0;font-size:12px;}
.lz a{color:#48795B;display:inline-block;width:80px;height:22px;line-height:22px;margin:5px 8px;text-align:center;text-decoration:none;border:1px #48795B solid;}
.lz a:hover{background:#B9EDCE;}
</style>
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script>
function zc(){
	$.post('ToZcC.asp','id=<%=id%>',function(a){
		switch(a){
			case 'OK':alert('修改成功！');art.dialog.open.origin.location.reload();break;
			case "QR":art.dialog.open.api.hide();art.dialog.through({
				title:'提示',
				icon:'question',
				content:'是否要为该用户恢复系统登录权限？',
				resize:false,
				lock:true,
				duration:0,
				ok:function(){hf();},
				cancel:function(){art.dialog.open.origin.location.reload();}
				});break
			case 'Err':alert('操作失败！');location.reload();break;
		}
	});
}
function hf(){
	$.post('hfdl.asp','id=<%=id%>',function(){
		art.dialog.through({title:'提示',icon:'succeed',content:'设置成功，该用户现在可以正常使用本系统！',duration:0,resize:false,lock:true,
			ok:true,
			close:function(){
				art.dialog.open.origin.location.reload();
			}
		});
	});
}
function lz(){
	art.dialog.open.api.hide();
	art.dialog.open('Hr/ToLz.asp?id=<%=id%>',{title:'状态改为离职',height:90,width:250,resize:false,closeFn:function(){
		art.dialog.open.api.close();
	}})
}
</script>
</head>
<body>
<div class="lz"><a href="javascript:zc();">改为在职</a><a href="javascript:lz();">改为离职</a></div>
</body>
</html>