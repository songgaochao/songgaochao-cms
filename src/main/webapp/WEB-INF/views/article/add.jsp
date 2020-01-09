<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
<form>
	<div class="form-group row">
		<label for="inputEmail3" class="col-sm-2 col-form-label">文章标题</label>
		<div class="col-sm-5">
			<input type="email" class="form-control" id="inputEmail3">
		</div>
	</div>
	<div class="form-group row">
		<label for="inputPassword3" class="col-sm-2 col-form-label">文章图片</label>
		<div class="col-sm-5">
			<jsp:include page="../common/file.jsp">
				<jsp:param name="fieldName" value="picture"/>
				<jsp:param name="fieldValue" value=""/>
			</jsp:include>
		</div>
	</div>
	<div class="form-group row">
		<label for="inputPassword3" class="col-sm-2 col-form-label">所属频道</label>
		<div class="col-sm-5">
			<select class="form-control" id="exampleFormControlSelect1">
				<option>请选择频道</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>
		</div>
	</div>

	<div class="form-group row">
		<label for="inputPassword3" class="col-sm-2 col-form-label">所属分类</label>
		<div class="col-sm-5">
			<select class="form-control" id="exampleFormControlSelect1">
				<option>请选择分类</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-sm-2">文章内容</div>
		<div class="col-sm-10">
			<div>
				<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea>
			</div>
		</div>
	</div>
	<button type="button" class="btn btn-primary mb-2" onclick="save();">保存</button>
	<button type="button" class="btn btn-primary mb-2">保存并提交审核</button>
</form>
<script type="text/javascript">
	function save(){
		var content = editor1.html();
		console.log(content);
		//openPage("/article/articles");
	}
</script>