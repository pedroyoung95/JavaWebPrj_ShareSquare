<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<div class="container-sm mb-3">
	<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
		<a class="navbar-brand" href="${root }/member/main">Home</a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    		<ul class="navbar-nav mr-auto">
    			<li class="nav-item">
		        	<a class="nav-link" href="${registerLink }">To-Do List 만들기</a>
		      	</li>
    			<li class="nav-item">
	        		<a class="nav-link" href="${root }/board/list">공유게시판</a>
      			</li>
		      	<c:url var="registerLink" value="/board/register">      		
			    	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
			    	<c:param name="amount" value="${cri.amount }"></c:param>      		
		      	</c:url>
		      	<u:isLogin>
			      	<li class="nav-item">
			      		<a class="nav-link" href="${root }/member/logout">로그아웃</a>
			      	</li>
		      	</u:isLogin>
		      	<u:notLogin>
		      		<li class="nav-item">
		      			<a class="nav-link" href="${root }/member/login">로그인</a>
		      		</li>
		      	</u:notLogin>
    		</ul>
  		</div>
	</nav>
</div>