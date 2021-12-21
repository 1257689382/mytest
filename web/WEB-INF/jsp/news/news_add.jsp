<%--
  Created by IntelliJ IDEA.
  User: 微笑的高圆圆
  Date: 2021/11/17
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加页面</title>
</head>
<body>
        <center>
        <form  action="/news/insert.action" enctype="multipart/form-data">
            新闻类别：<input type="text" name="type" ><br/>
            新闻标题：<input type="text" name="title"><br>
            发布时间：<input type="date" name="createtime"><br/>
            <input type="submit" value="提交">
        </form>
        </center>
</body>
</html>
