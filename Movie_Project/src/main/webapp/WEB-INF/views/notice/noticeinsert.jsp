<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
<a href="<c:url value='/adminhome'/>">뒤로가기</a><br><br>
<h1>공지사항 입력</h1>
<form action="./insert" method="post">
<table border="1">
<tr>
	<th>제목</th>
	<td><input type="text" name="noticeTitle" required></td>
</tr>
<tr>
	<th>내용</th>
	<td><input type="text" name="noticeContent" required></td>
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
</body>
</html>