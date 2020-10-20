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
            //发起ajax请求，取得学生信息，使其局部刷新,使用axios插件形式的

            getStudent() {
                /**
                 *在axios中的回调函数是处于其他函数的内部，使用this，是够不到data里面的，所以这里需要承接一下
                 *
                 */
                var _this=this;
                axios({
                    method: "get",//post方法就直接改成post就可以了
                    url: "myServlet02"
                }).then(function (result) {

                    //和vue-resource的不同的是，它获取参数的属性，不加body，而是加data
                    data=result.data;

                    _this.id = data.id;
                    _this.name = data.name;
                    _this.age = data.age;
                }),

                //改进版,使用=>代替回调函数
                axios({
                    method:"get",
                    url:"myServlet02",
                    params:{"name":"asd"}//传递参数
                }).then(result=>{
                    data=result.data;
                    //此时可以直接使用this了
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
