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
<script type="text/javascript" src="${root }/resources/js/reply.js"></script>

<script type="text/javascript">
/* console.log(replyService.name);
replyService.add("my reply"); */
/* replyService.add({
	bno:130, 
	reply:"new reply 댓글",
	replyer:"tester"
	}, function(result) {
		console.log(result);
	}, function(err) {
		console.log(err);
	}); */
replyService.getList(
		{bno:116, page:1},
		function(data) {
			console.log(data);
		},
		function() {
			console.log("error");
		});
</script>

<title>게시글 조회</title>
</head>
<body>
<u:navbar></u:navbar>
<%-- <h1>pageNum : ${cri.pageNum }</h1>
<h1>amount : ${cri.amount }</h1> --%>
<div class="container-sm">	
	<div class="row">
		<div class="col-12 col-sm-6 offset-md-3">
			<h1>게시물 보기</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-12 col-sm-6 offset-md-3">
			<%-- <form action="${pageContext.request.contextPath }/board/register"> --%>
			<form method="post">
		    	 <div class="form-group">
		    	 	<label for="bno">번호</label>
		    	 	<input name="bno" value='<c:out value="${board.bno }"/>' readonly type="text" class="form-control" id="bno">
		    	 </div>
				 <div class="form-group">
				    <label for="input1">제목</label>
				    <input name="title" value='<c:out value="${board.title }"/>' readonly type="text" class="form-control" id="input1">
			     </div>
			      	<label for="textarea1">내용</label>
	    			<textarea name="content" readonly class="form-control" id="textarea1" rows="3"><c:out value="${board.content }"/></textarea>
			     <div class="form-group">
				    <label for="input2">작성자</label>
				    <input name="writer" value='<c:out value="${board.writer }"/>' readonly type="text" class="form-control" id="input2">
			     </div>
			</form>
			<c:url value="/board/modify" var="modifyLink">
				<c:param name="bno" value="${board.bno }"></c:param>
				<c:param name="pageNum" value="${cri.pageNum }"></c:param>
				<c:param name="amount" value="${cri.amount }"></c:param>
				<c:param name="type" value="${cri.type }"></c:param>
            	<c:param name="keyword" value="${cri.keyword }"></c:param>
			</c:url>
			<a href="${modifyLink }" class="btn btn-secondary">수정</a>
		</div>
	</div>
</div>
</body>
</html>