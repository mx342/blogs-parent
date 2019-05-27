<#include "/admin/utils/ui.ftl"/>
<@layout>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>栏目管理</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li>
                        <a href="${base}/admin/tags/view">添加标签</a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <table id="dataGrid" class="table table-striped table-bordered b-t">
                    <thead>
                    <tr>
                        <th width="80">#</th>
                        <th>名称</th>
                        <th>排序</th>
                        <th>状态</th>
                        <th width="200"></th>
                    </tr>
                    </thead>
                    <tbody>
                        <#list data as row>
                        <tr>
                            <td class="text-center">${row.id}</td>
                            <td>${row.name}</td>
                            <td>${row.sort}</td>
                            <td>
                                <#if (row.status == 10)>
                                    <span class="label label-info">显示</span>
                                <#else>
                                    隐藏
                                </#if>
                            </td>
                            <td class="text-center">
                                <a href="view?id=${row.id}" class="btn btn-xs btn-success">
                                <i class="fa fa-edit"></i> 修改
                                </a>
                                <a href="${base}/admin/tags/up/${row.id}" class="btn btn-xs btn-info">
                                    <i class="fa fa-edit"></i>上移
                                </a>
                                <a href="${base}/admin/tags/down/${row.id}" class="btn btn-xs btn-danger" >
                                    <i class="fa fa-edit"></i>下移
                                </a>
                                <#--<a href="javascript:void(0);" class="btn btn-xs btn-white" data-id="${row.id}"-->
                                   <#--data-action="delete">-->
                                    <#--<i class="fa fa-bitbucket"></i> 删除-->
                                <#--</a>-->
                            </td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var J = jQuery;

    function ajaxReload(json) {
        if (json.code == 0) {
            layer.msg(json.msg, {icon: 1});
            setTimeout(function(){
                window.location.reload();
            },1000);
        } else {
            layer.msg(json.msg, {icon: 2});
        }
    }

    $(function () {
        // 删除
        $('#dataGrid a[data-action="delete"]').bind('click', function () {
            var that = $(this);
            layer.confirm('确定删除此项吗?', {
                btn: ['确定', '取消'], //按钮
                shade: false //不显示遮罩
            }, function () {
                J.getJSON('${base}/admin/group/delete/' + that.attr('data-id'), ajaxReload);
            }, function () {
            });
            return false;
        });

    })
</script>
</@layout>