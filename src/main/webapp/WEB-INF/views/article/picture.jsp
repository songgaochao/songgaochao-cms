<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	var editor1 = null;
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="content1"]', {
			cssPath : '/public/kindeditor/plugins/code/prettify.css',
			uploadJson : '/file/uploadImg',
			fileManagerJson : '/public/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>

<form id="saveForm">
	<div class="form-group row">
		<label for="inputEmail3" class="col-sm-2 col-form-label">描述文本</label>
		<div class="col-sm-5">			
		<textarea class="form-control" id="content" name="content" rows="2" placeholder="请输入描述" style="height: 60px"></textarea>		
		</div>
	</div>
	<div class="form-group row">
		<label for="inputPassword3" class="col-sm-2 col-form-label">图片发布</label>
		<div class="col-sm-5">
		<textarea name="content1" id="picture" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${article.content }</textarea>
		
		</div>
	</div>
	<button type="button" class="btn btn-primary mb-2" onclick="save();">保存</button>
	<div class="alert alert-success" role="alert" style="display: none"></div>
</form>

<script type="text/javascript">
	
	function save(){
		var nickname = $("#content").val();
		var headimg = $("#picture").val();
		if(nickname==null || nickname==""){
			$(".alert").html("描述不能为空");
			$(".alert").show();
			return;
		}
		if(headimg==null || headimg==""){
			$(".alert").html("图片不能为空");
			$(".alert").show();
			return;
		}
		$(".alert").hide();
		
		$.post("/article/topicture",$("#saveForm").serialize(),function(res){
			if(res.result){
				alert("发布成功")
				
				location="http://localhost/";
			}
		})
		
	}
</script>