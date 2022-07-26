<%--
  Created by IntelliJ IDEA.
  User: celestial
  Date: 2022/7/26
  Time: 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hello, World</title>
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    <%-- 引用百度地图API文件，需要申请百度地图对应ak密钥--%>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=MAxyx5QyfFHDEdX22xXecdjHdEPY16Fn">
    </script>
</head>

<body>
<div>
<div id="container" ></div>
<script type="text/javascript">
    var map = new BMapGL.Map("container");
    // 创建地图实例
    var point = new BMapGL.Point(116.404, 39.915);
    // 创建点坐标
    map.centerAndZoom(point, 15);
    // 初始化地图，设置中心点坐标和地图级别
</script>
    <div>
        <h1>不想做了</h1>
    </div>
</div>
</body>
<script type="text/javascript" src="static/echarts/echarts.min.js"></script>
