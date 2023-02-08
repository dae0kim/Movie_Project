<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Film Update</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminpage.css">
</head>
<body>
<a href="<c:url value='/adminfilm/${film.filmId}'/>">뒤로가기</a><br><br>
<h1>영화 정보 수정</h1>


<form action="./update" method="post" enctype="multipart/form-data">
<table border="1">
<tr>
	<th>영화 제목</th>
	<td>
	<input type="text" name="filmTitle"  value="${film.filmTitle}" required>
	<input type="hidden" name="filmId" value="${film.filmId}">
	</td>
</tr>
<tr>
	<th>개봉 날짜</th>
	<td><input type="date" name="releaseDate" value="${film.releaseDate}" required></td>
</tr>
<tr>
	<th>영화 포스터</th>
	<td><input type="file" name="file">
	<input type="hidden" name="dir" value="/images"></td>
</tr>
<tr>
	<th>상영 시간</th>
	<td><input type="number" name="runTime" min="1" max="999" value="${film.runTime}" required></td>
</tr>
<tr>
	<th>영화 장르</th>
	<td>
		<select name="genre">
			<option value="액션">액션
			<option value="코메디">코메디
			<option value="로맨스">로맨스
			<option value="드라마">드라마
			<option value="호러/스릴러">호러/스릴러
			<option value="SF/판타지">SF/판타지
			<option value="애니메이션">애니메이션
			<option value="다큐멘터리">다큐멘터리
		</select>
	</td>
</tr>
<tr>
	<th>감독</th>
	<td><input type="text" name="director" value="${film.director}" required></td>
</tr>
<tr>
	<th>주연 배우</th>
	<td><input type="text" name="mainActor" value="${film.mainActor}" required></td>
</tr>
<tr>
	<th>조연 배우</th>
	<td><input type="text" name="subActor" value="${film.subActor}" required></td>
</tr>
<tr>
	<th>영화 줄거리</th>
	<td>
		<textarea name="summary" rows="5" cols="33" required>${film.summary}</textarea>
	</td>
</tr>
<tr>
	<th>영화 관람 등급</th>
	<td>
		<select name="filmRate">
			<option value="전 연령 시청가능">전 연령 시청가능
			<option value="12세 이상 관람">12세 이상 관람
			<option value="15세 이상 관람">15세 이상 관람
			<option value="18세 이상 관람">18세 이상 관람
		</select>
	</td>
</tr>
<tr>
	<th>제작 국가</th>
	<td><input type="text" name="country" value="${film.country}" required></td>
</tr>
<tr>
	<th>&nbsp;</th>
	<td>
		<input type="submit" value="수정"> 
		<input type="reset" value="취소">
	</td>
</tr>
</table>
</form>

</body>
</html>