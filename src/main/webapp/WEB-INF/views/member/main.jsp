<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/mainPage.css"/>"
	rel="stylesheet">
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
		<div class="container">
			<u:isLogin>
				<div class="jumbotron">
					<h1 class="display-4">${authUser.name }님,안녕하세요</h1>
					<p class="lead">목표 달성에 따른 성취감을 느껴보세요</p>
					<hr class="my-4">
					<a class="btn btn-primary btn-lg" href="${root}/board/list" role="button">공유 게시판</a>
				</div>
				<br />
			</u:isLogin>

			<u:notLogin>
				<div class="jumbotron">
					<h1 class="display-4">어서오세요</h1>
					<p class="lead">해야 할 것이 있다면, 지금 바로 하나씩 이뤄보세요</p>
					<hr class="my-4">
					<p>부지런함의 첫발을 내딛으세요</p>
					<a class="btn btn-primary btn-lg" href="${root }/member/login"
						role="button">로그인</a>
					<a class="btn btn-primary btn-lg" href="${root }/member/signin"
						role="button">회원가입</a>
				</div>
			</u:notLogin>
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