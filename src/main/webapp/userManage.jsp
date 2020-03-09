<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<% String path = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="style/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="style/common/bootstrap/css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="style/common/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="style/css/personal.css" media="all">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/sweetalert.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/sweetalert.min.js"></script>
</head>
<body>
<section class="layui-larry-box">
    <div class="larry-personal">
        <div class="layui-tab">

            <blockquote class="layui-elem-quote news_search">
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input value="" placeholder="请输入关键字" class="layui-input search_input" type="text">
                    </div>
                    <a class="layui-btn search_btn">查询</a>
                </div>
            </blockquote>

            <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
                <!-- 管理用户 -->
                <div class="layui-tab-item layui-field-box layui-show">
                    <table class="layui-table table-hover" lay-even="" lay-skin="nob">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>性别</th>
                            <th>手机号</th>
                            <th>邮箱地址</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody class="showUser">

                        </tbody>
                    </table>
                </div>
                <!--管理结束-->
                <form id="queryform" action="user/query" method="post">
                    <input type="hidden" name="pageNum" id="pageNum" value="1">
                    <input type="hidden" name="pageSize" id="pageSize" value="5">
                    <input type="hidden" name="userName">
                </form>
                <!--分页显示-->
                <div class="Pagination" style="font-size: large;color: orangered;"></div>
            </div>
        </div>
    </div>
</section>
<script>
    $(function() {
        //ajax的form表示提交
        function ajaxSubmit() {
            $("#queryform").ajaxSubmit(function (result) {
                var str = "";
                // 1.遍历职位数据
                $.each(result.list, function (index,u) {
                    str += "<tr>\n" +
                        "                            <td>"+u.userId+"</td>\n" +
                        "                            <td>"+u.userName+"</td>\n" +
                        "                            <td>"+u.password+"</td>\n" +
                        "                            <td>"+u.sex+"</td>\n" +
                        "                            <td>"+u.phone+"</td>\n" +
                        "                            <td>"+u.email+"</td>\n" +
                        "                            <td>\n" +
                        "                                <a href='javascript:editUser(\"+u.userId+\")' class=\"layui-btn layui-btn-small\">详情</a>&nbsp;<a href='javascript:delUser("+u.userId+")' class=\"layui-btn layui-btn-small\"><i class=\"iconfont icon-shanchu1\"/>删除</a>\n" +
                        "                            </td>\n" +
                        "                        </tr>";
                })
                // 拼接后的数据填充到指定div中
                $(".showUser").html(str);
                // 2.显示分页
                var pageInfo = "";

                // 默认样式：已经是当前页就会点亮，设置不可以用,使用span标签，其他可用的使用a标签
                if (result.pageNum == 1) {
                    pageInfo = "<span class=\"disabled\" title=\"1\">首页</span>"
                    pageInfo += "<span class=\"disabled\" title=\"1\">上一页 </span>";
                } else {
                    pageInfo = "<a  title=\"1\">首页</a>";
                    pageInfo += "<a title=\"" + result.prePage + "\">上一页 </a>"
                }

                for (var i = 1; i <= result.pages; i++) {
                    if (result.pageNum == i) {
                        pageInfo += "<span class=\"current\" title=\"" + i + "\">" + i + "</span>"
                    } else {
                        pageInfo += "<a title=\"" + i + "\">" + i + "</a>"
                    }
                }

                if (result.pageNum == result.pages) {
                    pageInfo += "<span class=\"disabled\" title=\"" + result.pages + "\">下一页 </span>";
                    pageInfo += "<span class=\"disabled\" title=\"" + result.pages + "\">尾页</span>"
                } else {
                    pageInfo += "<a  title=\"" + result.nextPage + "\">下一页 </a>"
                    pageInfo += "<a  title=\"" + result.pages + "\">尾页</a>"
                }

                // 将分页数据填充到指定div中
                $(".Pagination").html(pageInfo);
            })
        }

        ajaxSubmit();//调用ajaxForm表单方法
        // 切换页码
        $(document).on("click", ".Pagination a", function () {
            var pageNum = $(this).prop("title"); // 每一个超链接上的title属性就是页码
            $("#pageNum").val(pageNum);
            ajaxSubmit();
        });
        $("#search_button").click(function () {
            var val = $("#search_input").val();//取文本输入框中输入的值
            $("input[name=sName]").val(val);//设置到queryform表单中sName中
            $("#pageNum").val(1);
            ajaxSubmit();//调用ajaxForm表单方法
            return false;
        });
    })
    //删除功能
    function delUser(id) {
        if(confirm("是否确定删除？")){
            var id = id;
            $.ajax({
                type:"post",
                url:"user/del",
                data:{
                    userId : id
                },
                dataType : "jsonp",//数据类型为json
                jsonp:"jsoncallback",
                success : function(data){
                    if(data=="true"){
                        swal("", "删除成功！", "success");
                        setTimeout("location.href = 'http://" + location.host + "<%=path%>"
                            +"/userManage.jsp'",500);
                    }else{
                        sweetAlert("", "删除失败！", "error");
                    }
                }
            })
        }
    }
</script>
</body>
</html>
