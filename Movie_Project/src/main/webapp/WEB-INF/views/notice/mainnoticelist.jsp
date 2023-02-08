<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ include file="../header.jsp" %>

		<div class="wrapper">
			<h3 class="notice_title">공지사항</h3>
				<table class="notice_table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>공지일자</th>
					</tr>
						<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td class="notice_number">${notice.noticeId}</td>
						<td><a class="notice_write_title" href="<c:url value='/mainnotice/${notice.noticeId}'/>">${notice.noticeTitle}</a></td>
						<td class="noticeDate">${notice.noticeDate}</td>
					</tr>
				</c:forEach>
				</table>
		</div>
	<%@ include file="../footer.jsp" %>
