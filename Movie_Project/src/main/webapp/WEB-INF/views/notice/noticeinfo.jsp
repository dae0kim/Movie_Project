<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
<a href="<c:url value='/notice/noticelist'/>">뒤로가기</a><br><br>
<h3>공지사항 상세 정보</h3>
${message} <!-- 리다이렉트 메시지 출력 -->
<table border="1">
<tr>
	<th>NO.</th>
	<td>${notice.noticeId}</td>
</tr>
<tr>
	<th>제목</th>
	<td>${notice.noticeTitle}</td>
</tr>
<tr>
	<th>내용</th>
	<td>${notice.noticeContent}</td>
</tr>
<tr>
	<th>등록일</th>
	<td>${notice.noticeDate}</td>
</tr>
</table>
<a href="update?noticeId=${notice.noticeId}"><button type="submit">수정</button></a>
<a href="delete?noticeId=${notice.noticeId}"><button type="submit">삭제</button></a>
</body>
</html>