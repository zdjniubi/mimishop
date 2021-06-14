$.ajax({
    type: "GET",
    url: "http://" + g_host + "/user/check",
    data: {
        "token" : window.localStorage.getItem("token")
    },

    xhrFields: {withCredentials: true},
    success: function (data) {
        var dom = "";
        if (data.data != null) {
            dom = "<li class='login-signup'>你好，" +data.data.name+"</li>";
        } else {
            dom = "<li class='login-signup'>你好，请<a href='login.html'>登录 </a><span class='text-color-red'>" +
                "<ahref='signup.html'>免费注册</a></span></li>";
        }
        $("#user_login").append($(dom));

    }
});