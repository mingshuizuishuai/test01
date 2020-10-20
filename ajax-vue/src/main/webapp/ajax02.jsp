
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
            request.getContextPath()+"/";
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
    <button @click="getStudent">点击取得学生信息</button><br/>
    编号:<span>{{id}}</span><br/>
    姓名:<span>{{name}}</span><br/>
    年龄:<span>{{age}}</span><br/>

</div>

<script>
    var vn=new Vue({
        el:"#app",
        data:{
            id:"",
            name:"",
            age:""
        },
        methods:{
            //发起ajax请求，取得学生信息，使其局部刷新

            getStudent(){
                //post请求ajax形式：this.$http.get("请求路径").请求参数.then(回调函数))
                /**
                 * 关于post请求传递参数的问题：
                 * 他和get请求不一样，不能直接拼接在url请求路径上
                 * 手动发起post请求，默认没有表单格式，所以服务器处理不了
                 * 我们需要通过post方法的第三个参数，{emulateJSON:true}设置，提交内容类型
                 * 就设置为了普通表单格式传递参数
                 *
                 */
                this.$http.post("myServlet",{"name":"ls123"},{emulateJSON:true}).then(function (data) {
                    //在vue中取得参数（后台Json传来的对象）的属性，必须价格body
                    // alert(data.body.id);

                    this.id=data.body.id;
                    this.name=data.body.name;
                    this.age=data.body.age;
                })
            }
        }

    });
</script>
</body>
</html>
