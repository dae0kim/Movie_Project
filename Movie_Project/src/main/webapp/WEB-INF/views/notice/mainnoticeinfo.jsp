<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
	<%@ include file="../header.jsp" %>
		<div class="wrapper">
			<h3 class="notice_title">공지사항 상세 정보</h3>
				<table class="notice_table">
					<tr>
						<th>번호</th>
						<td class="notice_number_info">${notice.noticeId}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td class="notice_write_title">${notice.noticeTitle}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="notice_write_info">${notice.noticeContent}</td>
					</tr>
					<tr>
						<th>공지일자</th>
						<td class="noticeDate_info">${notice.noticeDate}</td>
					</tr>
				</table>
		</div>
	<%@ include file="../footer.jsp" %>