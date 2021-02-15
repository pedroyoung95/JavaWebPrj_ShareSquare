<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
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

<title>Share Square</title>
</head>
<body>

	<u:navbar_main></u:navbar_main>
	
	<div class="container-sm">
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<h1>암호 변경</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-lg-6 offset-lg-3">
				<form method="post">
					<div class="form-group">
						<label for="input-id">아이디</label> 
						<input name="id" type="text" class="form-control" id="input-id" 
							placeholder="아이디를 입력하세요.">
						<small id="changeFail" class="form-text text-muted">${changeFail }</small>						
					</div>
					<div class="form-group">
						<label for="input-pw">새 암호</label> 
						<input name="password" type="password" class="form-control" id="input-pw"
							placeholder="암호를 입력하세요."> 										
					</div>					
					<button id="changePwBtn" type="submit" class="btn btn-primary">암호 변경</button>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>