<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
$(document).ready(function() {
	$("#remove-btn").click(function(e) {
		e.preventDefault();
		$("#modify-form").attr("action", "${root}/board/remove");
		$("#modify-form").submit();
	});
});
</script>

<title>Insert title here</title>
</head>
<body>
<u:navbar></u:navbar>
<div class="container-sm">	
	<div class="row">
		<div class="col-12 col-sm-6 offset-md-3">
			<h1>게시물 수정</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-12 col-sm-6 offset-md-3">
			<%-- <form action="${pageContext.request.contextPath }/board/register"> --%>
			<form method="post" action="${root }/board/modify" id="modify-form">
		    	 <div class="form-group">
		    	 	<label for="bno">번호</label>
		    	 	<input name="bno" value='<c:out value="${board.bno }"/>' readonly type="text" class="form-control" id="bno">
		    	 </div>
				 <div class="form-group">
				    <label for="input1">제목</label>
				    <input name="title" value='<c:out value="${board.title }"/>' type="text" class="form-control" id="input1">
			     </div>
			      	<label for="textarea1">내용</label>
	    			<textarea name="content" class="form-control" id="textarea1" rows="3"><c:out value="${board.content }"/></textarea>
			     <div class="form-group">
				    <label for="input2">작성자</label>
				    <input name="writer" value='<c:out value="${board.writer }"/>' readonly type="text" class="form-control" id="input2">
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