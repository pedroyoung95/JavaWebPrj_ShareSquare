<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	$("#btn-create").click(function() {
		$.ajax({
			type:"post",
			url:"/replies/new",
			contentType:"application/json",
			data:'{"bno":121, "reply":"새 댓글~", "replyer":"user01"}',
			complete:function(jqXHR, status) {
				console.log("complete");
				console.log(status);
			}
		});
	});
	
	$("#btn-create2").click(function() {
		$.ajax({
			type:"post",
			url:"/replies/new",
			contentType:"application/json",
			data:'{"reply":"새 댓글~", "replyer":"user01"}',
			complete:function(jqXHR, status) {
				console.log("complete");
				console.log(status); 
			}
		});
	});
	
	$("#btn-create3").click(function() {
		$.ajax("/replies/new", {
			//$.ajax의 첫 번째 파라미터로 URL을 받을 수 있음
			type:"post",
			/* url:"/replies/new", */
			contentType:"application/json",
			data:'{"bno":121, "reply":"새 댓글~", "replyer":"user01"}'
		}).done(function(data, status, jqXHR) {
			console.log("등록 성공");
			console.log(data); 
		}).fail(function() {
			console.log("등록 실패");
		});
	});
	
	$("#btn-getList").click(function() {
		$.ajax("/replies/pages/121/1", {
			method:"get"
		}).done(function(data, status, xhr) {
			console.log("목록 얻기 성공");
			console.log(data);
		}).fail(function(data, status, xhr) {
			console.log("목록 얻기 실패");
		});
	});
	
	$("#btn-modify").click(function() {
		$.ajax("/replies/34", {
			method:"put",
			data:'{"reply":"updated by controller"}',
			contentType:"application/json"			
		}).done(function(data) {
			console.log("수정 성공");
			console.log(data);
		}).fail(function(data) {
			console.log("수정 실패");
		});
	});
	
	$("#btn-remove").click(function() {
		$.ajax("/replies/68",{
			method:"delete"
		}).done(function(data, status, xhr) {
			console.log("삭제 성공");
			console.log(data);
		}).fail(function(data, status, xhr) {
			console.log("삭제 실패");
		});
	});
	
	$("#btn-get").click(function() {
		$.ajax("/replies/65", {
			type:"get"
		}).done(function(data) {
			console.log(data);
		}).fail(function(data) {
			console.log(data);
		}); 
	});
});
</script>
</head>
<body>
<h1>AJAX ex5</h1>
<div>
<button id="btn-create">댓글 등록 성공</button>
<button id="btn-create2">댓글 등록 실패</button>
<button id="btn-create3">댓글 등록 성공 또는 실패</button>
</div>
<div>
<button id="btn-getList">댓글 목록</button>
<button id="btn-modify">댓글 수정</button>
<button id="btn-remove">댓글 삭제</button>
</div>
<div>
<button id="btn-get">댓글 조회</button>
</div>
</body>
</html>