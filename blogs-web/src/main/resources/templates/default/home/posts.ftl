<#include "/default/utils/layout.ftl"/>
<#include "/default/utils/utils.ftl"/>

<@ui_home "我的主页">

<div class="shadow-box">
	<div class="filter">
		<ul class="">
			<li><a class="active" href="${base}/home/articles/1">我的文章</a></li>
		</ul>
	</div>
	<!-- tab panes -->
	<div class="stream-list">
		<#list page.items as row>
		<div class="stream-item" id="loop-${row.id}">
			<div class="blog-rank">
				<div class="votes #if(${row.favors} > 0) plus #end">
					${row.favors}<small>喜欢</small>
				</div>
				<div class="views hidden-xs">
					${row.comments}<small>评论</small>
				</div>
			</div>
			<div class="summary">
				<h2 class="title"><a href="${base}/article/${row.id}">${row.title}</a></h2>
				<div class="excerpt wordbreak hidden-xs">${row.summary} &nbsp;</div>

				<!--前端图片显示样式-->
				<#if row.albums??>
				<!--Start-->
				<div class="thumbs clearfix">
					<#list row.albums as alb>
						<#if (alb_index < 3)>
						<div class="media col-xs-4 col-sm-4 col-md-4">
							<#--<a title="${row.title}" href="#resource(${alb.original})">-->
								<#--<@albShow alb/>-->
							<#--</a>-->
							<@albShow2 row alb/>
						</div>
						</#if>
					</#list>
				</div>
				<!--End-->
				</#if>

				<div class="foot-block clearfix">
					<div class="author">
						<#--TODO 加上时间<time>${timeAgo(row.createTime)}</time>-->
					</div>
					<ul class="tags">
						<#list row.tagsArray as tag>
						<li>
							<a class="tag tag-sm" href="${base}/tag/${tag}">${tag}</a>
						</li>
						</#list>
					</ul>
					<div class="pull-right hidden-xs">
						<a class="act_edit" href="javascript:void(0);" data-evt="edit" data-id="${row.id}">修改</a>
						<a class="act_delete" href="javascript:void(0);" data-evt="trash" data-id="${row.id}">删除</a>
					</div>
				</div>
			</div>
		</div>
		</#list>

		<#if page.items?size == 0>
		<div class="stream-item">
			<i class="fa fa-info-circle fa-lg"></i> 您还没发表过文章!
		</div>
		</#if>

	</div>
</div>
<div class="text-center clr">
	<@pager "/home/articles" page 3 />
</div>

<script type="text/javascript">
$(function() {
	// delete
	$('a[data-evt=trash]').click(function () {
		var id = $(this).attr('data-id');
		layer.confirm('确定删除此项吗?', {
            btn: ['确定','取消'], //按钮
            shade: false //不显示遮罩
        }, function(){
			jQuery.getJSON('${base}/home/article/delete/' + id, function (ret) {
				if (ret.code == 0) {
                    layer.msg(ret.msg, {icon: 1});
					$('#loop-' + id).fadeOut();
					$('#loop-' + id).remove();
				} else {
                    layer.msg(ret.msg, {icon: 5});
				}
			});
        }, function(){
        });
	});
	
	// edit
	$('a[data-evt=edit]').click(function () {
		var id = $(this).attr('data-id');
		window.location.href='${base}/home/article/edit/' + id;
	});
})
</script>
</@ui_home>