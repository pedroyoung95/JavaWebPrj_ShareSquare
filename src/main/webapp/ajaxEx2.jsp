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
			//complete의 타입은 function이므로, : 오른쪽에 함수가 와야 함
			//요청이 완료된 후에(success나 error가 뜬 후에)
			complete:function(jqXHR, status) {
				console.log("complete");
				console.log(status); //컨트롤러에 있는 status메시지가 아님
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
		$.ajax({
			type:"post",
			url:"/replies/new",
			contentType:"application/json",
			data:'{"bno":121, "reply":"새 댓글~", "replyer":"user01"}',
			complete:function(jqXHR, status) {
				if(status == "success") {
					console.log("등록 성공");
					console.log(jqXHR.responseText); 
					//responseText : 컨트롤러에 있는 status메시지를 받음
				} else if(status == "error") {
					console.log("등록 실패")
				}
			}
		});
	});
	
	$("#btn-getList").click(function() {
		$.ajax({
			method:"get",
			url:"/replies/pages/121/1",
			complete:function(jqXHR, status) {
				if(status == "success") {
					console.log("목록 얻기 성공");
					console.log(jqXHR.responseText);
				} else if(status == "error") {
					console.log("목록 얻기 실패");
				}
			}
		});
	});
});
</script>
</head>
<body>
<h1>AJAX ex2</h1>
<div>
<button id="btn-create">댓글 등록 성공</button>
<button id="btn-create2">댓글 등록 실패</button>
<button id="btn-create3">댓글 등록 성공 또는 실패</button>
</div>
<div>
<button id="btn-getList">댓글 목록</button>
</div>
</body>
</html>