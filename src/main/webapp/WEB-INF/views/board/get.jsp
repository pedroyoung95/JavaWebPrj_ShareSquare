<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var appRoot = '${root}';
var bno = ${board.bno};
</script>
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
/* replyService.getList(
		{bno:116, page:1},
		function(data) {
			console.log(data);
		},
		function() {
			console.log("error");
		}); */
/* replyService.remove(
		8,
		function(data) {
			console.log(data);
		},
		function() {
			console.log("error");
		}); */
/* replyService.update({
	rno:21,
	reply:"new updated reply!"
	},
	function(data) {
		console.log(data);
	},
	function() {
		console.log("error");
	});
replyService.get(
		10,
		function(data) {
			console.log(data);
		},
		function() {
			consol.log("not found");
		}); */
</script>

<script type="text/javascript">
$(document).ready(function() {
	//댓글 가져오는 자바스크립트 함수 정의
	function showList() {
		replyService.getList(
			{bno:bno, page:${cri.pageNum }},
			function(list) {
				console.log(list);
				var replyUL = $("#reply-ul");
				for(var i = 0; i < list.length; i++) {
					var replyLI = '<li class="media" data-rno="' 
						+ list[i].rno + '"><div class="media-body"><h5>' 
						+ list[i].replyer + "<small>" 
						+ list[i].replyDate + '</small></h5>'
						+ list[i].reply + "<hr></div></li>";
						
						replyUL.append(replyLI);
				}
			}
		);
	}
	//댓글 목록 가져오기 함수를 호출해서 실행
	showList();
	
	//댓글 작성 모달창 이벤트 처리
	$("#new-reply-button").click(function() {
		console.log("new reply button clicked......");
		$("#new-reply-modal").modal("show");
	});
	
	//새 댓글 등록 버튼 클릭 이벤트 처리
	$("#reply-submit-button").click(function() {
		//input에서 value를 가져와서 변수에 저장
		var reply = $("#reply-input").val();
		var replyer = $("#replyer-input").val();
		//ajax 요청을 위한 데이터, 성공 했을 때/실패 했을 때의 처리
		var data = {bno:bno, reply:reply, replyer:replyer};
		var success = function() {
			alert("댓글 등록 성공");
		};
		var error = function() {
			alert("댓글 등록 실패")
		};
		
		replyService.add(data, success, error);
	});	
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

<!--댓글 목록 container-->
<div class="container-sm mt-3">
	<div class="row">
		<div class="col-12 col-sm-6 offset-md-3">
			<div class="card">
				<div class="card-header d-flex justify-content-between align-items-center">
					<span>댓글 목록</span>					
					<button class="btn btn-info" id="new-reply-button">댓글 쓰기</button>
				</div>
				<div class="card-body">
					<ul class="list-unstyled" id="reply-ul">
						<!--댓글 한 개가 li 한 개
						자바스크립트로 reply가 담긴 list를 for문으로 돌려서
						<ul>에 append해서 출력
						-->
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!--새 댓글 form을 modal로 표현-->
<div class="modal fade" id="new-reply-modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					새 댓글
				</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span>&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="reply-input" class="col-form-label">댓글</label>
					<input type="text" class="form-control" id="reply-input">
				</div>
				<div class="form-group">
					<label for="replyer-input" class="col-form-label">
						작성자
					</label>
					<input type="text" class="form-control" id="replyer-input">
				</div>
			</div>		
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="reply-submit-button">등록</button>
			</div>	
		</div>
	</div>
</div>

</body>
</html>