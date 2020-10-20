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
    <script src="lib/axios.min.js"></script>
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
            //发起ajax请求，取得学生信息，使其局部刷新,使用axios插件形式的另一种形式

            getStudent() {
                // axios.get(//get请求
                //     "myServlet03",
                //     {
                //         params:{
                //             "name":"aaabbb"
                //         }//请求参数
                //     }
                // ).then(result=>{
                //     var data=result.data;
                //
                //     this.id=data.id;
                //     this.name = data.name;
                //     this.age = data.age;
                // })
                axios.post(//post请求
                    "myServlet03",

                        // params:{
                        //     "name":"aaabbb"
                        // }
                        "name=szc" // 请求参数


                ).then(result=>{
                    var data=result.data;

                    this.id=data.id;
                    this.name = data.name;
                    this.age = data.age;
                })
            }
        }

    });
</script>
</body>
</html>
