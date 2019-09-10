<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="static/js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap/css/bootstrap.css">
    <script type="text/javascript" src="static/css/bootstrap/js/bootstrap.min.js"></script>
    <title>首页</title>
    <style type="text/css">
        .btn{
            margin: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>JDBC-CRUD</h1>
    <button type="button" class="btn btn-danger pull-right" data-toggle="modal" data-target="#delete2" id="delete">删除</button>
    <button type="button" class="btn btn-danger pull-right" data-toggle="modal" data-target="#add_update" id="update">修改</button>
    <button type="button" class="btn btn-danger pull-right" data-toggle="modal" data-target="#add_update" id="add">添加</button>
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Sex</th>
            <th>Age</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td><c:out value="${user.id}" /></td>
                <td><c:out value="${user.name}" /></td>
                <td><c:out value="${user.sex}" /></td>
                <td><c:out value="${user.age}" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!-- 修改或增加 -->
<div class="modal fade" id="add_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
            </div>
            <div class="modal-body">
                <form method="post" action="<%=basePath%>emp?type=add_update">
                    <div class="form-group">
                        <label for="id">id</label>
                        <input type="text" class="form-control" name ="id" id="id" placeholder="请输入需要修改的id" >
                    </div>
                    <div class="form-group">
                        <label for="name">name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="请输入名字">
                    </div>
                    <div class="form-group">
                        <label for="sex">sex</label>
                        <input type="text" class="form-control" name="sex" id="sex" placeholder="请输入性别">
                    </div>
                    <div class="form-group">
                        <label for="age">age</label>
                        <input type="text" class="form-control" name="age" id="age" placeholder="请输入年龄">
                    </div>
                    <button type="submit" class="btn btn-default btn-info" id="submit">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 删除 -->
<div class="modal fade" id="delete2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">Modal title</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="id">id</label>
                    <input type="text" class="form-control" id="delete_id" placeholder="请输入需要修改的id" >
                </div>
                <button type="submit" class="btn btn-default btn-info" id="delete_submit">提交</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $("#add").click(function () {
        $("#id").attr("disabled","");
    });
    $("#update").click(function () {
        $("#id").removeAttr("disabled");
    });
    $("#delete_submit").click(function(){
        var delete_id = $("#delete_id").val();
        $.ajax({
            url:"<%=basePath%>emp?type=delete&delete_id="+delete_id,
            success:function(result){
                window.location.reload();
            }});
    });
</script>
</html>