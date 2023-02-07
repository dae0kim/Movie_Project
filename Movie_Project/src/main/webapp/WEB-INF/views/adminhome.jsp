<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>AdminHome</title>
</head>
<body>
<a href="<c:url value='/index' />">
   <img src="<c:url value='/resources/images/logo.png' />" viewBox="0 0 151 29" class="logo_img">
</a>
<h1>
	관리자 페이지  
</h1>
<span>${message}</span>
<P>  관리할 항목에 해당하는 메뉴를 선택하세요. </P>
<br><br>
<a href="<c:url value='/adminfilm/filmlist'/>">영화 관리</a><br><br>
<a href="<c:url value='/adminreview/reviewlist'/>">리뷰 관리</a><br><br>
<a href="<c:url value='/notice/noticelist'/>">공지사항 관리</a><br><br>
<a href="<c:url value='/filmrequest/filmrequestlist'/>">요청 영화 목록</a><br><br>
<a href="<c:url value='/member/list'/>">회원 정보 조회</a><br><br>
</body>
</html>
