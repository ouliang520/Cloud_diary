<%--
  Created by IntelliJ IDEA.
  User: celestial
  Date: 2022/7/24
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
    <div class="col-md-9">


        <div class="data_list">
            <div class="data_list_title">
                <span class="glyphicon glyphicon-cloud-upload"></span>&nbsp;修改云记
            </div>
            <div class="container-fluid">
                <div class="container-fluid">
                    <div class="row" style="padding-top: 20px;">
                        <div class="col-md-12">
                            <form class="form-horizontal" method="post" action="/change/changeNode">
                                <div class="form-group">
                                    <label for="typeId" class="col-sm-2 control-label">类别:</label>
                                    <div class="col-sm-6">
                                        <select id="typeId" class="form-control" name="typeId">
<%--                                            <option value="-1">请选择类型</option>--%>

<%--                                            <option value="2">技术</option>--%>

<%--                                            <option value="3">笔记</option>--%>

<%--                                            <option value="4" selected="">语录</option>--%>

<%--                                            <option value="5">test</option>--%>

                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="noteId" value="${node.noteId}">
                                    <input type="hidden" name="act" value="save">
                                    <label for="title" class="col-sm-2 control-label">标题:</label>
                                    <div class="col-sm-10">
                                        <input class="form-control" name="title" id="title" placeholder="云记标题" value="${node.title}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="title" class="col-sm-2 control-label">内容:</label>
                                    <div class="col-sm-8">


                                                <%-- 准备容器，加载富文本编辑器 --%>
                                                <textarea id="content" name="content">${node.content}</textarea>



                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-6 col-sm-4">
                                        <input type="submit" class="btn btn-primary" onclick="return checkForm()" value="保存">
                                        <font id="error" color="red"></font>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            window.onload=deleteTag();
            function deleteTag()
            {
                var regx = /<[^>]*>|<\/[^>]*>/gm;
                var tagStr = $("#content").val();
                var result = tagStr.replace(regx,"");
                $("#content").val(result);
                $("#content").text(result);

            }

            $(function(){
                var ue;
                $(function (){
                    // 加载富文本编辑器 UE.getEditor('容器Id');
                    ue = UE.getEditor('content');
                });
                }
            );
            function checkForm() {
                /*  1. 获取表单元素的值 */
                // 获取下拉框选中的选项  .val()
                var typeId = $("#typeId").val();
                // 获取文本框的值       .val()
                var title = $("#title").val();
                //  获取富文本编辑器的内容 ue.getContent()
                var content=$("#content").val();


                /* 2. 参数的非空判断 */
                if (isEmpty(typeId)) {
                    $("#msg").html("请选择云记类型！");
                    return false;
                }
                if (isEmpty(title)) {
                    $("#msg").html("云记标题不能为空！");
                    return false;
                }
                if (isEmpty(content)) {
                    $("#msg").html("云记内容不能为空！");
                    return false;
                }
                window.alert("修改完成")
                return true;
            }

            window.onload=function (){
                $.ajax({
                    type: "get",
                    url: "change/selectType",
                    dataType: "json",
                    success(data) {
                        var html = '<option value="-1">请选择类型</option>';
                        //遍历列表
                        for (x in data) {
                            html += '<option id="'+data[x].typeId+'" value="'+data[x].typeId+'">'+data[x].typeName+'</option>'
                        }
                        $("#typeId").html(html);
                        $("#"+${node.typeId}).prop("selected", 'selected');
                    }
                })
            }
        </script>

    </div>
</div>

</body></html>

