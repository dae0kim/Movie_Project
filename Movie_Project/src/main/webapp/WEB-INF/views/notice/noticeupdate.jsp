<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
<h3>공지사항 수정</h3>
<form action="./update" method="post">
<table border="1">
<tr>
	<th>번호</th>
	<td><input type="text" name="noticeId" value="${notice.noticeId}" readonly></td>
</tr>
<tr>
	<th>제목</th>
	<td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"required></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea row="15" cols="65" name="noticeContent" required style="width:400px; height:400px;">${notice.noticeContent}</textarea></td>
</tr>
<tr>
	<th>등록일</th>
	<td><input type="text" name="noticeDate" value="${notice.noticeDate}" readonly></td>
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