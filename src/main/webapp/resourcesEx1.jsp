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
</head>
<body>
<h1>resources ex1</h1>
<div>
<img alt="media-type" src="media-type.png">
</div>
<!--스프링의 jsp 안에 있는 css, js, 그림파일 등의 확장자명을 바로 찾을 수 없음
해당 jsp를 띄우면 해당 파일명의 컨트롤러를 찾기 때문
resources 폴더 안에 넣어둔 data들은 컨트롤러 거치지 않고 바로 접근하게 됨
resources라는 폴더 명을 다르게 해서 사용하려면 servlet-context.xml에 있는
resources태그에 있는 mapping값과 location값을 원하는 이름으로 바꿔줘야 함
-->
<div>
<img alt="media-type from resources" src="resources/media-type.png">
</div>
</body>
</html>