<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta charset="utf-8">
<div id="boardlayout" >
    <div class="subpage_wrap">
        <div id="subpageLNB" class="subpage_lnb">
<div id="boardLnbCommon">
    <h2 class="title1"><a href="#" designElement="text">CS CENTER</a></h3>
    <ul class="lnb_sub">
        <li ><a href="notice" designElement="text">공지사항</a></li>
        <li ><a href="cs" designElement="text">자주 묻는 질문</a></li>
        <li ><a href="cs?cate=3" designElement="text">상품문의</a></li>
        <li ><a href="#" designElement="text"><b>상품후기</b></a></li>
    </ul>
</div>
<script>
$(function() {
    // 고객센터 LNB 텍스트 수정기능으로 삭제시, 클라이언트단에서 삭제 처리
    $('#boardLnbCommon a').each(function(e) {
        if ( $(this).text() == '' ) {
            $(this).parent('li, h2').remove();
        }
    });
});

function list() {
	location.href='notice';
}

function nosearch() {
	if(f.nokey.value==""){
		alert("검색어를 입력하세요.. ");
		return false;
	}else{
		f.submit();
	}
	
}


</script>
        </div>
    <div class="subpage_container">
        <!-- 전체 메뉴 -->
        <a id="subAllButton" class="btn_sub_all" href="javascript:void(0)"><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV93cmlzdHdhdGNoX2NsYXNzaWNfZ2wvYm9hcmQvaW5kZXguaHRtbA==" >MENU</span></a>

        <!-- 타이틀 ( 관리자에서 설정한 "게시판명"이 노출됩니다. ) -->
        <div class="title_container">
            <h2>공지사항</h2>
        </div>

        <div id="bbslist">
        
    <form id="f" name="f" method="post" action="./nosearch">
<ul class="bbs_top_wrap">
    <li class="left">
    </li>
    
    <li class="right2">
        <span class="searchform">
            <input type="text" id="search_text" class="res_bbs_search_input" name="nokey" value="${nokey}">
            <button type="button" class="btn_resp size_b" onclick="nosearch();" value="검색">검색</button>
            <button type="button" class="btn_resp size_b" onclick="list();">초기화</button>
        </span>
    </li>
</ul>
    </form>
<!--등록된 글이 없을 경우-->
<aa:if test="${empty notilist}">
<div class="no_data_area2">
    등록된 게시글이 없습니다.
</div>
</aa:if>

<!--등록된 글이 있을 경우-->

<div class="res_table">
<ul class="thead">
<li style="width:45px;"><span designElement="text"></span></li>
<li><span designElement="text"></span></li>
<li style="width:94px;"><span designElement="text"></span></li>
<li style="width:84px;"><span designElement="text"></span></li>
</ul>


<!--반복구간 사항-->
<aa:forEach var="noti" items="${notilist}" varStatus="status">
<ul class="tbody">
<li class="mo_hide">
<span class="mtitle" designElement="text">번호:${noti.idx}</span>
<aa:if test="${noti.output eq 'Y'}">공지</aa:if>
<aa:if test="${noti.output eq 'N'}">${noti.idx}</aa:if>
</li>
<li class="subject">
   ${noti.subject}
</li>
<li class="subject" style="text-align: center;">
    ${noti.writer}
</li>
<li class="subject" style="text-align: center;">
    ${noti.indate.substring(0,10)}
</li>
</ul>
</aa:forEach>
<!--반복구간 종료-->
</div>
<div id="pagingDisplay" class="paging_navigation">
<p>
<!--페이지 번호 반복구간-->

				<td class="text-center">
                    <a href="./notice?pageno=${pageno>1?pageno-1:pageno} " class="btn btn-sm btn-primary">이전</a>
               
				<aa:out value="${stsaus.index}"/>
					<a href="./notice?pageno=${pageno<totalpage?pageno+1:pageno} " class="btn btn-sm btn-primary">다음</a>
				</td>
</p>
</div>
     </div>
    </div>
<!--공지사항 끝-->