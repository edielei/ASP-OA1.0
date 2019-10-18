function reg() {
    var a = art.dialog.open("Common/Reg.html", {
        title: "用户注册",
        padding: 0,
        resize: !1,
        lock: !0
    });
}

function mm() {
    var a = art.dialog.open("Common/Qhmm.html", {
        title: "取回密码",
        padding: 0,
        resize: !1,
        height: 100,
        lock: !0
    });
}

function cls() {
    $("input:lt(3)").val("").end().add("input:first").focus();
}

$(function() {
    $.getScript("Js/vd.js"), $("#uname").val().length > 0 ? $("#yzcode").focus() : $("#uname").focus();
    var a = $(":image:first"), b = $(":image:eq(1)"), c = $("#yzm");
    $("input:lt(3)").keydown(function(e) {
        if (e.keyCode == 13) {a.click();return !1;}
    }), c.click(function() {
        $(this).attr("src", "Images/Yzcode.asp?" + $.now()).end().add("#yzcode").focus().select();
    }), a.click(function() {
        var a = $("#uname").vd("请输入用户名！", 1);
        if (!!a) {
            var b = $("#upwd").vd("请输入密码！", 1);if (!b) return;
            var d = $("#yzcode").vd("请输入验证码！");if (!d) return;
            $.post('C/Login.asp', {'uname':a, 'upwd':b, 'yzcode':d}, function(a){
                switch (a) {
                    case "OK":location.replace("Admin.asp");break;
                    case "xtcs":alert("系统超时，请重新登录！"), c.click();break;
                    case "yzerr":alert("验证码输入错误，请重新输入！"), $("#yzcode").focus().select();break;
                    case "Err":alert("帐号信息输入错误或未审核通过，请重新登录！"), cls();break;
                }
            });
        }
    }), b.click(function() {cls();});
});