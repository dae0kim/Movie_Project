<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
</head>
<body>
<a href="<c:url value='/adminreview/reviewlist'/>">뒤로가기</a><br><br>
<h3>리뷰 상세 정보</h3>
${message} <!-- 리다이렉트 메시지 출력 -->
<table border="1">
<tr>
	<th>No.</th>
	<td>${review.reviewId}</td>
</tr>
<tr>
	<th>사용자 번호</th>
	<td>${review.memberId}</td>
</tr>
<tr>
	<th>영화 번호</th>
	<td>${review.filmId}</td>
</tr>
<tr>
	<th>리뷰 내용</th>
	<td>${review.reviewContent}</td>
</tr>
<tr>
	<th>별점</th>
	<td>${review.starScore}</td>
</tr>
<tr>
	<th>좋아요수</th>
	<td>${review.likeCount}</td>
</tr>
<tr>
	<th>등록일</th>
	<td>${review.reviewDate}</td>
</tr>
</table><br>
<a href="blind?reviewId=${review.reviewId}"><input type="button" value="숨김"></a>
</body>
</html>