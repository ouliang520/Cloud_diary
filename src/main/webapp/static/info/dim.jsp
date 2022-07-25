<%--
  Created by IntelliJ IDEA.
  User: celestial
  Date: 2022/7/23
  Time: 1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    window.onload = function () {
        // selectDim()
        // listPage();
        clickPage(1);

    }

    function clickPage(num) {
        $("#" + $("#page").val()).removeClass('active');//不执行
        $("#page").attr("value", num)//改完数据为空
        $("#" + num).addClass('active');
        //window.alert($("#page").val())//获取不到数据,空
        selectDim();//不执行
    }

    function selectDim() {
        var page = $("#page").val();
        var dim =$("#dim").val()
        window.alert(123)
        $.ajax({
                type: "get",
                url: "main/selectDim",
                dataType: "json",
                data: {
                    dim:dim,
                    page: page
                },
                success: function (data) {
                    var html = "";
                    //遍历列表
                    for (x in data) {
                        html += '<li>' + '『' + data[x].pubTime + '』' + '&nbsp;&nbsp;<a href="main/selectNode?noteId=' + data[x].noteId + '">' + data[x].title + '</a></li>'
                    }
                    $("#list").html(html);
                }
            }
        )
    }

    function listPage() {
        var pageAdd = $("#pageAdd").val();
        $.ajax({
            type: "get",
            url: "main/selectListPage",
            dataType: "json",
            success(data) {
                var html = "";
                var i=1;
                while((data - pageAdd * 35 > 0)&& i<6){
                    html += '<li id="'+i+'"><a onclick="clickPage('+i+')">'+i+'</a></li>'
                    data-=7;
                    i++;
                }
                $("#pageList").html(html);
            }
        })
    }
</script>
<body>
<div class="col-md-9">


    <div class="data_list">
        <div class="data_list_title"><span class="glyphicon glyphicon glyphicon-th-list"></span>&nbsp;
            云记列表
        </div>

        <div class="note_datas">
            <ul id="list">

            </ul>
        </div>
        <nav style="text-align: center">
            <ul class="pagination   center" id="pageList">
                <li id="1"><a onclick="clickPage(1)">1</a></li>
                <li id="2"><a onclick="clickPage(2)">2</a></li>
                <li id="3"><a onclick="clickPage(3)">3</a></li>
                <li id="4"><a onclick="clickPage(4)">4</a></li>
                <li id="5"><a onclick="clickPage(5)">5</a></li>
                <li>
                    <a href="main?act=&amp;val=&amp;valStr=&amp;current=2">
                        <span>»</span>
                    </a>
                </li>
                <input type="hidden" id="page" name="page" value="1">
                <input type="hidden" id="pageAdd" name="pageAdd" value="0">
            </ul>
        </nav>

    </div>

</div>
</body>