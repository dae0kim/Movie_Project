<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
<a href="<c:url value='/adminhome'/>">메인으로가기</a><br><br>
<h3>공지사항</h3>
<a href="<c:url value='/notice/insert'/>"><input type="button" value="글쓰기"></a>
<table border="1">
<tr>
	<th>No.</th>
	<th>제목</th>
	<th>등록일</th>
</tr>
<c:forEach var="notice" items="${noticeList}">
<tr>
	<td><a href="<c:url value='/notice/${notice.noticeId}'/>">${notice.noticeId}</a></td>
	<td>${notice.noticeTitle}</td>
	<td>${notice.noticeDate}</td>
</tr>
</c:forEach>
</table>
</body>
</html>