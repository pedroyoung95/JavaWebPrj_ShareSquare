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
		//carousel options
		$('.carousel').carousel({
		  interval: false
		});
		
		//글 삭제 이벤트 실행
		$("#remove-btn").click(function(e) {
			e.preventDefault();
			$("#modify-form").attr("action", "${root}/board/remove");
			$("#modify-form").submit();
		});
		
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
				<h1>게시물 수정</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<form method="post" action="${root }/board/modify" id="modify-form">
					<div class="form-group">
						<label for="bno">번호</label> 
						<input name="bno"
							value='<c:out value="${board.bno }"/>' readonly type="text"
							class="form-control" id="bno">
					</div>
					<div class="form-group">
						<label for="input1">제목</label> 
						<input name="title"
							value='<c:out value="${board.title }"/>' type="text"
							class="form-control" id="input1">
						<small id="nullTitle" class="form-text text-muted">${nullTitle }</small>
					</div>
					<div class="form-group">
						<label for="textarea1">내용</label>
						<textarea name="content" class="form-control" 
							id="textarea1" rows="3"><c:out value="${board.content }" /></textarea>
						<small id="nullContent" class="form-text text-muted">${nullContent }</small>
					</div>						
					<div id="carousel-imgs" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<c:forEach items="${images}" varStatus="status">
								<li data-target="#carousel-imgs"
									data-slide-to="${status.index }"></li>
							</c:forEach>
						</ol>
						<div class="carousel-inner">
							<c:forEach items="${images}" var="image" varStatus="status">
								<c:if test="${status.first }">
									<div class="carousel-item active">
										<img alt="${status.index }" class="d-block w-100"
											src="${staticPath }${image.filename }" >
									</div>
								</c:if>
								<c:if test="${not status.first }">
									<div class="carousel-item">
										<img alt="${status.index }" class="d-block w-100"
											src="${staticPath }${image.filename }" >
									</div>
								</c:if>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carousel-imgs"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> 
						<a class="carousel-control-next" href="#carousel-imgs"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
					<div class="form-group">
						<label for="input2">작성자</label> 
						<input name="writer"
							value='<c:out value="${board.writer_name }"/>' readonly
							type="text" class="form-control" id="input2">
					</div>
					<input hidden value="${cri.pageNum }" name="pageNum"> 
					<input type="hidden" value="${cri.amount }" name="amount">
					<input type="hidden" value="${cri.type }" name="type"> 
					<input type="hidden" value="${cri.keyword }" name="keyword">
					<button type="submit" class="btn btn-primary">수정</button>
					<button id="remove-btn" type="submit" class="btn btn-danger">삭제</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>