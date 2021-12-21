<%--
  Created by IntelliJ IDEA.
  User: 微笑的高圆圆
  Date: 2021/11/17
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>修改页面</title>
</head>
<body>
        <center>
        <form  action="/news/update.action" enctype="multipart/form-data" method="post">
            <input type="hidden" name="id" value="${byid.id}">
            新闻类别：<input type="text" name="type" value="${byid.type}" ><br/>
            新闻标题：<input type="text" name="title" value="${byid.title}"><br>
            发布时间：<input type="date" name="createtime" value="<fmt:formatDate value="${byid.createtime}" pattern="yyyy-MM-dd"/>"><br/>
            <input type="submit" value="提交">
        </form>
        </center>
</body>
</html>
