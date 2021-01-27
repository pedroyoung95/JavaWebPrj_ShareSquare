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
<script>
//(jQuery가 $로 표시됨)
//자바스크립트에서 jQuery.ajax()의 파라미터 값을 이용해서 
//요청 방식, 요청 URL, 요청 data, Content-Type을 지정함으로써
//하나의 페이지에서 댓글 관련 작업이 수행되도록 함
$(document).ready(function() {
	$("#btn-1").click(function() {
		$.ajax({
			method: "POST",
			url: "/replies/new",
			data: '{"bno":121,"reply":"a new reply","replyer":"user00"}',
			contentType: "application/json",
			complete:function(jqXHR, status) {
				if(status == "success") {
					console.log("등록 성공");
					console.log(jqXHR.responseText);
				} else if(status == "error") {
					console.log("등록 실패");
				}
			}
		});
	});
	
	$("#btn-2").click(function() {
		$.ajax({
			method:"GET",
			url:"/replies/pages/116/1",
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
	
	$("#btn-3").click(function() {
		$.ajax({
			method:"PUT",
			url:"/replies/33",
			data:'{"reply":"updated by controller"}',
			contentType:"application/json",
			complete:function(jqXHR, status) {
				if(status == "success") {
					console.log("수정 성공");
					console.log(jqXHR.responseText);
				} else if(status == "error") {
					console.log("수정 실패")
				}
			}
		});
	});
	
	$("#btn-4").click(function() {
		$.ajax({
			method:"DELETE",
			url:"/replies/4",
			complete:function(jqXHR, status) {
				if(status == "success") {
					console.log(jqXHR.responseText);
				} else if(status == "error") {
					console.log("삭제 실패");
				}				
			}
		});
	});
	
	$("#btn-5").click(function() {
		$.ajax({
			type:"GET", //method 대신 type이라고 작성해도 됨
			url:"/replies/33",
			complete:function(jqXHR, status) {
				if(status == "success") {
					console.log("댓글 얻기 성공");
					console.log(jqXHR.responseText);
				} else if(status == "error") {
					console.log("댓글 얻기 실패");
				}
			}
		});
	});
});
</script>
</head>
<body>
<h1>AJAX ex1</h1>
<pre>
AJAX=Asynchoronous JavaScript And XML(비동기화된 자바스크립트와 XML)
동기화된 웹 앱 
-클라이언트와 서버가 딱 맞춰서 작업 수행 
-클라이언트가 요청을 보내고 응답을 받기 전 까지 다른 작업 수행 가능X

비동기화된 웹 앱 
-클라이언트와 서버 간 작업 수행이 비동기적 
-클라이언트가 요청을 보내고 응답을 받기 전 까지 다른 작업 수행 가능O
</pre>
<div>
<button id="btn-1">새 댓글</button>
</div>
<div>
<button id="btn-2">댓글 목록</button>
</div>
<div>
<button id="btn-3">댓글 수정</button>
</div>
<div>
<button id="btn-4">댓글 삭제</button>
</div>
<div>
<button id="btn-5">댓글 조회</button>
</div>
</body>
</html>