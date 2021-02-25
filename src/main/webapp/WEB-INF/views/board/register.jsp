<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/design.css"/>" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script type="text/javascript">
	//이미지 정보를 담을 배열
	var sel_files = [];
	
	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		//이미지 정보 초기화
		sel_files = [];
		$(".imgs_wrap").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			sel_files.push(f);
			
			var reader = new FileReader();
			reader.onload = function(e) {
				var html = '<img src="' + e.target.result + '" class="img-fluid" />';
				$(".imgs_wrap").append(html);
			}
			reader.readAsDataURL(f);
		});
	}
</script>

<title>Share Square</title>
</head>
<body>
	<u:navbar_board></u:navbar_board>

	<div class="container-sm">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<h1>게시물 작성</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<form method="post" enctype="multipart/form-data">
					<div class="form-group">						
						<label for="input1">제목</label> 
						<input name="title" type="text"
							class="form-control" id="input1" placeholder="제목을 입력하세요.">
						<small id="nullTitle" class="form-text text-muted">${nullTitle }</small>
					</div>
					<div class="form-group">
						<label for="textarea1">내용</label>
						<textarea name="content" class="form-control" id="textarea1"
							rows="3"></textarea>
						<small id="nullContent" class="form-text text-muted">${nullContent }</small>
					</div>
					<div class="form-group">
						<label for="input_imgs">이미지 파일</label> 
						<input name="files" type="file" multiple="multiple"
							accept="image/*" class="form-control" id="input_imgs">
						<span>Shift, Ctrl을 누르면서 여러 파일을 선택할 수 있어요</span>
						<br>
						<span>주의! 이미지 파일명을 다르게 설정해서 업로드하세요</span>
						<br>
						<span>주의! 이미지 파일명을 영문으로 설정해서 업로드하세요</span>
						<small id="uploadFail" class="form-text text-muted">${uploadFail }</small>
						<div class="imgs_wrap">
							<img id="img"/>
						</div>						
					</div>
					<div class="form-group">
						<label for="input2">작성자</label>
						<input name="writer_name"
							type="text" value="${authUser.name }" class="form-control"
							id="input2" readonly>
					</div>
					<input type="hidden" name="mno" value="${authUser.mno }">
					<input type="hidden" name="writer_id" value="${authUser.id }">
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>