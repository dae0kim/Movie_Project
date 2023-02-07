<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<body>
<h3>공지사항 삭제</h3>
공지사항 ${notice.noticeId}번 [${notice.noticeTitle}] 게시글을 삭제합니다.<p>
삭제후 데이터는 복구될 수 없습니다.<p>
<form action="./delete" method="post">
<input type="hidden" name="noticeId" value="${notice.noticeId}">
<button type="submit">삭제</button>
</form>
</body>
</html>