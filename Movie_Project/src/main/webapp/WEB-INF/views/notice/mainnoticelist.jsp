<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ include file="../header.jsp" %>

		<div class="wrapper">
			<h3>공지사항</h3>
				<table border="1">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>공지일자</th>
					</tr>
						<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td>${notice.noticeId}</td>
						<td><a href="<c:url value='/mainnotice/${notice.noticeId}'/>">${notice.noticeTitle}</a></td>
						<td>${notice.noticeDate}</td>
					</tr>
				</c:forEach>
				</table>
		</div>
	<%@ include file="../footer.jsp" %>
