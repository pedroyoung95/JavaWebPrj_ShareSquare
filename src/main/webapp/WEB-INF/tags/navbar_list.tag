<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<div class="container-sm mb-3">
	<nav class="navbar sticky-top navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
		<a class="navbar-brand" href="${root }/member/main"><i class="fa fa-home fa-3x"></i></a>
	  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    	<span class="navbar-toggler-icon"></span>
	  	</button>
  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
    		<ul class="navbar-nav mr-auto"> 
      			<li class="nav-item">
		      		<c:url var="listLink" value="/board/list">      		
				      	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
				      	<c:param name="amount" value="${cri.amount }"></c:param>      
				      	<c:param name="type" value="${cri.type }"></c:param>
				      	<c:param name="keyword" value="${cri.keyword }"></c:param>		
		      		</c:url>
	        		<a class="nav-link" href="${listLink }">
						<i class="fa fa-compass fa-3x"></i>
						<span class="sr-only">(current)</span>
					</a>
      			</li>		      	
		      	<u:isLogin>		      		
		      		<li class="nav-item">
		    			<c:url var="registerLink" value="/board/register">      		
					    	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
					    	<c:param name="amount" value="${cri.amount }"></c:param>      		
				      	</c:url>
			        	<a class="nav-link" href="${registerLink }">
			        		<i class="fa fa-pencil fa-3x"></i>
			        	</a>
		      		</li>
		      		<li class="nav-item">
		        		<a class="nav-link" href="${root }/member/info">
		        			<i class="fa fa-info-circle fa-3x"></i>
		        		</a>
		      		</li>			      	
			      	<li class="nav-item">
			      		<a class="nav-link" href="${root }/member/signout">
			      			<i class="fa fa-sign-out fa-3x"></i>
			      		</a>
			      	</li>
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
    		<form action="${root }/board/list" id="searchForm" class="form-inline my-2 my-lg-0">
				<select name="type" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
				    <option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : '' }>제목</option>
				    <option value="C" ${pageMaker.cri.type == 'C' ? 'selected' : '' }>내용</option>
				    <option value="W" ${pageMaker.cri.type == 'W' ? 'selected' : '' }>작성자</option>
				    <option value="TC" ${pageMaker.cri.type == 'TC' ? 'selected' : '' }>제목 or 내용</option>
				    <option value="TW" ${pageMaker.cri.type == 'TW' ? 'selected' : '' }>제목 or 작성자</option>
				    <option value="TCW" ${pageMaker.cri.type == 'TCW' ? 'selected' : '' }>제목 or 내용 or 작성자</option>
				</select>
		    	<input name="keyword" required value="${pageMaker.cri.keyword }" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
		    	<input type="hidden" name="pageNum" value="1">
		    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		    	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    	</form>
  		</div>
	</nav>
</div>