<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="wrapper">
	<div class="request_film_container">
		<h2 class="update_member_title">영화 요청 페이지</h2>
		<hr class="myunder_line">
	<div>
		<h3 class="request_film_title">영화 요청 정보 입력</h3>
		<div class="request_film_notice_div">
			<div class="request_film_notice">띄어쓰기, 특수기호를 주의하여 정확한 영화 이름을 입력해 주시면
			조금더 원활하게 서비스를 제공해드릴 수 있습니다.</div><br>
			<div class="example">[ex] 아바타: 물의 길 (O)
				 아바타:물의길(X)</div>
		</div>
	</div>
	<form action="<c:url value='/filmrequest/request'/>" method="post">
		<div class="request_film_input">
		<h3>요청 영화 제목</h3>
		
		<input type="text" name="requestTitle" required class="request_film_write">
		<input type="hidden" name="memberId" value="${loginUser.memberId}">
		</div>

		<div class="reqeust_film_btn_div">
			<input type="submit" value="저장" class="save_btn"> 
			<input type="reset" value="취소" class="cancle_btn_film">
		</div>
	</form>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>