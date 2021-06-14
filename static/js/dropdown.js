window.onload=function() {

    //获取所有+按钮
    var increment = document.getElementsByClassName("increase");

    for (var i = 0; i < increment.length; i++) {
        //为a标签添加index属性，用于记录下标
        increment[i].index = i;

        //点击+数量增加的功能函数
        increment[i].onclick = function () {
            var flag = this.index;
            //获取当前a标签对应的数量框
            var q = document.getElementsByClassName("quantity")[flag];

            var newvalue = parseInt(q.value) + 1;

            //用q.value=parseInt(q.value)+1
            //会导致数值只在点击的一瞬间发生变化，然后又跳回1
            q.setAttribute('value', newvalue);

            //更新此商品对应的‘小计’
            changeSum(flag, newvalue);
        }
    }

    //获取所有-按钮
    var decrement = document.getElementsByClassName('decrease');

    //点击-数量减少的功能函数
    for (var j = 0; j < decrement.length; j++) {
        decrement[j].index = j;

        decrement[j].onclick = function () {
            var flag = this.index;
            //获取当前a标签对应的那个数量框
            var q = document.getElementsByClassName("quantity")[flag];

            if (parseInt(q.value) > 1) {
                var newvalue = parseInt(q.value) - 1;

                q.setAttribute('value', newvalue);
                 changeSum(flag, newvalue);
            }
        }
    }

    var calculate=document.getElementById('calculate');

    calculate.onclick=function(){
        var radios=document.getElementsByName('p-radio');

        var sumPrice=0;

        var p=document.getElementsByClassName('onlySum');

        for(var m=0;m<radios.length;m++)
        {
            if(radios[m].checked==true)
            {
                sumPrice=sumPrice+parseInt(p[m].innerHTML);
            }
        }

        document.getElementsByClassName("sum-price")[0].innerHTML=sumPrice;
    }


    var submit=document.getElementById("submit-order");

    submit.onclick=function(){

        var data=[];
        var radios=document.getElementsByName('p-radio');
        var count=document.getElementsByClassName("quantity");
        var items=document.getElementsByClassName("item");

        for(var m=0;m<radios.length;m++)
        {
            if(radios[m].checked==true)
            {
                var item={};
                item.tradeid=car_list[m].itemId;
                if (car_list[m].promoId == 0) {
                    item.promoId = null
                } else {
                    item.promoId = car_list[m].promoId
                }
                item.amount=count[m].value;
                item.id = car_list[m].id;
                createorder(item);

            }
        }

        var result=JSON.stringify(data);

        $.ajax({
            type : "post",

            url : '',//后台请求地址

            data : result,

            contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型 

            async : false,//异步请求

            success : function(){         },



        });
    }
}


//更新每个商品的‘小计’
function changeSum(flag,num){
    //获取对应单价所在的标签
    var temp=document.getElementsByClassName("onlyPrice")[flag];

    //获取单价
    var unitPrice=temp.innerHTML;

    //计算新的小计价格
    var newPrice=parseInt(unitPrice)*num;

    var sum=document.getElementsByClassName("onlySum")[flag];

    sum.innerHTML=newPrice;
}


//设置全选/全不选的功能
function setAll(){
    var box=document.getElementById('allchecked');

    var radios=document.getElementsByName('p-radio');

    //alert(box.checked);

    if(box.checked==false)
    {
        for(var i=0;i<radios.length;i++)
        {
            radios[i].checked=false;
        }
    }else{
        for(var i=0;i<radios.length;i++)
        {
            radios[i].checked=true;
        }
    }
}
function createorder(item) {
    var token = window.localStorage["token"];
    $.ajax({
        type:"POST",
        contentType:"application/x-www-form-urlencoded",
        url:"http://"+g_host+"/order/generatetoken",
        data:{
            "itemId":item.tradeid,
            "promoId":item.promoId,
            "token":token
        },
        xhrFields:{withCredentials:true},
        success:function(data){
            if(data.status == "success"){
                var promoToken = data.data;
                $.ajax({
                    type:"POST",
                    contentType:"application/x-www-form-urlencoded",
                    url:"http://"+g_host+"/order/createorder?token="+token,
                    data:{
                        "itemId":item.tradeid,
                        "amount":item.amount,
                        "promoId":item.promoId,
                        "promoToken":promoToken
                    },
                    xhrFields:{withCredentials:true},
                    success:function(data){
                        if(data.status == "success"){
                            alert("下单成功");
                            window.location.reload();
                            $.ajax({
                                type:"GET",
                                contentType:"application/x-www-form-urlencoded",
                                url:"http://"+g_host+"/car/delete",
                                data:{
                                    "token":token,
                                    "carId": item.id
                                },
                                xhrFields:{withCredentials:true},
                                success:function(data){
                                    if(data.status == "success") {
                                    }
                                },
                            });
                        }else{
                            alert("下单失败，原因为"+data.data.errMsg);
                            if(data.data.errCode == 20003){
                                window.location.href="login.html";
                            }
                        }
                    },
                    error:function(data){
                        alert("下单失败，原因为"+data.responseText);
                    }
                });


            }else{
                alert("获取令牌失败，原因为"+data.data.errMsg);
                if(data.data.errCode == 20003){
                    window.location.href="login.html";
                }
            }
        },
        error:function(data){
            alert("获取令牌失败，原因为"+data.responseText);
        }
    });
}

