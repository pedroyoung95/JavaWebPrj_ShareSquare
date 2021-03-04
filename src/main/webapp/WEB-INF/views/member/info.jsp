<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/design.css"/>"
	rel="stylesheet">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	$(document).ready(function() {
		$("#changeNameBtn").click(function() {
			$("#input-name").removeAttr("readonly");
			$("#input-email").removeAttr("readonly");
			$(this).hide();
			$("#nameSubmit").removeAttr("hidden");
		});
		
		var result = '${result}';
		var message = '${message}';
		
		checkModal(result, message);
		
		history.replaceState({}, null, null);
		
		function checkModal(result, message) {
			if(result && history.state == null) {
				$("#myModal .modal-title").html(result);
				$("#myModal .modal-body p").html(message);
				$("#myModal").modal("show");
			}
		}
	});
</script>

<title>Share Square</title>
</head>
<body>

	<u:navbar_main></u:navbar_main>
	
	<div class="container-sm">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<h1>회원 정보</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<form method="post">
					<div class="form-group">
						<label for="input-id">아이디</label> 
						<input name="id" type="text" class="form-control" id="input-id" 
							value="${member.id }" readonly>											
					</div>
					<div class="form-group">
						<label for="input-name">이름</label> 
						<input name="name" type="text" class="form-control" id="input-name"
							value="${member.name }" readonly> 	
					</div>
					<div class="form-group">
						<label for="input-email">Email</label> 
						<input name="email" type="email" class="form-control" id="input-email"
							value="${member.email }" readonly> 	
					</div>
					<div class="form-group">
						<label for="signDate">가입일</label> 
						<fmt:formatDate pattern="yyyy-MM-dd" value="${authUser.signDate }" var="signDate"/>
						<input name="signDate" type="text" class="form-control" id="signDate"
							value="${pageScope.signDate }" readonly>						
					</div>
					<div class="form-group">
						<label for="boardCnt">게시글 수</label> 
						<input name="boardCnt" type="text" class="form-control" id="boardCnt"
							value="${member.boardCnt }" readonly> 	
					</div>
					<div class="form-group">
						<label for="replyCnt">댓글 수</label> 
						<input name="replyCnt" type="text" class="form-control" id="replyCnt"
							value="${member.replyCnt }" readonly> 	
					</div>
					<button id="changeNameBtn" type="button" class="btn btn-primary">이름 변경</button>
					<button hidden id="nameSubmit" type="submit" class="btn btn-primary">변경 완료</button>
					<a href="${root }/member/changePw" class="btn btn-info">암호 변경</a>
				</form>
			</div>
		</div>
	</div>
	
	<div id="myModal" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">알림</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>처리가 완료되었습니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>