<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
</head>
<body>
<style>

#nosize {
  resize: none; /* 사용자 임의 변경 불가 */
 width:100px;
}


</style>
<!-- 콘텐츠 시작 { -->
<div id="wrapper" >

    <div id="sub_tit">
        <h2 id="ctn_title">회원가입약관</h2>
		<div style="border-top:2px solid #ccc;"></div>
    </div>

    <div id="container" >
        <div id="container_title">회원가입약관</div>		<div style="position:absolute; width:100px; right:-110px;">
			<!--<a href="http://goto.kakao.com/jr8s7li0" target="_blank"><img src="http://www.jj-rentcar.com/theme/company/img/kakao_pc.png"></a>-->
			<a href="#"><img src="<%=request.getContextPath() %>/img/banner1.jpg"></a>
		</div>

<!-- 회원가입약관 동의 시작 { -->
<div class="mbskin">
    <form  name="fregister" id="fregister" action="join" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off">

    <p>회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>

    <section id="fregister_term">
        <h2>회원가입약관</h2>
        <textarea class = "nosize" style = "width:100px;" readonly >해당 홈페이지에 맞는 회원가입약관을 입력합니다.</textarea>
        <fieldset class="fregister_agree">
            <label for="agree11">회원가입약관의 내용에 동의합니다.</label>
            <input type="checkbox" name="agree" value="1" id="agree11">
        </fieldset>
    </section>

    <section id="fregister_private">
        <h2>개인정보처리방침안내</h2>
        <textarea class = "nosize" readonly>해당 홈페이지에 맞는 개인정보처리방침을 입력합니다.</textarea>
        <fieldset class="fregister_agree">
            <label for="agree21">개인정보처리방침안내의 내용에 동의합니다.</label>
            <input type="checkbox" name="agree2" value="1" id="agree21">
        </fieldset>
    </section>

    <div class="btn_confirm">
        <input type="submit" class="btn_submit" value="회원가입">
    </div>

    </form>

    <script>
    function fregister_submit(f)
    {
        if (!f.agree.checked) {
            alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
            f.agree.focus();
            return false;
        }

        if (!f.agree2.checked) {
            alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
            f.agree2.focus();
            return false;
        }

        return true;
    }
    </script>
</div>
<!-- } 회원가입 약관 동의 끝 --> 
       <a href="#hd" id="top_btn">상단으로</a>
    </div>
</div>

<!-- } 콘텐츠 끝 -->


</body>
</html>