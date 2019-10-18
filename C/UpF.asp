<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh">
<head>
<meta charset="UTF-8">
<title>UpF</title>
<style type="text/css">
body{margin:0; padding:0;}
form{margin:0;padding:0;}
#a{color:#345a40;height:19px; font-size:12px;background:#84dba8;border:1px #55b47a; font-family:\5B8B\4F53}
.f{font-size:12px;height:19px;background:#FFF;border:1px #B7C7BE solid;}
</style>
<script src="../Js/jQuery.js"></script>
<script>
$(function(){
$("input:first").change(function(){$(this).val()!=""&&$("#a").show()})
$('form').submit(function(){
	if($('.f').val().length==0){return false;}
})
});
</script>
</head>
<body>	
<form action="UpFC.asp" method="post" enctype="multipart/form-data">
<input class="f" name="pic" type="file" style="width:280px;"/>
<input id="a" style="display:none" type="submit" value="上传" />
</form>
</body>
</html>