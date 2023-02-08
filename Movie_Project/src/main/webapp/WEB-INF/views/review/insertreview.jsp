<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>

	<div class="wrapper">
		<form name="form" method="post" action="${pageContext.request.contextPath}/insertreview/${filmInfo.filmId}">
		<div class="film_info_container">
				<div id="poster">
					<c:set var="len" value="${fn:length(filmInfo.fileName)}"/>
						<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmInfo.fileName, len-4, len))}"/>
						<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
							<c:url var="imageName" value="/file/${filmInfo.fileId}"/>
							<img src="${imageName}" width="100" class="img-thumbnail">
				</c:if>
				</div>

				<div id="film_info">
					<div id="title_name" class="film_title_name">${filmInfo.filmTitle}</div>
					<span class="filminfo_DGC"> ${filmInfo.releaseDate} • ${filmInfo.genre} •
					${filmInfo.country}<br>
					감독 : ${filmInfo.director} <br>
                	주연 : ${filmInfo.mainActor} | 조연 : ${filmInfo.subActor}</span>
				</div>

				<div id="star_avg">
<!-- 					<div id="title_name">평균별점</div> -->
					<span class="aver_star">평균 ★
					<fmt:formatNumber value="${filmInfo.starAverage}" pattern=".00" />
					</span>
				</div>

				<div id="review_count" onload="reloadreviewcount();" class="review_count">
<!-- 					<div id="title_name">리뷰 수</div> -->
					<span class="review_print"> ${filmInfo.reviewCount} 개의 리뷰 </span>
				</div>

				<div id="summary">
					<div id="title_name" class="summary_title">줄거리</div>
					<span class="summary_full"> ${filmInfo.summary} 

					</span>
				</div>
			</div>


			<div id="reviewContent" class="starScore" >
				<h4 class="h4_margin" >리뷰를 작성 해주세요</h4>
				<br>
				<textarea rows="15" cols="65" name="reviewContent" required style="width: 994px; height: 166px;"></textarea>
			</div>

			<div id="starScore" class="starScore">
				<h4 class="h4_margin">별점을 선택 해주세요</h4>
				<br>
				<div class="star_dropbox">
				<input type='checkbox'
				       name='starScore' 
				       value= 1
				       onclick='checkOnlyOne(this)'/> ★☆☆☆☆
				<br><br>
				<input type='checkbox'
				       name='starScore' 
				       value= 2
				       onclick='checkOnlyOne(this)'/> ★★☆☆☆
				<br><br>
				<input type='checkbox'
				       name='starScore' 
				       value= 3
				       onclick='checkOnlyOne(this)' checked/> ★★★☆☆
				<br><br>
				<input type='checkbox'
				       name='starScore' 
				       value= 4
				       onclick='checkOnlyOne(this)'/> ★★★★☆
				<br><br>
				<input type='checkbox'
				       name='starScore' 
				       value= 5
				       onclick='checkOnlyOne(this)'/> ★★★★★	
				</div>	
			</div>

			<div class="starScore" id="insertbtnbox">
				<button class="w-btn w-btn-indigo" type="submit">입력하기</button>

				<a href="<c:url value='/film/${filmInfo.filmId}'/>">
				<button	class="w-btn w-btn-indigo">취소하기</button></a>
			</div>
			
			


			<input type="hidden" name="memberId" value="${loginUser.memberId}">
			<input type="hidden" name="filmId" value="${filmInfo.filmId}">
			
			
			</form>
		</div>
<%@include file="../footer.jsp"%>

