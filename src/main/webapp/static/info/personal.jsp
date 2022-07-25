<%--
  Created by IntelliJ IDEA.
  User: celestial
  Date: 2022/7/23
  Time: 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<div class="col-md-9">


    <script>
        function checkUser(){
            var nickName=$('#nick').val();
            if(nickName.length==0){
                $("#msg").html("昵称不能为空,请核对！");
                return false;
            }
            return true;
        }

    </script>
    <div class="data_list">
        <div class="data_list_title"><span class="glyphicon glyphicon-edit"></span>&nbsp;个人中心 </div>
        <div class="container-fluid">
            <div class="row" style="padding-top: 20px;">
                <div class="col-md-8">
                    <form class="form-horizontal" method="post" action="/personal/change" enctype="multipart/form-data" onsubmit="return checkUser();">
                        <div class="form-group">
                            <input type="hidden" name="act" value="save">
                            <label for="nickName" class="col-sm-2 control-label">昵称:</label>
                            <div class="col-sm-3">
                                <input class="form-control" name="nick" id="nickName" placeholder="昵称" value="${user.nick}">
                            </div>
                            <label for="img" class="col-sm-2 control-label">头像:</label>
                            <div class="col-sm-5">
                                <input type="file" id="img" name="img">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mood" class="col-sm-2 control-label">心情:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="mood" id="mood" rows="3">${user.mood}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" id="btn" class="btn btn-success" onclick="return updateUser()">修改</button>&nbsp;&nbsp;<span style="color:red;font-size: 12px" id="msg"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4"><img style="width:260px;height:200px" src="static/images/${user.head}"></div>
            </div>
        </div>
    </div>
    <script>
        $("#nickName").blur(function (){
            var nickName=$("#nickName").val();
            if (isEmpty(nickName)){
                $("#msg").html('用户昵称不能为空');
                $("#btn").prop("disabled",true);
                return;
            }

            var nick="${user.nick}";
            var mood="${user.mood}";
            if (nick ==nickName&&mood==$("#mood").val()){
                return;
            }

            //如果修改了信息
            $.ajax({
                type:"get",
                url:"personal/cheek",
                dataType:"json",
                data:{
                    actionName:"checkNick",
                    nick:nickName
                },
                success:function (result){
                    if (result.code==0){
                        $("#msg").html('');
                        $("#btn").prop("disabled",false);
                    }else{
                        $("#msg").html('该昵称已存在');
                        $("#btn").prop("disabled",true);
                    }
                }
            })
        }).focus(function (){
            $("#msg").html('');
            $("#btn").prop("disabled",false);
        })

        function updateUser(){
            var nickName=$("#nickName").val();
            if (isEmpty(nickName)){
                $("#msg").html('用户昵称不能为空');
                $("#btn").prop("disabled",true);
                return false;
            }
            return true;
        }
    </script>
</div>
