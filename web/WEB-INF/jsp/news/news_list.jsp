<%--
  Created by IntelliJ IDEA.
  User: 微笑的高圆圆
  Date: 2021/11/17
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>新闻列表</title>
    <script src="/js/jquery-2.2.1.min.js"></script>
    <script>
        function jump(pageNum) {
            if(pageNum<1){
                pageNum = 1;
            }
            if(pageNum > ${pageInfo.pages}){
                pageNum = ${pageInfo.pages};
            }

            $("#pid").val(pageNum);//把新页码设置到form表单中，提交表单使用之
            // location.href="/teacher/findAll.action?tn=x?pageNum="+pageNum;

            $("form").submit();//直接提交表单

        }

        $(function () {
            $("#id8").click(function () {
                $("input[name=ck]").prop("checked",$(this).prop("checked"))
            });
            $("input[name=ck]").click(function () {
                var b =$(this).prop("checked");//得到当前复选框的选中状态
                var rs =false;//记录 全选框是否选中的结果
                if (b==false){//消除选中，把 勾 去掉
                    rs=false;//全选框 取消选中
                } else {//当前付款框 选中
                    //得到选中的数量
                    var  size1=$("input[name=ck]:checked").size();
                    //得到所有的复选框
                    var  size2=$("input[name=ck]").size();
                    if (size1 ==size2){//选中的数量等于总数量
                        rs=true;
                    } else {
                        rs=false;
                    }
                }
                //设置全选框的结果
                $("#id8").prop("checked",rs);

            });
            $("#id1").click(function () {
                var cks= $("input[name=ck]:checked");//得到选中的复选框
                if (cks.size()<1){
                    alert("请选择一条数据")
                } else {
                    if (confirm("您确定要删除吗")){

                        //提交删除的id到后台，进行删除,,//得到打勾的商品的id
                        var ids ="";
                        for (let i = 0; i < cks.size(); i++) {
                            var  ck = cks[i];//得到每一个id
                            ids= ids+$(ck).attr("tid")+",";
                        }
                        ids= ids.substring(0,ids.length-1);
                        location.href="${pageContext.request.contextPath}/news/delete.action?ids="+ids;
                    }
                }


            })

            $("input[value=添加]").click(function () {
                location.href="/news/toinsert.action";
            })

            $("input[value=删除]").click(function () {
                var  id =$(this).attr("id");
                if (confirm("您确定要删除吗")) {
                    location.href = "/news/todelete.action?id="+id;
                }
            })
            $("input[value=修改]").click(function () {
                var  id=$(this).attr("id");
                location.href="/news/toupdate.action?id="+id;

            })



        })


    </script>
</head>
<body>
        <center>
        <form action="/news/findAll.action">
            <%--页面数--%>
            <input type="hidden" name="pageNum" id="pid" value="${pageInfo.pageNum}"/>
                <%--查询区域--%>
                <input type="button" id="id1" value="批量删除">&nbsp;
                标题:<input type="text" name="title" placeholder="请输入" value="${type}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                入职开始日期:<input type="date" name="start" value="${start}"/>&nbsp;&nbsp;
                入职结束日期:<input type="date" name="end" value="${end}"/>&nbsp;&nbsp;
                <input type="submit" value="查询"/>&nbsp;&nbsp;&nbsp;
                <input type="button" value="添加"/>
            <table border="1" cellspacing="0" cellpadding="0" width="1000  px">
                <tr>
                    <th width="50px"><input type="checkbox" id="id8" name="checkall"></th>
                    <th width="50px">序号</th>
                    <th width="100px">新闻类别</th>
                    <th width="100px">新闻标题</th>
                    <th width="150px">发布时间</th>
                    <th width="100px">操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" varStatus="vs" var="all" >
                <tr align="center">
                    <td><input type="checkbox" name="ck" id="ck${vs.index+1}"tid="${all.id}" ></td>
                    <td>${vs.index+1}</td>
                    <td>${all.type}</td>
                    <td>${all.title}</td>
                    <td><fmt:formatDate value="${all.createtime}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <input type="button" value="删除" id="${all.id}">
                        <input type="button" value="修改" id="${all.id}">
                    </td>
                </tr>
                </c:forEach>
            </table>
                当前页:${pageInfo.pageNum}/${pageInfo.pages} 总条数${pageInfo.total}
                <input type="button" value="首页" onclick="jump(1)">
                <input type="button" value="上一页" onclick="jump(${pageInfo.pageNum-1})">
                <input type="button" value="下一页" onclick="jump(${pageInfo.pageNum+1})">
                <input type="button" value="尾页" onclick="jump(${pageInfo.pages})">
        </form>
        </center>
</body>

</html>

