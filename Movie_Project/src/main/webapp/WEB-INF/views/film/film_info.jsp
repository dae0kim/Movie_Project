<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../header.jsp"%>

	<div class="wrapper">
		<div class ="film_info_full_container">
			<!-- 리뷰 정보 컨테이너 시작 -->
			<div class="film_info_container">
				<div id="poster">
					<c:set var="len" value="${fn:length(filmInfo.fileName)}"/>
						<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmInfo.fileName, len-4, len))}"/>
						<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
							<c:url var="imageName" value="/file/${filmInfo.fileId}"/>
							<img src="${imageName}" width="100" class="img-thumbnail">
						</c:if>
				</div>

				<div id="film_info" >
					<div id="title_name" class="film_title_name">${filmInfo.filmTitle}</div>
					<span class="filminfo_DGC"> ${filmInfo.releaseDate} • ${filmInfo.genre} •
					${filmInfo.country}<br>
					 감독 : ${filmInfo.director} <br>
                	주연 : ${filmInfo.mainActor} | 조연 : ${filmInfo.subActor}</span>
                	
				</div>

				<div id="star_avg">
<!-- 					<div id="title_name" class="avestar_title_name">평균별점</div> -->
					<span class="aver_star">평균 ★
					<fmt:formatNumber value="${filmInfo.starAverage}" pattern=".00" />
					</span>
				</div>

				<div id="review_count" onload="reloadreviewcount();" class="review_count">
<!-- 					<div id="title_name" class="review_count_title">리뷰 수</div> -->
					<span class="review_print"> ${filmInfo.reviewCount} 개의 리뷰 </span>
				</div>

				<div id="summary">
					<div id="title_name" class="summary_title">줄거리</div>
					<span class="summary_full"> ${filmInfo.summary} 
					<!-- 김미리 작성 : 위시리스트 -->
						<form name="insertwish" class ="insertwish" onsubmit="return false;">
						<div class="wishlist_div" id="wishlist_div">
							<button type="submit" class="wishlist_btn" name="wishlist_btn" >보관함에 담기 </button> 
						</div>
						</form>
					<!-- 위시리스트 끝-->

					</span>
				</div>
			</div>

			

			<!-- 리뷰 입출력(로그인 상태, 리뷰 입력상태에 따라) -->
			<div class="review_container" id="insertreview">
				<c:choose>
					<c:when test="${loginUser.memberId == null }">
						<h2 class="request_title">이 작품에 대해 의견을 남기려면 로그인을 해주세요.</h2>	
						<div class="write_review_box"><a href="#login_modal" rel="modal:open" class="input_review">로그인하기</a></div>				
					</c:when>
					<c:when test="${rev.reviewContent == null}">
						<h2 class="request_title">이 작품에 대해 의견을 남겨주세요. </h2>
						<div class="write_review_box">
						<a href="<c:url value='/insertreview/${filmId}'/>" class="input_review"> 리뷰 남기기</a>
						</div>
					</c:when>
					<c:otherwise>
						<h4 class="request_title">회원님의 리뷰</h4>
						<div id="reviewtable">
							<table border="1" style="width: 100%;">
								<tr>
									<th><h4>별점</h4></th>
									<th><h4>리뷰 내용</h4></th>
									<th><h4>좋아요 수</h4></th>
								</tr>
								<tr>
									<td>${rev.starScore}</td>
									<td>${rev.reviewContent}</td>
									<td>${rev.likeCount}</td>
								</tr>
							</table>
						</div>
					</c:otherwise>
				</c:choose>
			

			<!-- 해당 영화의 모든 리뷰 출력 (로그인시에만 좋아요버튼 활성화 -->
<!-- 			<div class="box" id="test"> -->
				<button id="btn_toggle" class="review_btn_toggle">+ 더보기</button>
				<div id="Toggle" style="display: none">
					<c:forEach var="reviewlist" items="${reviewlist}">
						<div class="test" id="reviewcontainer">
							<div class="reviewhead">
								<div class="nickname">${reviewlist.nickname}</div>
								<div class="starscore">★ ${reviewlist.starScore}</div>
							</div>

							<div class="reviewbody">
								<pre>
									<div class="reviewcontent">${reviewlist.reviewContent}</div>
								</pre>
							</div>


							<div class="reviewfooter">
								<div onload="fn2">좋아요 수 : ${reviewlist.likeCount}</div>

								<div class="likebtnif">
									<c:if test="${loginUser.memberId != null }">
										<input type="button" data-reviewId="${reviewlist.reviewId}"
											data-memberId="${loginUser.memberId}" class="btnlike"
											value="좋아요!">
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</div>

			<!-- 동일장르 영화 추천 -->
			<div id="filminfolistsamegenre" class="filminfolistsamegenre">
				<h2 class="request_title">같은장르의 다른 영화는 어떠세요?</h2>
				<div id="slideShow">
					<ul id="slides_filminfo" class="slides">
						<c:forEach var="filmInfo2" items="${filmInfo2}">
							<li class="image_list">
								<div>
									<div>
										<c:choose>
											<c:when test="${not empty  loginUser}"> 
												<a href="<c:url value='/film/${filmInfo2.filmId}/${loginUser.memberId}'/>">
											</c:when>
											<c:otherwise>
												<a href="<c:url value='/film/${filmInfo2.filmId}/0'/>">										
											</c:otherwise>
										</c:choose>
										<c:set var="len" value="${fn:length(filmInfo2.fileName)}"/>
											<c:set var="filetype" value="${fn:toUpperCase(fn:substring(filmInfo2.fileName, len-4, len))}"/>
											<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
												<c:url var="imageName" value="/file/${filmInfo2.fileId}"/>
												<img src="${imageName}" width="100" class="img-thumbnail">
											</c:if>	
										</a>
									</div>
									<div style="text-align: center;">
										<span>${filmInfo2.filmTitle}</span>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<p class="controller">
						<span id="prev_filminfo" class="prev">&lang;</span> 
						<span id="next_filminfo" class="next">&rang;</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	<script>
	 // 김미리 작성 : 위시리스트 담기 - 데이터 전송(ajax)
	var login_chk = $(function() {
		  $(document).on("click", "button[name='wishlist_btn']", function () {
			  var filmId = '${filmInfo.filmId}';
			  var memberId = '${loginUser.memberId}';
			  	
			  	console.log(filmId);
			  	console.log(memberId);
		  		
		  if(memberId ==''){
		      alert("내 보관함에 작품을 담으려면 로그인이 필요해요. 회원가입 혹은 로그인해주세요.");  //비로그인 시 알림창 노출
		       return ; //false ;
		        }
		  else{  //로그인 상태일 때 실행
			  $.ajax({
			         url : "./film", //Controller에서 요청 받을 주소
			         type : "post", //POST 방식으로 전달
			         data : {
			        	 filmId : filmId,
			        	 memberId : memberId
			         	},
			         success : function(data) { //컨트롤러에서 넘어온 BasketList값을 받는다 
			        	 //insertwish.submit(); 
			        	 alert(data.message);
			        	 return; //true ;
			         },
			         error : function() {
			            alert("에러입니다");
			            return; //false;
			         }//end error
			      }); //end ajax
			   } //end else
			});//end login_chk function
		});//end function
	</script>
<%@include file="../footer.jsp"%>