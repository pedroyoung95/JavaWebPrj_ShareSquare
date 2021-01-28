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
			type:"post",
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
		$.get("/replies/65", {
			/* type:"get" -> $.get으로 작성하면 type값이 자동으로 get으로 설정됨*/
		}).done(function(data) {
			console.log(data);
		}).fail(function(data) {
			console.log(data);
		}); 
	});	
	$("#btn-get2").click(function() {
		//$.get메소드의 파라미터 중 success는 .done()과 동일한 것
		$.get("/replies/45", function(data) {
			console.log(data);
		});
	});	
	$("#btn-get3").click(function() {
		$.get("/replies/40", function(data) {
			console.log(data);
			console.log(data.rno);
			console.log(data.bno);
			console.log(data.reply);
			console.log(data.replyer);}, 
			"json");
		//응답 데이터의 미디어 타입을 따로 지정할 수 있음(json, text, xml, html등으로)
		//응답 데이터에 따라 ajax가 알아서 미디어 타입을 맞춰줌
	});
	
	$("#btn-get4").click(function() {
		$.get("/replies/40", function(data) {
			console.log(data);
			console.log(data.rno);
			console.log(data.bno);
			console.log(data.reply);
			console.log(data.replyer);}, 
			//text로 클라이언트에게 넘어가므로 콘솔 값이 undefined
			"text");
	});	
	$("#btn-get5").click(function() {
		$.getJSON("/replies/40", function(data) {
			console.log(data);
			console.log(data.rno);
			console.log(data.bno);
			console.log(data.reply);
			console.log(data.replyer);});
		//$.getJSON() : 응답 미디어타입을 JSON으로 설정함
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
<button id="btn-get2">댓글 조회2</button>
<button id="btn-get3">댓글 조회3</button>
<button id="btn-get4">댓글 조회4</button>
<button id="btn-get5">댓글 조회5</button>
</div>
</body>
</html>