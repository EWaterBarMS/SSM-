<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>商品列表</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <%--<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/jquery.form.js" type="text/javascript"></script>
    <script src="js/jquery.formjson.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<hr>
<div style="text-align: center">
    <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">新加商品</button>
</div><br>

<table border="1" width="100%" style="text-align: center" id="queryTable">
    <thead>
    <tr>
        <td>商品编号</td>
        <td>商品名称</td>
        <td>图片</td>
        <td>生厂日期</td>
        <td>保质期</td>
        <td>单价</td>
        <td>余量</td>
        <td>备注</td>
        <td>操作</td>
    </tr>
    </thead>
    <tbody>

    </tbody>
</table>

<script>
    $(document).ready(function(){

        queryAll();

        // 新加商品
        $("#addbut").click(function () {

            $("#addform").ajaxForm({
                dataType:"json",
                resetForm:true,
                success:function(res){
                    alert(res.msg);
                    $("#addModal").modal('hide');
                    queryAll();
                }
            });
            $("#addform").submit();
        });

        // 修改商品
        $("#modbut").click(function () {

            $("#modform").ajaxForm({
                dataType:"json",
                resetForm:true,
                success:function(res){
                    alert(res.msg);
                    $("#modModal").modal('hide');
                    queryAll();
                },
                error:function (xhr) {
                    alert(xhr.responseText);
                }
            });
            $("#modform").submit();
        });

    })
    function queryAll(){
        $.ajax({
            url:"goods/manage",
            type:"GET",  //查询
            async:true,  // 异步
            data:{},
            dataType:"JSON",
            success:function(res){
                $("#queryTable tbody").empty();
                $.each(res,function () {
                    $("<tr><td>"+ this.goods_id + "</td><td>"+ this.goods_name +
                        "</td><td><img width='50px' height='50px' src='uploadFile/"+ this.pic +
                        "?did=\"+new Date().getTime()'/></td><td>"+ this.production +
                        "</td><td>"+ this.guarantee +
                        "</td><td>"+ this.price+
                        "</td><td>"+ this.counts +
                        "</td><td>"+ this.mark +
                        "</td><td><button onclick='get("+ this.goods_id +
                        ")'>详情</button>&nbsp;&nbsp;<button onclick='del("+ this.goods_id +
                    ")'>删除</button></td>").appendTo($("#queryTable tbody"))
                });
            },
        });
    }

    //删除
    function del(gid){
        if(!confirm("你确定删除？"))
            return;
        $.ajax({
            url:'goods/manage/'+gid ,
            type:"DELETE",  //删除
            async:true,  // 异步
            data:{},
            dataType:"JSON",
            success:function(res){
                alert(res.msg);
                queryAll();
            },
        });
    }

    // 类型详情
    function get(gid){
        $.ajax({
            url:'goods/manage/'+gid ,
            type:"GET",  //查询
            async:true,  // 异步
            data:{},
            dataType:"JSON",
            success:function(res){
                $("#goods_id_mod").val(res.goods_id);
                $("#goods_name_mod").val(res.goods_name);
                $("#production_mod").val(res.production);
                $("#guarantee_mod").val(res.guarantee);
                $("#price_mod").val(res.price);
                $("#counts_mod").val(res.counts);
                $("#mark_mod").val(res.mark);
                $("#pic_mod").prop("src","uploadFile/"+res.pic +"?did="+new Date().getTime() );
                $("#modModal").modal("show");
            },
        });
    }

</script>

<!--新加模态框开始-->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="addModalLabel">
                    商品添加
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="addform" method="post" action="goods/manage" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="goods_name" class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="goods_name" class="form-control" id="goods_name" placeholder="商品名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="production" class="col-sm-2 control-label">生厂日期</label>
                        <div class="col-sm-10">
                            <input type="date" name="production" class="form-control" id="production" placeholder="生厂日期">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="guarantee" class="col-sm-2 control-label">保质期</label>
                        <div class="col-sm-10">
                            <input type="text" name="guarantee" class="form-control" id="guarantee" placeholder="保质期">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="price" class="col-sm-2 control-label">单价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="price" placeholder="单价">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="counts" class="col-sm-2 control-label">余量</label>
                        <div class="col-sm-10">
                            <input type="number" name="counts" class="form-control" id="counts" placeholder="余量">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mark" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" name="mark" class="form-control" id="mark" placeholder="备注">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="myfile" class="col-sm-2 control-label">商品图片</label>
                        <div class="col-sm-10">
                            <input type="file" name="myfile" class="form-control" id="myfile" placeholder="商品图片">
                        </div>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="addbut">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--修改模态框开始-->
<div class="modal fade" id="modModal" tabindex="-1" role="dialog" aria-labelledby="modModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="modModalLabel">
                    商品修改
                </h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="modform" action="goods/managemod" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="goods_id_mod" class="col-sm-2 control-label">商品编号</label>
                        <div class="col-sm-10">
                            <input type="text" disabled name="goods_id" class="form-control" id="goods_id_mod" placeholder="商品编号">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="goods_name_mod" class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-10">
                            <input type="text" name="goods_name" class="form-control" id="goods_name_mod" placeholder="商品名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="production_mod" class="col-sm-2 control-label">生厂日期</label>
                        <div class="col-sm-10">
                            <input type="date" name="production" class="form-control" id="production_mod" placeholder="生厂日期">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="guarantee_mod" class="col-sm-2 control-label">保质期</label>
                        <div class="col-sm-10">
                            <input type="text" name="guarantee" class="form-control" id="guarantee_mod" placeholder="保质期">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="price_mod" class="col-sm-2 control-label">单价</label>
                        <div class="col-sm-10">
                            <input type="text" name="price" class="form-control" id="price_mod" placeholder="单价">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="counts_mod" class="col-sm-2 control-label">余量</label>
                        <div class="col-sm-10">
                            <input type="number" name="counts" class="form-control" id="counts_mod" placeholder="余量">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mark_mod" class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input type="text" name="mark" class="form-control" id="mark_mod" placeholder="备注">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="myfile_mod" class="col-sm-2 control-label">类型图片</label>
                        <div class="col-sm-10">
                            <input type="file" name="myfile" class="form-control" id="myfile_mod" placeholder="类型图片">
                        </div>
                    </div>
                    <div class="form-group">
                        <img id="pic_mod" width="50px">
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="modbut">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
