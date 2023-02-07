<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
</head>
<body>
<a href="<c:url value='/adminhome'/>">메인으로가기</a><br><br>
<h3>리뷰 관리</h3>
<table border="1">
<tr>
	<th>No.</th>
	<th>영화 번호</th>
	<th>리뷰 내용</th>
	<th>작성 날짜</th>
	<th>등록 여부</th>
</tr>
<c:forEach var="review" items="${reviewList}">
<tr>
	<td><a href="<c:url value='/adminreview/${review.reviewId}'/>">${review.reviewId}</a></td>
	<td>${review.filmId}</td>
	<td>${review.reviewContent}</td>
	<td>${review.reviewDate}</td>
	<td>${review.reviewStatus}</td>
</tr>
</c:forEach>
</table>
</body>
</html>