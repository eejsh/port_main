<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="title_container">
	<h2>
		<span designElement="text" textIndex="1">회원정보 입력</span>
	</h2>
</div>
<div class="mypage_greeting Pb30">
	<span class="pilsu_icon"></span> <span designElement="text"
		textIndex="2">항목은 <span class="pointcolor">필수 입력</span> 항목입니다.
	</span>
</div>

<form name="frm" id="frm" method="post"  
action="./write.do"
enctype="application/x-www-form-urlencoded">

<div class="resp_member_join_wrap">
	<div id="formMemberArea" class="resp_member_join">
		<input type="hidden" name="kid_agree" value="" />
		<div class="resp_join_table">
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="8">아이디</p></li>
				<li class="td">
				<input type="text" name="userid" id="userid" autocapitalize="off" value="" class="eng_only" placeholder="공백 없는 영문/숫자 포함 6~20자" />
					<p id="id_info" class="guide_text"></p></li>
			</ul>
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="11">비밀번호</p></li>
				<li class="td"><input type="password" value="" name="userpw" id="userpw"
					class="eng_only class_check_password_validation" /></li>
			</ul>
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="12">비밀번호
						확인</p></li>
				<li class="td"><input type="password" value="" class="eng_only" name="userpw1" id="userpw1"  />
				</li>
			</ul>
			<ul class="required">
				<li class="th"><p designElement="text" textIndex="13">이름</p></li>
				<li class="td"><input type="text" value="" name="usernm" id="usernm" /></li>
			</ul>
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="14">이메일</p></li>
				<li class="td"><input type="text" value="" name="useremail" id="useremail" class="size_mail1"  />
							 @ <input type="text" value="" name="useremail2" id="useremail2"  class="size_mail2" />
					 <select id="find_email"name="find_email "onchange="emailselect();"  >
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="nate.com">nate.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
						<option value="empal.com">empal.com</option>
						<option value="unitel.co.kr">unitel.co.kr</option>
						<option value="gmail.com">gmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="chol.com">chol.com</option>
						<option value="paran.com">paran.com</option>
						<option value="freechal.com">freechal.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
				</select></li>
			</ul>
			<ul class="required">
				<li class="th "><p designElement="text" textIndex="16">휴대폰번호</p></li>
				<li class="td"><input type="tel" value="" class="size_phone" id="tel1"  name="tel1" onkeyup="plus()"
					maxlength="4" /> - <input type="tel" value="" class="size_phone" id="tel2" name="tel2" onkeyup="plus()"
					maxlength="4" /> - <input type="tel" value="" class="size_phone" id="tel3" name="tel3" onkeyup="plus()"
					maxlength="4" /></li>
			</ul>
			<input type="hidden" name="usertel" id="usertel">
			
			<ul>
				<li class="th "><p designElement="text" textIndex="22">주소</p></li>
				
				<li class="td"><input type="hidden" value=""  /> 
					<input type="tel" value="" name="zipcode" id="zipcode" class="size_zip_all" readonly />
					
					<button type="button"  id="add_button" name="add_button" class="btn_resp size_b color4" onclick="add()">
					
					<span designElement="text" textIndex="23" >주소찾기</span></button>
					
					<div class="address_area">
						<input type="text" value="" name="address1" id="address1" class="address size_full " readonly />
						<input type="text" value="" class="address_street size_full hide" readonly />
					</div>
					<div class="address_area">
						<input type="text" value="" id="address2" name="address2" class="size_full" />
					</div>
					
					
					<p id="address_view" style="padding-top: 5px; display: none;"></p>
				</li>
			</ul>

		</div>
	</div>
	
</form>
	
	<div id="btn_register" class="btn_area_c">
		<button type="button" onclick="abc()" class="btn_resp size_c color2 Wmax">
			<span designElement="text">입력 완료</span>
		</button>
	</div>
</div>
	
	
	
	<script type="text/javascript">
	$(function(){
		$(".selectLabelSet").each(function(){
			var selectLabelSetObj = $(this);
			$("select.selectLabelDepth1",selectLabelSetObj).bind('change',function(){
				var childs = $("option:selected",this).attr('childs').split(';');
				var joinform_seq = $(this).attr('joinform_seq');
				var select2 = $("input.hiddenLabelDepth[type='hidden'][joinform_seq='"+joinform_seq+"']").val();
				if(childs[0]){
					$(".selectsubDepth",selectLabelSetObj).show();
					$("select.selectLabelDepth2[joinform_seq='"+joinform_seq+"']").empty();
					for(var i=0; i< childs.length ; i++){
						$("select.selectLabelDepth2[joinform_seq='"+joinform_seq+"']")
						.append("<option value='"+childs[i]+"'>"+childs[i]+"</option>");
					}
				}else{
					$(".selectsubDepth",selectLabelSetObj).hide();
				}
				$("select.selectLabelDepth2 option[value='"+select2+"']").attr('selected',true);
			}).trigger('change');
		});


		/* ========== 반응형 프론트엔드 추가 ========= */
		// designed radio UI
		$('.designed_radio_checkbox input[type=radio]').closest('.designed_radio_checkbox').addClass('type_radio');
		$('.designed_radio_checkbox input[checked]').parent('label').addClass('on');

		$('.designed_radio_checkbox input[type=radio]').on('change', function() {
			$(this).parent().parent().find('label').removeClass('on');
			$(this).parent('label').addClass('on');
		});
		// designed checkbox UI
		$('.designed_radio_checkbox input[type=checkbox]').on('change', function() {
			if ( $(this).prop('checked') ) {
				$(this).parent('label').addClass('on');
			} else {
				$(this).parent('label').removeClass('on');
			}
		});
		/* ========== //반응형 프론트엔드 추가 ========= */
	});
</script>
	<!-- ------- //회원가입 입력폼 ------- -->



<script>
window.onload = function(){
    document.getElementById("add_button").addEventListener("click", function(){ //주소입력 버튼  클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
      
            	// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
                document.querySelector("input[name=address2]").focus(); //상세입력 포커싱
    
            }
        }).open();
    });
}
function plus() {
	let tel1 = document.getElementById("tel1").value;
	let tel2 = document.getElementById("tel2").value;
	let tel3 = document.getElementById("tel3").value;
	
	let tel =tel1 + tel2 + tel3;
	let aa = document.getElementById("usertel").value = tel;
}

function abc() {
if(frm.userid.value==""){
	alert("아이디를 입력하세요.")
}else if(frm.userpw.value==""){
   alert("비밀번호를 입력하세요.");
}else if(frm.userpw.value!=frm.userpw1.value){
	alert("동일한 비밀번호를 입력하세요.")
   console.log(frm.userpw.value);
   console.log(frm.userpw1.value);
}else if(frm.useremail.value==""){
	alert("이메일을 입력하세요. ");
}else if(frm.useremail2.value==""){
	alert("이메일 주소를 입력하세요.");
}else if(frm.usertel.value==""){
	alert("전화번호를 입력하세요.")
}else if(frm.address1.value==""){
	alert("주소를 입력하세요.");
}else if(frm.address2.value==""){
	alert("상세 주소를 입력하세요.")
}else{
	frm.submit();
}
}

function emailselect() {
	document.getElementById("useremail2").value=document.getElementById("find_email").value;
}
</script>

