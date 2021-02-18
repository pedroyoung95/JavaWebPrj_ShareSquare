<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var appRoot = '${root}';
var bno = ${board.bno};
var authUserId = '${authUser.id}';
</script>
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
<script type="text/javascript" src="${root }/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	//날짜 형식
	function dateString(date) {
		var d = new Date(date);
		return d.toISOString().split("T")[0];
	}
	//댓글 목록 가져오는 함수 정의
	function showList() {
		replyService.getList(
			{bno:bno, page:${cri.pageNum }},
			function(list) {
				console.log(list);
				var replyUL = $("#reply-ul");				
				for(var i = 0; i < list.length; i++) {
					var replyLI = '<li class="media" data-rno="' 
						+ list[i].rno + '"><div class="media-body"><h5>' 
						+ list[i].replyer_name + '<small class="float-right">'
						+ dateString(list[i].replyDate) + '</small></h5>'
						+ list[i].reply + "<hr></div></li>";
						
						replyUL.append(replyLI);
				}
			}
		);
	}
	
	//댓글 작성 모달창 클릭 이벤트 처리
	$("#new-reply-button").click(function() {
		console.log("new reply button clicked......");
		$("#new-reply-modal").modal("show");
	});
	
	//새 댓글 등록 버튼 클릭 이벤트 처리
	$("#reply-submit-button").click(function() {		
		var reply = $("#reply-input").val();
		var replyer_name = $("#replyer_name-input").val();
		var replyer_id = $("#replyer_id").val();
		var data = {bno:bno, reply:reply, replyer_id:replyer_id, replyer_name:replyer_name};
		var success = function() {
			location.reload(); 
			alert("댓글 등록 성공");
		};
		var error = function() {
			alert("댓글 등록 실패")
		};
		
		replyService.add(data, success, error);
		
		//모달창 닫기
		$("#new-reply-modal").modal("hide");
		//모달창 내의 input에 있는 value 비우기
		$("#new-reply-modal input").val("");
	});	

	//reply-ul 클릭 이벤트 처리
	$("#reply-ul").on("click", "li", function() {
		console.log($(this).attr("data-rno"));

		//하나의 댓글 읽어오기
		var rno = $(this).attr("data-rno");
		var success = function(data) {
			$("#rno-input2").val(rno);
			$("#reply-input2").val(data.reply);
			$("#replyer_name-input2").val(data.replyer_name);
			$("#replyer_id-input2").val(data.replyer_id);
			$("#modify-reply-modal").modal("show");
			
			var replyerId = $("#replyer_id-input2").val();
			console.log(replyerId);
			if(authUserId === replyerId) {
				$("#modify-reply-modal #reply-modify-button").attr("disabled", false);
				$("#modify-reply-modal #reply-delete-button").attr("disabled", false);
			} else {
				$("#modify-reply-modal #reply-modify-button").attr("disabled", true);
				$("#modify-reply-modal #reply-delete-button").attr("disabled", true);
			}
		};
		var error = function() {};
		replyService.get(rno, success, error);		
	});	
	
	//댓글 수정 버튼 클릭 이벤트 처리
	$("#reply-modify-button").click(function() {
		var rno = $("#rno-input2").val();
		var reply = $("#reply-input2").val();
		var data = {rno:rno, reply:reply};
		var success = function() {
			alert("댓글 수정 완료");
			location.reload();
		};
		var error = function() {};
		
		replyService.update(data, success, error);
	});
	
	//댓글 삭제 버튼 클릭 
	$("#reply-delete-button").click(function() {
		var rno = $("#rno-input2").val();
		var success = function() {
			alert("댓글 삭제 완료");
			location.reload();
		};
		var error = function() {};
		
		replyService.remove(rno, success, error);
	});
	
	//댓글 목록 가져오기
	showList();
});
</script>

<title>게시글 조회</title>
</head>
<body>
	<u:navbar_list></u:navbar_list>

	<div class="container-sm">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<h1>게시물 보기</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<form method="post">
					<div class="form-group">
						<label for="bno">번호</label> <input name="bno"
							value='<c:out value="${board.bno }"/>' readonly type="text"
							class="form-control" id="bno">
					</div>
					<div class="form-group">
						<label for="input1">제목</label> <input name="title"
							value='<c:out value="${board.title }"/>' readonly type="text"
							class="form-control" id="input1">
					</div>
					<div class="form-group">
						<label for="textarea1">내용</label>
						<textarea name="content" readonly class="form-control"
							id="textarea1" rows="3"><c:out
								value="${board.content }" /></textarea>
					</div>
					<div class="form-group">
						<div id="carousel-imgs" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<c:forEach items="${board.filename}" varStatus="status">
									<li data-target="#carouselExampleIndicators" 
										data-slide-to="${status.index }" ></li>
							    </c:forEach>
							</ol>
							<div class="carousel-inner">
								<c:forEach items="${board.filename}" var="filename">
									<div class="carousel-item " data-interval="false">
									<img alt="" class="d-block w-100" src="${staticPath }${filename }">
								</div>
								</c:forEach>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleInterval"
								role="button" data-slide="prev"> <span
								class="carousel-control-prev-icon" aria-hidden="true"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="carousel-control-next" href="#carouselExampleInterval"
								role="button" data-slide="next"> <span
								class="carousel-control-next-icon" aria-hidden="true"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
					<div class="form-group">
						<label for="input2">작성자</label> <input name="writer"
							value='<c:out value="${board.writer_name }"/>' readonly
							type="text" class="form-control" id="input2">
					</div>
				</form>
				<c:url value="/board/modify" var="modifyLink">
					<c:param name="bno" value="${board.bno }"></c:param>
					<c:param name="pageNum" value="${cri.pageNum }"></c:param>
					<c:param name="amount" value="${cri.amount }"></c:param>
					<c:param name="type" value="${cri.type }"></c:param>
					<c:param name="keyword" value="${cri.keyword }"></c:param>
				</c:url>
				<c:if test="${authUser.id eq board.writer_id }">
					<a href="${modifyLink }" class="btn btn-primary">수정 및 삭제</a>
				</c:if>
			</div>
		</div>
	</div>

	<!--댓글 목록 container-->
	<div class="container-sm mt-3">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<div class="card">
					<div
						class="card-header d-flex justify-content-between align-items-center">
						<span> 댓글 목록 <c:if test="${board.replyCnt gt 0 }">
								<span class="badge badge-info"> <c:out
										value="${board.replyCnt }"></c:out>
								</span>
							</c:if>
						</span>
						<button class="btn btn-info" id="new-reply-button">댓글 쓰기</button>
					</div>
					<div class="card-body">
						<ul class="list-unstyled" id="reply-ul">
							<!--JavaScript, Ajax로 showlist()-->
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--새 댓글 form modal창-->
	<div class="modal fade" id="new-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">새 댓글</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="reply-input" class="col-form-label">댓글</label> <input
							type="text" class="form-control" id="reply-input">
					</div>
					<div class="form-group">
						<label for="replyer_name-input" class="col-form-label">
							작성자 </label> <input type="text" value="${authUser.name }"
							class="form-control" id="replyer_name-input" readonly> <input
							type="hidden" value="${authUser.id }" id="replyer_id">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary"
						id="reply-submit-button">등록</button>
				</div>
			</div>
		</div>
	</div>

	<!--댓글 수정/삭제가 이뤄질 modal-->
	<div class="modal fade" id="modify-reply-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">수정 / 삭제</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<input id="rno-input2" type="hidden">
					<div class="form-group">
						<label for="reply-input2" class="col-form-label">댓글</label> <input
							type="text" class="form-control" id="reply-input2">
					</div>
					<div class="form-group">
						<label for="replyer_name-input2" class="col-form-label">
							작성자 </label> <input readonly type="text" class="form-control"
							id="replyer_name-input2"> <input readonly hidden
							type="text" id="replyer_id-input2">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" disabled="" class="btn btn-primary"
						id="reply-modify-button">수정</button>
					<button type="button" disabled="" class="btn btn-danger"
						id="reply-delete-button">삭제</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>