<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		var wrongPassword = '${wrongPassword}';
		var wrongId = '${wrongId}';
		
		signinModal(signinSuccess);
		
		history.replaceState({}, null, null);
		
		function signinModal(wrongPassword, wrongId) {
			if(wrongPassword && history.state == null) {
				$("#myModal .modal-body p").html(wrongPassword);
				$("#myModal").modal("show");
			}
			
			if(signinFail && history.state == null) {
				$("#myModal .modal-body p").html(wrongId);
				$("#myModal").modal("show");
			}
		}
	});
</script>

<title>Share Square Login</title>
</head>
<body>
	<u:navbar_main></u:navbar_main>

	<div class="container-sm">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<h1>로그인</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<form method="post">
					<div class="form-group">
						<label for="input-id">아이디</label> 
						<input name="id" type="text" class="form-control" id="input-id" 
							placeholder="아이디를 입력하세요.">
						<small id="signinFail" class="form-text text-muted">${wrongId }</small>						
					</div>
					<div class="form-group">
						<label for="input-pw">암호</label> 
						<input name="password" type="password" class="form-control" id="input-pw"
							placeholder="암호를 입력하세요."> 	
						<small id="signinFail" class="form-text text-muted">${wrongPassword }</small>						
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
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