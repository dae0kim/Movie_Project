<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Info</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css">
</head>
<body>
<a href="<c:url value='/adminfilm/filmlist'/>">뒤로가기</a><br><br>
<h3>영화 상세 정보</h3>
${message} <!-- 리다이렉트 메시지 출력 -->
<table border="1">
<tr>
	<th>No.</th>
	<td>${film.filmId}</td>
</tr>
<tr>
	<th>영화 제목</th>
	<td>${film.filmTitle}</td>
</tr>
<tr>
	<th>개봉 날짜</th>
	<td>${film.releaseDate}</td>
</tr>
<tr>
	<th>영화 포스터</th>
	<td>
		<c:set var="len" value="${fn:length(film.fileName)}"/>
		<c:set var="filetype" value="${fn:toUpperCase(fn:substring(film.fileName, len-4, len))}"/>
		<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
			<c:url var="imageName" value="/file/${film.fileId}"/>
			<img src="${imageName}" width="100" class="img-thumbnail">
		</c:if>
	</td>
</tr>
<tr>
	<th>상영 시간</th>
	<td>${film.runTime}</td>
</tr>
<tr>
	<th>영화 장르</th>
	<td>${film.genre}</td>
</tr>
<tr>
	<th>감독</th>
	<td>${film.director}</td>
</tr>
<tr>
	<th>주연 배우</th>
	<td>${film.mainActor}</td>
</tr>
<tr>
	<th>조연 배우</th>
	<td>${film.subActor}</td>
</tr>
<tr>
	<th>영화 줄거리</th>
	<td>${film.summary}</td>
</tr>
<tr>
	<th>영화 관람 등급</th>
	<td>${film.filmRate}</td>
</tr>
<tr>
	<th>제작 국가</th>
	<td>${film.country}</td>
</tr>
</table>
<a href="update?filmId=${film.filmId}"><button type="submit">수정</button></a>
<a href="delete?filmId=${film.filmId}"><button type="submit">삭제</button></a>
</body>
</html>