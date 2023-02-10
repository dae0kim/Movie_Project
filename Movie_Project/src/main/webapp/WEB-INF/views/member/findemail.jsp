<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="findemail_modal" class="modal">  
    <div class="login_modal_full_div">
    	<form action="<c:url value='/member/login'/>" method="post" name="loginfrm">	
			<div class="title1">
				<p class="title1_content">이메일 찾기</p>
			</div>
			<div id="findemail_form" >
				<div >
					<label>생년월일</label>
					<input type="date" name="birthDate" id="birthDate" size="20" placeholder="생년월일" required>			
				</div>
				<div class="phonenum_div">
					<label>연락처</label>
					<input type="tel" id="phoneNumber" name="phoneNumber" id="birthDate" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="012-3456-7890" required/>			
				</div>
				<div class="loginBtn">
					
					<!-- <input type="button" id="findemail_btn" value="아이디 찾기" />				 -->
					<a id="findemail_btn" class="login_btn">아이디 찾기</a>	
				</div>
			</div>
			<div id="email_result" hidden="true">
				<label id="findemail_Msg"></label>
				<!-- <input type="button" onClick="location.href='#close_btn'"> -->

				<a id="close_btn" href="#close" rel="modal:close" class="confirm_member_btn">확인</a>
			</div>
							
		</form>
    </div>
</div>



<script>
	$("#findemail_btn").click(function(){
		var birthDate = $("#birthDate").val();
		var phoneNumber = $("#phoneNumber").val();
		
		$.ajax({
			url: "member/findemail",
			type: "post",
			data: {birthDate: birthDate, phoneNumber: phoneNumber},
			success: function(data){
				var matchEmail = data;
				if(data == 'fail'){
					$('#findemail_form').attr('hidden', true);
					$('#email_result').attr('hidden', false);
					$('#findemail_Msg').text("가입된 이메일이 없습니다.").css({"color": "#DC143C", "font-size": "13px",
						"font-weight": "400" , " letter-spacing": "-0.2px", " line-height": "18px" , 
						"margin": "6px 12px 4px" });				
				} else {
					$('#findemail_form').attr('hidden', true);
					$('#email_result').attr('hidden', false);
					$('#findemail_Msg').text(matchEmail).css({"color": "green", 
						"font-size": "13px","font-weight": "400" , 
						" letter-spacing": "-0.2px", " line-height": "18px" , 
						"margin": "6px 12px 4px" });						
				}//end if	
			},//end success
			error:function(){
				alert("이메일을 찾지 못햇습니다.");
			}, 
			complete : function () {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수
				$("#birthDate").val("");
				$("#phoneNumber").val("");
			}		
		})//end ajax	
	})//end findemail_btn
	
	$("#close_btn").click(function(){
		$('#findemail_Msg').val("");
		$('#findemail_form').attr('hidden', false);
		$('#email_result').attr('hidden', true);
		
	})



</script>
		