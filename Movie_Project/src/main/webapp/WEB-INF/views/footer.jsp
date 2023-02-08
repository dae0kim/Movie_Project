<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer>
    <section class="section_bar_second">
        <div class="content_layout">
            <div class="content">
                <ul class="terms">
                    <li class="service_terms">
                        서비스 이용약관 | 
                    </li>
                    <li class="privacy_policy">
                        개인정보 처리방침 | 
                    </li>
                    <a href="#" class="company_info">
                        회사 안내
                    </a>
                    <c:choose>
						<c:when test="${not empty loginUser}"> 
							<a href="<c:url value='/adminhome' />">관리자</a>
						</c:when>
						<c:otherwise>
 							<a href="<c:url value='/member/adminlogin' />">관리자</a>
						</c:otherwise>
					</c:choose>
                </ul>
                <ul class="Service_center_info">
                    <li class="Service_center">
                        고객센터 | 
                    </li>
                    <li class="Service_email">
                        <a href="mailto:korea@netflix.com" class="email">
                            korea@netflix.com
                            <span>,080-001-9587</span>
                        </a>
                    </li>
                </ul>
                <ul class="contact_us_info">
                    <li class="contact_us">
                        문의하기
                        <a href="https://help.netflix.com/ko/contactus" class="contact_us_link">
                        </a>
                    </li>
                    <li class="FAQ">
                        자주 하는 질문
                        <a href="https://help.netflix.com/ko/node/412" class="FAQ_link">
                        </a>
                    </li>
                    <li class="interval">

                    </li>
                </ul>
                <ul class="NFkorea_info">
                    <li class="NFkorea">
                        넷플릭스 대한민국
                    </li>
                    <li class="CEO">
                        대표: 레지널드 숀 톰프슨
                    </li>
                    <li class="company address">
                        대한민국 서울특별시 종로구 우정국로 26, 센트로폴리스 A동 20층 우편번호 03161
                    </li>
                </ul>
                <ul class="Company_Registration_Number_info">
                    <li class="Company_Registration_Number">
                        사업자등록번호
                        <span> 165-87-00119</span>
                    </li>
                </ul>
            </div>
        </div>
    </section>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mypage.js" async></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/filminfo.js"></script>
</body>
</html>
