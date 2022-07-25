<%--
  Created by IntelliJ IDEA.
  User: celestial
  Date: 2022/7/24
  Time: 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-9">


    <div class="data_list">
        <div class="data_list_title">
            <span class="glyphicon glyphicon-eye-open"></span>&nbsp;查看云记
        </div>
        <div>


            <div class="note_title"><h2>${node.title}</h2></div>
            <div class="note_info">
                发布时间：『 ${node.pubTime}』&nbsp;&nbsp;云记类别:<a id="type">${type}</a>
            </div>
            <div class="note_content">
                ${node.content}
            </div>
            <div class="note_btn">
                <button class="btn btn-primary" type="button" onclick="update(${node.noteId})">修改</button>
                <button class="btn btn-danger" type="button" onclick="del(${node.noteId})">删除</button>
            </div>


        </div>


    </div>

    <script>
        function update(data) {
            window.location = "change?noteId=" + data;
        }

        function del(data) {
            // 弹出提示框询问用户是否确认删除
            swal({
                title: "确定删除吗？",
                text: "请在三考虑哦",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "确定删除！",
                cancelButtonText: "取消删除！",
                closeOnConfirm: false,
                closeOnCancel: false
            }).then(
                function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "post",
                            url: "change/delete",
                            dataType:"json",
                            data: {
                                noteId: data
                            },
                            success: function (code) {
                                // 判断是否删除成功
                                if (code == 1) {
                                    // 跳转到首页
                                    window.location.href = "/main";
                                } else {
                                    // 提示失败
                                    swal("", "<h3>删除失败！</h3>", "error");
                                }
                            }
                        });
                    }
                });
        }
    </script>

</div>
