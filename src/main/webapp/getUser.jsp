<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<html>
<body>
<h3 style="margin-left: 240px">用户信息</h3>
<hr>
<div>
    <form class="form-horizontal" role="form" method="post">
        <div class="form-group">
            <label for="userId" class="col-sm-2 control-label">用户编号</label>
            <div class="col-sm-4">
                <input readonly class="form-control" name="userId" id="userId" value="${u.userId}">
            </div>
        </div>
        <div class="form-group">
            <label for="userName" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-4">
                <input id="userName" class="form-control" value="${u.userName}" name="userName" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-4">
                <input id="password" readonly class="form-control" value="${u.password}" name="password"/>
            </div>
        </div>
        <div class="form-group">
            <label for="sex" class="col-sm-2 control-label">性别</label>
            <div class="col-sm-4">
                <input id="sex" readonly class="form-control" value="${u.sex}" name="sex"/>
            </div>
        </div>
        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label">手机号</label>
            <div class="col-sm-4">
                <input id="phone" readonly class="form-control" value="${u.phone}" name="phone"/>
            </div>
        </div>
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-4">
                <input id="email" type="email" readonly class="form-control" value="${u.email}" name="email"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <a class="btn btn-primary" style="width: 100px" href="userManage.jsp">返回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>

