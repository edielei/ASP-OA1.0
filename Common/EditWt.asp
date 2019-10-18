<!--#include file="../Inc/Cse.asp"--><!DOCTYPE html>
<html lang="cn">
<head>
<meta charset="UTF-8">
<title>EditWt</title>
<style type="text/css">
html{overflow:hidden;}
body{margin:0;padding:0;font-size:12px;}
td{font-size:12px;padding:3px 0;}
em{color:#F00;}
.input{
	border:1px #B7C7Be solid;
}
.btn {
	width:40px;
	height:20px;
	font-size:12px;
	font-family:'宋体';
	background:#84dba8;
	border:1px #55b47a;
	color:#345a40;
	padding:2px 0;
}
</style>
<link rel="stylesheet" href="../Js/skins/aero.css">
<script src="../Js/jQuery.js"></script>
<script src="../Js/jquery.artDialog.js"></script>
<script src="../Js/artDialog.iframeTools.js"></script>
<script src="../Js/vd.js"></script>
<script>
$(function() {
    $("#wt").select();
    var a = $("#tj");
    a.click(function() {
        var a = $("#wt").vd("请输入密码问题！", 1);
        if (!!a) {
            var b = $("#da").vd("请输入密码答案！", 1);
            if (!b) return;
            $.post("EditWtC.asp", "wt=" + a + "&da=" + b, function(a) {
                switch (a) {
                  case "OK":
                    art.dialog.open.api.hide(), art.dialog.through({
                        title: "提示",
                        icon: "succeed",
                        content: '密码问题修改为：<strong style="color:#F00;font-family:Tahoma">' + $("#wt").val() + "</strong><br />" + "密码答案修改为：" + '<strong style="color:#F00;font-family:Tahoma">' + $("#da").val() + "</strong>",
                        ok: function() {
                            art.dialog.open.api.close();
                        },
                        close: function() {
                            art.dialog.open.api.close();
                        }
                    });
                    break;
                  case "Err":
                    alert("操作失败！"), location.reload();
                }
            });
        }
    });
});
</script>
</head>
<body><%
Dim rs
rs=Easp.db.RT("Users","uname='"&Easp.Cookie("uinfo>uname:s")&"'","wt,da")
%><table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td align="right">密码问题：</td><td><input id="wt" class="input" value="<%Easp.WH rs(0)%>" autofocus/> <em title="必填项">*</em></td></tr>
	<tr><td align="right">密码答案：</td><td><input id="da" class="input" value="<%Easp.WH rs(1)%>" /> <em title="必填项">*</em></td></tr>
	<tr><td align="right">&nbsp;</td><td><input type="submit" id="tj" class="btn" value="确定" /></td></tr>
</table>
</body>
</html>