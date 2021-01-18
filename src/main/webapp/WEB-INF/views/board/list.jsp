<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
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

<script>
	$(document).ready(function() {
		var result = '${result}';
		var message = '${message}';
		
		//checkModal(result);
		checkModal2(message);
		
		history.replaceState({}, null, null);
		
		function checkModal2(message) {
			//자바스크립트에서 빈 스트링은 false로 인식
			if(message && history.state == null) {
				$("#myModal .modal-body p").html(message);
				$("#myModal").modal("show");
			}
		}
		
		function checkModal(result) {			
			if(result === '' || history.state) {
				return;
			}
			if(parseInt(result) > 0) {
				$("#myModal .modal-body p").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}			
	});
</script>

<title>중앙게시판</title>
</head>
<body>
<u:navbar></u:navbar>
<div class="container-sm">
  <div class="row">
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>#번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>작성일</th>
          <th>수정일</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${list}" var="board">
          <tr>
            <td>${board.bno}</td>
            <td><a href="${root }/board/get?bno=${board.bno}"><c:out value="${board.title}"></c:out></a></td>
            <td><c:out value="${board.writer}"></c:out></td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></td>
            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<div id="myModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가 완료되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>