<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3fb411ffadb12b1bf5339cfb8f7cc092"></script>

<div class="visual_title">
	<div class="img_area">
		<img src="./images/bnr_company_main.jpg" title="회사 이미지" alt="회사 이미지" />
	</div>
	<div class="visual_gon">
		<ul class="title_inner_a">
			<li>
				<p class="descr" designElement="text" textIndex="1" >TRENDY LIVING IDEA /</p> 
				<h2><span designElement="text" textIndex="2" >TOWNHOUSE LOGO</span></h2>
			</li>
		</ul>
	</div>
</div>
<div class="service_section v3">
	<h3 class="title1"><span designElement="text">CONTACT</span></h3>
	<p designElement="text">주소출력부분 <br>TOWNHOUSE</p>
    <p designElement="text">t. 010-0000-1111</p>
    <p designElement="text">operation hour. 11:00 ~ 20:00 (연중무휴)</p>
	<p>
    <div id='page-title-bar-area'>
        <div id='map' style='width:400px;height:400px;'>
        <!--지도 API 출력 부분-->
        </div>
    </div>
    </p>
    </div>
    
    <script>
    
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    	center: new kakao.maps.LatLng(37.555204, 126.936883), //지도의 중심좌표.
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.555204, 126.936883); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null);    

</script>

