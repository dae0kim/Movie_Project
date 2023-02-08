<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="header.jsp" %>
<div class="wrapper">	
			<div class="index_box" id="film_list_main_star">
				<h2 class="index_title_font">평점 높은순</h2>
	        <div id="slideShow">
		    	<ul id="slides_main_star" class="slides">
	            	<c:forEach var="filmListByStar" items="${filmListByStar}">
			        	<li class="image_list">
			            	<div>
			              		<div>
									<c:choose>
										<c:when test="${not empty  loginUser}"> 
											<a href="<c:url value='/film/${filmListByStar.filmId}/${loginUser.memberId}'/>">
										</c:when>
										<c:otherwise>
											<a href="<c:url value='/film/${filmListByStar.filmId}/0'/>">									
										</c:otherwise>
									</c:choose>
									<c:set var="len" value="${fn:length(filmListByStar.fileName)}"/>
									<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmListByStar.fileName, len-4, len))}"/>
									<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
										<c:url var="imageName" value="/file/${filmListByStar.fileId}"/>
										<img src="${imageName}" width="100" class="img-thumbnail">
									</c:if>
									</a>

			              		</div>  
			              		<div class="index_info_full">            	
			              		<div class="index_info">
					             	<span class="film_title">${filmListByStar.filmTitle}</span>
			              			</div>
								<div class="average_star">
					             	<span class="average_star_print">평균★
					             	<fmt:formatNumber value="${filmListByStar.starAverage}" pattern=".00" /></span>
								</div>
								</div>
			              	</div>
			        	</li>
	            	</c:forEach>
		    	</ul>
				  <p class="controller">
				  	<span id="prev_main_star" class="prev">&lang;</span>
	        		<span id="next_main_star" class="next">&rang;</span>
				  </p>
		        </div>
		        </div>
		        
		
	      <div class="many_review_box" id="film_list_main_review">
			<h2 class="index_title_font">리뷰 많은순</h2>
	        <div id="slideShow">
		    	<ul id="slides_main_review" class="slides">
	            	<c:forEach var="filmListByReview" items="${filmListByReview}">
			        	<li class="image_list">
			            	<div>
			              		<div>

									<c:choose>
										<c:when test="${not empty  loginUser}"> 
											<a href="<c:url value='/film/${filmListByReview.filmId}/${loginUser.memberId}'/>">
										</c:when>
										<c:otherwise>
											<a href="<c:url value='/film/${filmListByReview.filmId}/0'/>">										
										</c:otherwise>
									</c:choose>
									<c:set var="len" value="${fn:length(filmListByReview.fileName)}"/>
									<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmListByReview.fileName, len-4, len))}"/>
									<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
										<c:url var="imageName" value="/file/${filmListByReview.fileId}"/>
										<img src="${imageName}" width="100" class="img-thumbnail">
									</c:if>
									</a>

			              		</div> 
			              		<div class="index_info_full">                	
			              		<div class="index_info">
					             	<span class="film_title">${filmListByReview.filmTitle}</span>
			              		</div>	
			              		<div class="average_star">
					             	<span class="average_star_print">평균★
					             	 	<fmt:formatNumber value="${filmListByReview.starAverage}" pattern=".00" /></span>
			              		</div>	
			              		</div>
			              	</div>
			        	</li>
	            	</c:forEach>
		    	</ul>
 		    	<p class="controller">
				  	<span id="prev_main_review" class="prev">&lang;</span>
	        		<span id="next_main_review" class="next">&rang;</span>
				  </p>
		        </div>
		        </div>
		        
        
	    <c:choose>
    	<c:when test="${not empty loginUser}">
	        <div class="private_like_box" id="film_list_main_user_genre">
			<h2 class="index_title_font"><span class="my_nickname">${loginUser.nickname}</span>님의 선호 장르 영화</h2>
	        <div id="slideShow">
		    	<ul id="slides_main_genre" class="slides">
	            	<c:forEach var="filmListByGenre" items="${filmListByGenre}">
			        	<li class="image_list">
			            	<div>
			              		<div>
			              			<c:choose> 
										<c:when test="${loginUser.memberId == null }">
										<!-- 로그인 안된 상태 = 사용자 맞춤 장르 추천은 안보여야함 -->
										</c:when>
										<c:otherwise>
											<a href="<c:url value='/film/${filmListByGenre.filmId}/${loginUser.memberId }'/>">
											<c:set var="len" value="${fn:length(filmListByGenre.fileName)}"/>
											<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmListByGenre.fileName, len-4, len))}"/>
											<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
												<c:url var="imageName" value="/file/${filmListByGenre.fileId}"/>
												<img src="${imageName}" width="100" class="img-thumbnail">
											</c:if>
											</a>
										</c:otherwise>
									</c:choose>
			              		</div>     
			              		<div class="index_info_full">          	
			              		<div class="index_info">
					             	<span class="film_title">${filmListByGenre.filmTitle}</span>
			              		</div>	
			              		<div class="average_star">
					             	<span class="average_star_print">평균★
					             	<fmt:formatNumber value="${filmListByGenre.starAverage}" pattern=".00" /></span>
			              		</div>	
			              		</div>
			              	</div>
			        	</li>
	            	</c:forEach>
		    	</ul>
				  <p class="controller">
				  	<span id="prev_main_genre" class="prev">&lang;</span>
	        		<span id="next_main_genre" class="next">&rang;</span>
				  </p>
		        </div>
		        </div>            
	</c:when>
	</c:choose>
</div>
<%@include file="footer.jsp" %>


