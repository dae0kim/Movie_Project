<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film</title>
</head>
<body>
<a href="<c:url value='/adminhome'/>">메인으로가기</a><br><br>
<h3>등록된 영화 목록</h3>
<div>
	<span>${message}</span>
</div>
<a href="<c:url value='/filmrequest/filminsertform'/>">영화 등록하기</a>
<table border="1">
<tr>
	<th>No.</th>
	<th>영화 포스터</th>
	<th>영화 제목</th>
	<th>감독</th>
	<th>개봉 날짜</th>
</tr>
<c:forEach var="filmList" items="${filmList}">
<tr>
	<td><a href="<c:url value='/adminfilm/${filmList.filmId}'/>">${filmList.filmId}</a></td>
	<td>
		<c:set var="len" value="${fn:length(filmList.fileName)}"/>
		<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmList.fileName, len-4, len))}"/>
		<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
			<c:url var="imageName" value="/file/${filmList.fileId}"/>
			<img src="${imageName}" width="100" class="img-thumbnail">
		</c:if>
	</td>
	<td>${filmList.filmTitle}</td>
	<td>${filmList.director}</td>
	<td>${filmList.releaseDate}</td>
</tr>
</c:forEach>
</table>
</body>
</html>