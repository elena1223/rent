<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<p style="vertical-align: middle;" >    
TEL. 010-2018-0326 서울특별시 강남구 강남대로84길 16 제이스타워 11층
주식회사 에코렌트카 사업자등록번호:123-13-12345 개인정보관리책임자 : 김관리
</p>

<script>
$(".needLogin").click(function(){
	if(${logon==null}||${logon.LV eq 0}){
		window.alert("비회원이나 미인증 회원은 이용할 수 없는 페이지입니다.");
	}
})
</script>