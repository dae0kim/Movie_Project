<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="findemail.jsp" %>
<%@include file="changepw.jsp" %>


	<div id="login_modal" class="modal">		   
	    <div>
	        <%-- <form action="<c:url value='/member/login'/>" method="post" name="loginfrm">	 --%>
				<div class="login_modal_body">
					<header class="login_logo_header">
						<span src="${pageContext.request.contextPath}/images/css/logo.png" class="login_logo" width="198px" height="38.03px"></span> 
					</header>
					<h2 class="title1_content">로그인</h2>
				<section>
					<div class= "login_input_full">
						<div class ="login_input_sub">
							<div class="login_form">
								<div class="input_div">
									<input id="member_email" name="email" title="아이디 입력란" placeholder="이메일" type="text" value="">			
									<label class="ChkLabel" id="email_login_msg"></label>
									<input id="email_login_overlap_check" type="hidden" value="false">
								</div>
								<div class="input_div">
									<input class="member_pw" id="member_pw" name="password" title="비밀번호 입력란" placeholder="비밀번호" type="password" value="">			
									<label class="ChkLabel" id="pw_login_msg"></label>
									<input id="pw_login_overlap_check" type="hidden" value="false">
								</div>
								<input type="submit" id="login_btn" class="login_btn" value="로그인" />
							</div>
							<div class="loss_email">						
								<p><a href="#findemail_modal" rel="modal:open">이메일 찾기</a></p>																							
							</div>
							<div class="loss_pw">
								<p><a href="#changepw" rel="modal:open">비밀번호를 잊으셨나요?</a></p>					
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
				
			<!-- </form> -->
</div>
    
<script>
		
		//제이쿼리 모달창
		$.modal.defaults = {
				closeExisting: false,    // Close existing modals. Set this to false if you need to stack multiple modal instances.
				escapeClose: true,      // Allows the user to close the modal by pressing `ESC`
				clickClose: true,       // Allows the user to close the modal by clicking the overlay
				showClose: true
		}
		
			
		//이메일 입력창 유효성 검사			
		$('#member_email').blur(function(){
			var reg_email = new RegExp('^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$');
			var member_email = $('#member_email').val();		
		
			if ($('#member_email').val() == ''){
				$('#email_login_msg').text("이메일을 입력해 주세요.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#member_email').focus();				
			} else if(!reg_email.test(member_email)){
				$('#email_login_msg').text("잘못된 이메일 형식입니다.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });
				$('#member_email').focus();					
			//} else if(reg_email.test(member_email)){
			} else {
				$('#email_login_msg').text("");
				$('#email_login_overlap_check').val("true");
			}	
		})
			
		//비밀번호 입력 검사			
		$('#member_pw').blur(function(){
			var member_pw = $('#member_pw').val();
			if($('#member_pw').val() == ''){
				$('#pw_login_msg').text("비밀번호를 입력해 주세요.").css({"color": "#DC143C", "font-size": "13px","font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , "margin": "6px 12px 4px" });						
				$('#member_pw').focus();
			} else {
				$('#pw_login_msg').text("");
				$('#pw_login_overlap_check').val("true");
			}
		})
		
		//로그인 실행
		$('#login_btn').click(function(){
			//로그인 실행
			var emailchk = $('#email_login_overlap_check').val();
			var pwchk = $('#pw_login_overlap_check').val();
			console.log(emailchk);
			console.log(pwchk);
			if(emailchk == 'true' && pwchk == 'true'){
			console.log(emailchk);
			console.log(pwchk);
			var member_email = $('#member_email').val();	
			var member_pw = $('#member_pw').val();
			
				$.ajax({
					url: "<c:url value='/member/login'/>",
					type: "post",
					data: {member_email: member_email, member_pw: member_pw},
					success: function(data){
						if(data == 'ok'){
							window.location.replace("/myapp/index");																				
						} else {
							alert("이메일 혹은 비밀번호가 잘못되었습니다.");	
						}//end if								
					},//end success
					error:function(){
						alert("로그인 실패");
					}//end error														
				})//end 로그인 실행 ajax	
			
			}//end if
		})//end login_btn
			
	
		</script>

