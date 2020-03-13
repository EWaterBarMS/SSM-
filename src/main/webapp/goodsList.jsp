<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div style="margin-left: 20px;margin-right: 20px">
    <div style="margin-top: 30px">
        <form action="${pageContext.request.contextPath}/goods/query" method="post" id="queryForm">
            <input type="text" value="${gname}" name="goods_name" id="queryText"/>
            <input type="submit" value="查询">
            <input name="pageNum" id="pageNum" value="${p.pageNum}" hidden/>
            <input name="pagSize" id="pageSize" value="${p.pageSize}" hidden/>
        </form>
    </div>
    <div>
        <table class="table table-striped"  width="100%" style="text-align: center">
            <div>
                <thead>
                <tr>
                    <td>序号</td>
                    <td>商品名称</td>
                    <td>图片</td>
                    <td>生厂日期</td>
                    <td>保质期</td>
                    <td>单价</td>
                    <td>余量</td>
                    <td>操作</td>
                </tr>
                </thead>
            </div>
            <div>
                <tbody>
                <c:if test="${p.size == 0}">
                    <h3>神马都没有找到哦</h3>
                </c:if>
                <c:forEach items="${p.list}" var="v" varStatus="vs">
                    <tr>
                        <td>${vs.index+1}</td>
                        <td>${v.goods_name}</td>
                        <td><img width='50px' height='50px' src='${pageContext.request.contextPath}/uploadFile/${v.pic}?did=new Date().getTime()'/></td>
                        <td>${v.production}</td>
                        <td>${v.guarantee}</td>
                        <td>${v.price}</td>
                        <td>${v.counts}</td>
                        <td>
                            <button>立即购买</button>
                            <button>加入购物车</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </div>
        </table>
    </div>
    <div style="text-align: center">
        共${p.total}条记录&nbsp&nbsp共${p.pages}页&nbsp&nbsp当前第${p.pageNum}页
    </div>
    <div style="text-align: center">
        <c:if test="${p.total!=0}">
            <ul class="pagination" id="page">
                <li ${p.pageNum==1 ? 'class="disabled"' :''}><a href="javascript:void(0);" onclick="getPage(1)">&laquo;</a></li>
                <c:forEach items="${p.navigatepageNums}" var="num">
                    <li ${num==p.pageNum ? 'class="active"' :''}><a href="javascript:void(0);" onclick="getPage(${num})">${num}</a></li>
                </c:forEach>
                <li ${p.pageNum==p.pages ? 'class="disabled"' :''}><a href="javascript:void(0);" onclick="getPage(${p.pages})">&raquo;</a></li>
            </ul>
        </c:if>
    </div>
</div>
<script>
    $(document).ready(function(){
        $("#queryText").blur(function () {
            $("#queryForm").submit();
        });
    });

    function getPage(pageNum){
        $("#pageNum").val(pageNum);
        $("#queryForm").submit();
    }
</script>
</body>
</html>
