<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더 시작 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴런 -영화 추천 및 평가 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainnoticelist.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainnoticeinfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewbox.css">    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/filminfo.css">    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/search_view.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_modal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css">
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<body>
	<div id="root">
		<div class ="container_full">
			<div class="container_sub">
				<header class=first_header>
            		<nav>
                		<div class="fullnav">
                    		<div class="subnav">
                        		<ul class="navigation">
                            		<li class="logo">
                                		<a href="<c:url value='/index' />">
                                			<img src="<c:url value='/resources/images/logo.png' />" viewBox="0 0 151 29" class="logo_img">
                                		</a>
                            		</li>
                            		
                            		<li class="common">
                                		<button class="common_btn" type="button" onclick="location.href = '<c:url value='/notice/mainnoticelist' />'">공지사항</button>
                            		</li>
                            		
                            		<li class="common">
                                		<button class="notice_btn_w" >공지사항</button>
                            		</li>
                            		<li class="common">
                                		<button class="notice_btn_w">공지사항</button>
                            		</li>
		                            <li class="common">
		                                <button class="notice_btn_w"> </button>
		                            </li>
		                            <li class="search_common">
		                                <div class="search_layer">
		                                
	                                    <!-- 검색창 -->
	                                    <div class="search_bar"> 
		                                    <form id="search" action ="${pageContext.request.contextPath}/film/search_view" method="post" > 
		                                        <label class="search_label" id="search_label">
		                                            <input type="text" autocomplete="off" placeholder="영화제목,인물,감독을 검색해보세요." 
		                                            name="keyword" class="search_txt" id="search_txt" >
		                                            
		                                            <div value="false" class="search_false">
		                                                <span aria-label="clear" role="button" class="search_aria" ></span>
		                                            </div>
		                                        </label>
		                                    </form>
		                                </div>
		                                
		                            	</div>
		                            </li>
                            		<li class="common">
										<c:choose>
											<c:when test="${not empty  loginUser}"> 
<%-- 											<li class="new user"><b>${loginUser.nickname}</b>님 안녕하세요!</li> <!-- 로그인 시, 노출 --> --%>
<%-- 			                					<li class="new_user"><button class="user_btn" onclick="location.href='<c:url value='/member/mypage/${loginUser.memberId}'/>'"></button></li> <!-- 로그인 시, 노출 -->			 --%>
			                					<li class="common"><button class="common_btn" onclick="location.href='<c:url value='/member/mypage/${loginUser.memberId}'/>'">마이페이지</button></li>
												<button class="common_btn" type="button" onclick="location.href = '<c:url value='/member/logout' />'">로그아웃</button>						
											</c:when>
											<c:otherwise>
											<li class= "login_button">
												<p><a href="#login_modal" rel="modal:open" class="login_a_tag">로그인</a></p>
												<%@include file="./member/login.jsp" %>
												</li>
											<li class="join_button">						
												<p><a href="#join_modal" rel="modal:open" class="join_btn">회원가입</a></p>
												<%@include file="./member/join.jsp" %>
												</li>
											</c:otherwise>
										</c:choose>
                            		</li>
                        		</ul>
                    		</div>
                		</div>
            		</nav>
        		</header>
        	</div>
        </div>
    </div>
    <script>
// 김미리 작성 :  검색 입력시 이벤트 - 빈값 입력 후 엔터 시 검색결과 페이지로 넘어가는 것 방지
  	  var param_check = $(function() {
  		$("#search input[type='text']").on('keypress', function(event) {
 		  var putkeyword = $("#search_txt").val(); //id가 putkeyword인 곳에서 밸류 값을 받아옴
  		  var keycode = (event.keyCode ? event.keyCode : event.which);
  		  console.log(putkeyword,"1");
		
  		  if(keycode == 13 ){ // 엔터키가 입력될 때까지는 어떤 것도 하지 않는다.
  				event.preventDefault(); // 엔터키가 입력되면 이벤트의 기본 동작을 중단한다.
   	          //event.stopPropagation(); // 현재 이벤트가 상위로 전파되지 않도록 중단한다.
    	          console.log(putkeyword);
   	          
   	          if(putkeyword!=''){
   	        	search.submit(); 
   	          	}
   	          else{
   	        	alert("검색어를 입력하세요");  //아무값도 입력이 없이 엔터 눌렀을 때 경고창 노출
   	        	  return;
   	         	 }
  			  }
 			});//end searchinfo function
  		});//end function
		
</script>