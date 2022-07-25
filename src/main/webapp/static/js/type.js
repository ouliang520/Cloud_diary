/**
 * 载入
 */
window.onload = function () {
    loadList();
}

function loadList() {
    var html = '<tr> <th>编号</th> <th>类型</th> <th>操作</th> </tr>';
    $.ajax({
        type: "post",
        url: "type/servletAll",
        dataType: "json",
        success(data) {
            //遍历列表
            for (x in data) {
                html += '<tr>';
                html += '<td>' + x + '</td>';
                html += '<td id="' + data[x].typeId + '">' + data[x].typeName + '</td>';
                html += '<td>';
                html += '<button class="btn btn-primary" type="button" onclick="openUpdateDialog(' + data[x].typeId + ')">修改</button>&nbsp;';
                html += '<button class="btn btn-danger del" type="button" onclick="deleteType(' + data[x].typeId + ')">删除</button>';
                html += '</td>';
                html += '</tr>';
            }
            $("#typeAll").html(html);
        }
    })
}

// ===========================删除=======================
/**
 *    "删除"按钮绑定点击事件（传递参数：类型ID）
 * @param typeId
 */
function deleteType(typeId) {
    // 弹出提示框询问用户是否确认删除
    swal({
        title: "",  // 标题
        text: "<h3>您确认要删除该记录吗？</h3>", // 内容
        type: "warning", // 图标  error	  success	info  warning
        showCancelButton: true,  // 是否显示取消按钮
        confirmButtonColor: "orange", // 确认按钮的颜色
        confirmButtonText: "确定", // 确认按钮的文本
        cancelButtonText: "取消" // 取消按钮的文本
    }).then(function () {
        // 如果是，发送ajax请求后台（类型ID）
        $.ajax({
            type: "post",
            url: "type/delete",
            data: {
                typeId: typeId
            },
            success: function (result) {
                // 判断是否删除成功
                if (result == 1) {
                    // 提示成功
                    swal("", "<h2>删除成功！</h2>", "success");
                    loadList();
                } else {
                    // 提示用户失败   swal("标题","内容","图标")
                    swal("", "<h3>删除失败</h3>", "error");
                }
            }
        });

    });
}

//===========================修改=======================

/**
 *    打开修改模态框
 1、修改模态框的标题
 2、将当前要修改的tr记录的id和名称，设置到模态框的隐藏域和文本框中
 2.1 通过ID属性值，得到要修改的tr记录
 2.2 得到tr的具体单元格的值
 2.3 将类型名称赋值给模态框中的文本框、将类型ID赋值给模态框中的隐藏域
 3、利用模态框的ID属性，调用show方法

 */
function openUpdateDialog(typeId) {
    // 1、修改模态框的标题
    $("#myModalLabel").html("修改类型");
    var typeName = $("#" + typeId).text();
    // 2 将类型名称赋值给模态框中的文本框、将类型ID赋值给模态框中的隐藏域
    $("#typename").val(typeName);
    $("#typeId").val(typeId);
    // 3、打开模态框
    $("#myModal").modal("show");
}

/**
 * 打开添加模态框
 1、修改模态框的标题
 2、清空文本框和隐藏域的值
 3、打开模态框

 */
function addBtn() {
    // 1、修改模态框的标题
    $("#myModalLabel").html("新增类型");

    // 2、清空文本框和隐藏域的值
    $("#typeId").val("");
    $("#typename").val("");

    // 3、打开模态框
    $("#myModal").modal("show");
};


/**
 * 添加或修改
 1、获取参数（文本框：类型名称、隐藏域：类型ID）
 2、判断参数是否为空（类型名称）
 如果为空，提示信息，并return
 3、发送ajax请求后台，添加或修改类型记录，回调函数返回resultInfo对象
 判断是否更新成功
 如果code=0，表示失败，提示信息
 如果code=1，表示更新成功，执行Dom操作
 关闭模态框
 判断typeId是否为空
 如果为空，执行添加的DOM操作
 // TODO
 如果不为空，执行修改的DOM操作
 1、修改指定tr记录
 a、通过id选择器获取tr记录
 b、修改指定单元格的文本值
 2、左侧类型分组导航栏的列表项
 给左侧类型名添加span标签，并设置id属性值，修改该span元素的文本值

 */
var clickChange= function () {
    // 1、获取参数（文本框：类型名称、隐藏域：类型ID）
    var typeId = $("#typeId").val();
    var typeName = $("#typename").val();
    window.alert(typeId+typeName)

    // 2、判断参数是否为空（类型名称）
    if (isEmpty(typeName)) {
        // 如果为空，提示信息，并return
        swal("参数类型不能为空")
        return;
    }

    // 3、发送ajax请求后台，添加或修改类型记录，回调函数返回resultInfo对象
    $.ajax({
        type: "post",
        url: "type/addOrUpdate",
        data: {
            typeId: typeId,
            typeName: typeName
        },
        success: function (result) {
            console.log(result);
            // 如果code=1，表示更新成功，执行Dom操作
            if (result == 1) {
                // 关闭模态框
                $("#myModal").modal("hide");
                if (typeId=="") {
                    swal("添加成功")
                }else {
                    swal("修改成功")
                }
                loadList();
            } else {
                if (typeId=="") {
                    swal("添加失败")
                }else {
                    swal("修改失败")
                }
                loadList();
            }
        }
    });

}

