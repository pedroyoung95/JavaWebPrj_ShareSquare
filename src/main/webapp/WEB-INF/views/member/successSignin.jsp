<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/signinPage.css"/>"
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

<title>To-Do Share sign in</title>
</head>
<body>
	<u:navbar_main></u:navbar_main>

	<div class="container-sm">
		<div class="container"
			style="background-color: #ffffff;">
			<u:notLogin>
				<div class="jumbotron">
					<h1 class="display-4">가입이 완료되었습니다</h1>
					<p class="lead">환영합니다</p>
					<hr class="my-4">
					<p>바로 시작하세요</p>
					<a class="btn btn-primary btn-lg" href="${root }/member/login"
						role="button">로그인</a>
				</div>
			</u:notLogin>
		</div>
	</div>
	
</body>
</html>