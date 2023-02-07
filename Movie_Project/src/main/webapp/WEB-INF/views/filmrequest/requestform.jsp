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
	영화 요청 페이지
<div style="text-align:center;">
	<h1>영화 요청 정보 입력</h1>
	<p style="color:red;">
		띄어쓰기, 특수기호를 주의하여 정확한 영화 이름을 입력해 주시면<br>
		조금더 원활하게 서비스를 제공해드릴 수 있습니다.<br>
		[ex] 아바타: 물의 길 (O)<br>
			 아바타:물의길(X)<br>
	</p>
</div>
<form action="<c:url value='/filmrequest/request'/>" method="post">
<table border="1">
<tr>
	<th>요청 영화 제목</th>
	<td><input type="text" name="requestTitle" required></td>
	<td><input type="hidden" name="memberId" value="${loginUser.memberId}"></td>
</tr>
<tr>
	<th>&nbsp;</th>
	<td>
		<input type="submit" value="저장"> 
		<input type="reset" value="취소">
	</td>
</tr>
</table>
</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>