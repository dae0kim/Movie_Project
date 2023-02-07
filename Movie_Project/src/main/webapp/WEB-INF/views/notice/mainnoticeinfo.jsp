<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ include file="../header.jsp" %>
		<div class="wrapper">
			<h3>공지사항 상세 정보</h3>
				<table border="1">
					<tr>
						<th>번호</th>
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
						<th>공지일자</th>
						<td>${notice.noticeDate}</td>
					</tr>
				</table>
		</div>
	<%@ include file="../footer.jsp" %>