<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="../header.jsp" %>

<div class="wrapper">
	<section class="section_layout" style="margin-bottom: 50px;">
        <div class="content1">
          <div class="title1">
            <span class="title1_content">나의 영화 감상 시간</span>
          </div>
          <div id="total_time_section">
            <div id="total_time_text" style="text-align: center; margin: 20px">
            	<c:choose>
            		<c:when test="${empty myTime}">
            			<h3>
	            			<span>
	            				<span style="color:brown;">${loginUser.nickname}</span>님은 아직 시청하신 영화가 없군요!<br> 
	            				리뷰를 작성하여 시청하신 영화 정보를 추가해 주세요.
	            			</span>            			
            			</h3>

            		</c:when>
            		<c:otherwise>
            			<h3>
            				<span>            				
			                	<span style="color: brown">${loginUser.nickname}</span>님의 총 영화 감상 시간은
            				</span>
		                	<input type="hidden" id="myTime" value="${myTime}">
		              	</h3>
		              	<div id="time_message" style="margin: 10px">
		                	<h3 id="day_hour_min_msg">
							</h3>
		              	</div>
            		</c:otherwise>
            	</c:choose>
            </div>
          </div>
        </div>
      </section>	
      
      		<!-- 김대영 작성 : 가장 최근 리뷰를 남긴 순서로 출력 -->
 			<div class="box" id="film_list_mypage_time">
				<h2>리뷰 작성순</h2>
            <div id="slideShow">
              <ul id="slides_time" class="slides">
              		<c:forEach var="myReviewByTime" items="${myReviewByTime}">
              	<li class="image_list">
              		<div>
              			<div>
		             		<a href="<c:url value='/film/${myReviewByTime.filmId}/${loginUser.memberId }'/>">
		             		<c:set var="len" value="${fn:length(myReviewByTime.fileName)}"/>
							<c:set var="filetype" value="${fn:toUpperCase(fn:substring(myReviewByTime.fileName, len-4, len))}"/>
							<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
								<c:url var="imageName" value="/file/${myReviewByTime.fileId}"/>
								<img src="${imageName}" width="100" class="img-thumbnail">
							</c:if>
		             		</a>
              			</div>              	
              			<div style="text-align:center;">
		             		<span>${myReviewByTime.filmTitle}</span>
              			</div>	
              			<div style="text-align:center;">
		             		<span>나의 별점:★ ${myReviewByTime.starScore}.0</span>
              			</div>	
              		</div>
              	</li>
              		</c:forEach>
              </ul>
			  <p class="controller">
			  	<span id="prev_time" class="prev">&lang;</span>
        		<span id="next_time" class="next">&rang;</span>
			  </p>
            </div>        
            </div>        
            
            <!-- 김대영 작성 : 내가 준 별점이 높은 순서로 출력 -->
 			<div class="box" id="film_list_mypage_star">
				<h2>나의 별점순</h2>
            <div id="slideShow">
              <ul id="slides_star" class="slides">
              		<c:forEach var="myReviewByStar" items="${myReviewByStar}">
              	<li class="image_list">
              		<div>
              			<div>
              				<a href="<c:url value='/film/${myReviewByStar.filmId}/${loginUser.memberId }'/>">
		             		<c:set var="len" value="${fn:length(myReviewByStar.fileName)}"/>
							<c:set var="filetype" value="${fn:toUpperCase(fn:substring(myReviewByStar.fileName, len-4, len))}"/>
							<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
								<c:url var="imageName" value="/file/${myReviewByStar.fileId}"/>
								<img src="${imageName}" width="100" class="img-thumbnail">
							</c:if>
		             		</a>
              			</div>              	
              			<div style="text-align:center;">
		             		<span>${myReviewByStar.filmTitle}</span>
              			</div>	
              			<div style="text-align:center;">
		             		<span>나의 별점:★ ${myReviewByStar.starScore}.0</span>
              			</div>	
              		</div>
              	</li>
              		</c:forEach>
              </ul>
			  <p class="controller">
			  	<span id="prev_star" class="prev">&lang;</span>
        		<span id="next_star" class="next">&rang;</span>
			  </p>
            </div>
            </div>
            
            <!-- 김미리 작성 : 마이 위시리스트 조회 -->
            <!-- <div class ="mywish_List" >
            <div class ="mywish_List_sub" style="text-align: center; margin: 20px"> -->
				<div class="box" id="film_list_mypage_wish">
				<span class="title4_content">보관함에 담긴 <span style="color:brown;">${loginUser.nickname}</span>님의 영화리스트</span>	
            <c:choose>
            <c:when test="${empty BasketList}">
	            	<span style="color:brown;">${loginUser.nickname}</span>님의 자주보는 영화를 위시리스트에 추가할 수 있어요!<br> 
	            		<a href ="${pageContext.request.contextPath}" class="insert_wish_btn"> 위시리스트에 추가하기</a>     	            			
	         	</c:when>
	         	<c:otherwise>
	            <div id="slideShow">
	              <ul id="slides_wish" class="slides">
	              		<c:forEach var="myBasketList" items="${BasketList}">
	              	<li class="image_list" id="image_list">
	              			<div>
			             		<a href="<c:url value='/film/${myBasketList.filmId}/${loginUser.memberId }'/>">
			             		<c:set var="len" value="${fn:length(myBasketList.fileName)}"/>
								<c:set var="filetype" value="${fn:toUpperCase(fn:substring(myBasketList.fileName, len-4, len))}"/>
								<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG')}">
									<c:url var="imageName" value="/file/${myBasketList.fileId}"/>
									<img src="${imageName}" width="100" class="wish_img-thumbnail">
								</c:if>			             		
			             		</a>
	              			</div>  
	              			<div class="wish_film_info">
	              			<div style="text-align:center;">
			             		<span>${myBasketList.filmTitle}</span>
	              			</div>
	              			<div style="text-align:center;">
		             		<span>
		             		<button type="submit" name="wishlist_deletebtn" class="wishlist_deletebtn" data-listid="${myBasketList.basketId}">보관함에서 삭제하기</button>
							</span>
								
	              			</div>
	              		</div>
	              	</li>
	              		</c:forEach>
	              </ul>
	              <p class="controller"> 
					<span id="prev_wish" class="prev">&lang;</span> 
			        <span id="next_wish" class="next">&rang;</span> 
 				  </p> 
	            </div>
	            </c:otherwise>
	            </c:choose>
	            </div>
	            
	            
	            <div>
	           		<button class="update_btn" type="button" onclick="location.href = '<c:url value='/member/updateMember' />'   ">회원정보 수정</button>
	            </div>
	            </div>
	            
    <script>
  /* 김미리 작성 : 위시리스트 삭제 버튼 클릭 시 알림창 */
    var delete_wishList = $(function() {
    	  $(document).on("click", "button[name='wishlist_deletebtn']", function () {
    		  var memberId = '${loginUser.memberId}';
    		  var basketId = $(this).attr("data-listid");
    		  
    		  	console.log(basketId);

    		  $.ajax({
    		         url : "./member/mypage", //Controller에서 요청 받을 주소
    		         type : "post", //POST 방식으로 전달
    		         data : {
    		        	 memberId : memberId,
    		        	 basketId : basketId
    		         	},
    		         success : function(data) {  
    		        	 alert(data.message); //삭제버튼 눌렀을 때 알림창 노출
    		        	 $("#image_list").remove(); //버튼 클릭 시 해당 위시리스트 요소 삭제
    		        	 return; 
    		         },

    		         error : function() {
    		            alert("에러입니다");
    		            return; 
    		         }//end error
    		      }); //end ajax
    		});//end login_chk function
    	});//end function
    </script>
<%@ include file="../footer.jsp" %>
