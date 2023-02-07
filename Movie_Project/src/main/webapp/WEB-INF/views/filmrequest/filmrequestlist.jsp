<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FilmRequest</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css">
</head>
<body>
<a href="<c:url value='/adminhome'/>">메인으로가기</a><br><br>
<a href="<c:url value='/filmrequest/filminsertform'/>">영화 등록하기</a>
<h3>요청 영화 목록 조회</h3>
<table border="1">
<tr>
	<th>No.</th>
	<th>요청 영화 제목</th>
	<th>요청 등록일</th>
	<th>요청 처리 상태</th>
	<th>요청한 사용자</th>
</tr>
<c:forEach var="filmRequestList" items="${filmRequestList}">
	<c:choose>
		<c:when test="${filmRequestList.requestStatus=='y'}">
		<tr class="background_grey_change">
		</c:when>
		<c:otherwise>
		<tr>
		</c:otherwise>
	</c:choose>
		<td><a href="<c:url value='/filmrequest/${filmRequestList.filmRequestId}'/>">${filmRequestList.filmRequestId}</a></td>
			<td>${filmRequestList.requestTitle}</td>
			<td>${filmRequestList.requestDate}</td>
			<td>${filmRequestList.requestStatus}</td>
			<td>${filmRequestList.memberId}</td>
		</tr>
</c:forEach>
</table>
</body>
</html>