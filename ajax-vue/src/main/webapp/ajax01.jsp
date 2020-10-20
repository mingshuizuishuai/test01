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
    <script src="lib/vue-resource-1.3.4.js"></script>
</head>
<body>
<div id="app">
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
            //发起ajax请求，取得学生信息，使其局部刷新
            getStudent() {
                //get请求的ajax形式：this.$http.get("请求路径").请求参数.then(回调函数))
                this.$http.get("myServlet").then(function (data) {

                    //在vue中取得参数（后台Json传来的对象）的属性，必须价格body
                    // alert(data.body.id);

                    this.id = data.body.id;
                    this.name = data.body.name;
                    this.age = data.body.age;

                })
            }
        }
    });
</script>
</body>
</html>
