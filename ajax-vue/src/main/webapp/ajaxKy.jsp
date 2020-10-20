<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>">
    <script src="lib/vue-2.4.0.js"></script>
    <%-- 对于跨域请求我们必须使用的是vue—resource的插件方式 --%>
    <script src="lib/vue-resource-1.3.4.js"></script>
</head>
<body>
<div id="app">
    <%-- 处理跨域请求 --%>
    <button @click="getStudent">点击取得学生信息</button>
    <br/>
    编号:<span>{{id}}</span><br/>
    姓名:<span>{{name}}</span><br/>
    年龄:<span>{{age}}</span><br/>

</div>

<script>
    var vn = new Vue({
        el: "#app",
        data: {
            id: "",
            name: "",
            age: ""
        },
        methods: {

            getStudent() {
                //路径必须使用完整路径
                this.$http.jsonp("http://localhsot:8088/myKyWeb").then(result => {

                    data = result.body;

                    this.id = data.id;
                    this.name = data.name;
                    this.age = data.age;

                })

            }
        }

    });
</script>
</body>
</html>
