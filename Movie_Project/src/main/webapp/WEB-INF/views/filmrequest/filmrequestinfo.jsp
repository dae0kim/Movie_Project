<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Request Info</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css">
</head>
<body>
<a href="<c:url value='/filmrequest/filmrequestlist'/>">뒤로가기</a><br><br>
<h3>영화 요청 상세 정보</h3>
${message} <!-- 리다이렉트 메시지 출력 -->
<table border="1">
<tr>
	<th>No.</th>
	<td>${filmRequest.filmRequestId}</td>
</tr>
<tr>
	<th>요청 영화 제목</th>
	<td>${filmRequest.requestTitle}</td>
</tr>
<tr>
	<th>요청 등록일</th>
	<td>${filmRequest.requestDate}</td>
</tr>
<tr>
	<th>요청 처리 상태</th>
	<td>${filmRequest.requestStatus}</td>
</tr>
<tr>
	<th>요청한 사용자</th>
	<td>${filmRequest.memberId}</td>
</tr>
</table>
<a href="<c:url value='/filmrequest/requestcheck/${filmRequest.filmRequestId}'/>">처리완료</a>
</body>
</html>