<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<u:navbar_list></u:navbar_list>

	<div class="container-sm">
		<div id="myDIV" class="header">
			<h2 style="margin: 5px">My To Do List</h2>
			<input type="text" id="myInput" placeholder="Title..."> <span
				onclick="newElement()" class="addBtn">Add</span>
		</div>

		<ul id="myUL">
			<li>Hit the gym</li>
			<li>Pay bills</li>
			<li>Meet George</li>
			<li>Buy eggs</li>
			<li>Read a book</li>
			<li>Organize office</li>
		</ul>
	</div>
</body>
</html>