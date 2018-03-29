<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 10px;
    
}
td	{
 width: 100px;

}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
<body>

	<form id="editform" name="editform" method="post" autocomplete="off" >
    <div id="sub_tit">
        <h2 id="ctn_title" style="color: #2E64FE">정보수정</h2>
		<div style="border-top:2px solid #ccc;"></div>
    </div>
    <p  style="margin-top: 10px;">
		<span><small>이메일 인증을 하시면 렌트카 예약이 가능합니다.</small></span>
	</p>
		<div align="center">
			<table style="margin-top: 20px;">
				<tr>
					<td >
						이름 &nbsp;
					</td>
					
					<td>
						 <label>${mypage.NAME}</label>
						  &nbsp;<small><span class="msg_name" ></span></small>
					</td>
				</tr >
				<tr>
					<td >
						ID(E-mail)&nbsp;
						<c:choose>
			<c:when test="${mypage.LV==0}">
			<span style="color: red" class="glyphicon glyphicon-remove"></span>
						<br/><small><span style="color: red"> 이메일 미인증 상태입니다.</span></small>
			</c:when>
			<c:otherwise>
			<span style="color: green" class="glyphicon glyphicon-ok"></span>
						<br/><small><span style="color: green">이메일 인증 상태입니다.</span></small>
			</c:otherwise>
			</c:choose>
					</td>
					<td>
						 <label>${mypage.ID}</label>
						<input type="hidden" id="id" name="id" value="${mypage.ID}"/> &nbsp;
						<small><span class="msg_id"></span></small> 
						<c:if test="${mypage.LV == 0}">
						<input type="button" id="t1" value="인증" onclick="mailcheck()">
						</c:if> 
					</td>
				</tr>	
				<c:if test="${mypage.LV==0}">
				<tr>
					<td >
						인증번호&nbsp;<small><span class="msg_auth"></span></small>
					</td>
					<td>
						<input type="text" name = "lv" id= "lv" /> &nbsp; 
						<input type="hidden" id = "lvv" name="lvv" >
						<input type="button" id="t2"  value="확인" onclick="authCheck()"> 
						<input type="button" id="t3" value="다시받기" onclick="mailcheck()"> 
						 
					</td>
				</tr>	
				</c:if>
				<tr>
					<td >
						비밀번호 &nbsp;<br/>
					</td>
					<td>
						<input type="password" name = "password" id="password" value="${param.PASSWORD}"/>
					</td>
				</tr>
				<tr >
					<td >
						비밀번호 확인 &nbsp;<br/>
					</td>
					<td>
						<input type="password" id="password_re" onblur="passCheck()"/>
						&nbsp;<small><span class="msg_re"></span></small>
					</td>
				</tr>
				<tr >
					<td >
						핸드폰 번호&nbsp;<br/>
					</td> 
					<td>

						<input type="text" name= "phone" id="phone" autocomplete="off" maxlength="13"
						value="${mypage.PHONE}" onblur="myphoneCheck()" class="p"
						style="padding: 2px;"disabled/>
						<button type="button" id="t4">변경하기</button>
						&nbsp;<small><span class="msg_phone"></span></small>
					</td>
				</tr>

			</table>
		<p  align="right" >
		<button type="button" onclick="outMember()"style=" vertical-align:middle; margin-top: 10px; margin-bottom: 10px;color:grey; ">
		회원탈퇴</button>
		</p>
		<br/>
		<button type="button" onclick="edit()" style="vertical-align:middle; margin-top: 20px; margin-bottom: 50px;">
		확인</button>
		<button type="button" onclick="home()" style="vertical-align:middle; margin-top: 20px; margin-bottom: 50px;">
		취소</button>	
		</div>
	</form>

<script>
	function mailcheck() {
		
		var email = $("#id").val();
		
		$.ajax({
			url: "/email",
			type: "POST",
			async:false,
			data : {
				"email" : email
			},
			success: function(rst){
				if(rst == true){
					//인증메일 전송완료
					alert("인증메일이 전송되었습니다.");
				} else {
					//인증메일 전송실패
					alert("ERROR");
				}
			}
		});
	}

	function authCheck(){
		
		var lv =  $("#lv").val();
		var lvv =  $("#lvv").val();
// 		console.log(lv);
		if(lv.length==0){
			//인증번호 없는 경우
			$(".msg_auth").html("(인증번호를 입력해주세요.)");
			$(".msg_auth").css("color", "red");
			return false;
		}
		if(lv==null){
			return lv = 0;
		} else {
			
		$.ajax({
			url: "/authCheck",
			type: "POST",
			async:false,
			data : {
				"lv" : lv
			},
			success: function(rst){

				if(rst == true){
					//인증값이 맞는경우
					$(".msg_auth").html("확인되었습니다.");
					$(".msg_auth").css("color", "green");
					$("#lvv").val(1);

				} else {
					//인증값이 틀린경우
					$(".msg_auth").html("인증번호가 틀립니다.");
					$(".msg_auth").css("color", "red");
					$("#lvv").val(0)

				}
				console.log(lv);
				console.log(lvv);
				
// 				$("#lv").val(${param.LV});
			}
		});
	}
	}

	
	function passCheck(){
		var pass =  $("#password").val();
		var pass_re =  $("#password_re").val();
		if(pass==""||pass_re==""){
			$(".msg_re").html("비밀번호를 입력하세요");
			$(".msg_re").css("color", "red");
		} else{
			
			if(pass==pass_re){
				$(".msg_re").html("비밀번호가 일치합니다.");
				$(".msg_re").css("color", "green");
			} else {
				$(".msg_re").html("비밀번호가 일치하지 않습니다.");
				$(".msg_re").css("color", "red");
			}
		}
	}
	
    function apply(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';

        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }

        return str;
    }

    var phone = document.getElementById('phone');
    phone.onkeyup = function(event){
    	event = event || window.event;
    	var s = this.value.trim();
    	this.value = apply(s) ;
    }
	
    function myphoneCheck(){
		var phone =  $("#phone").val();
		
		if(phone.length > 13){
			alert("잘못된 휴대폰 번호입니다.");
			$("#phone").val("");
		
    		return false;
		}
		
		$.ajax({
			url: "/myphoneCheck",
			type: "POST",
			async:false,
			data : {
				"phone" : phone
			},
			success: function(rst){
				if(rst == true){
					//폰번호 중복 아닌 경우
					$(".msg_phone").html("사용가능합니다.");
					$(".msg_phone").css("color", "green");

				} else {
					//폰번호 중복인 경우
					$(".msg_phone").html("이미 사용중인 번호입니다.");
					$("#phone").val("");
					$(".msg_phone").css("color", "red");

				}
			}
		});
    }

	
	$("#t4").click(function() {
		$(".p").attr("disabled", false);	// t4를 누르면 disabled 걸린걸 풀게 만들어줌..
	})
    
    
    function edit(){
    	
    	if($("#id").val()==""){
    		alert("아이디을 입력하세요!");
    		return;
    	}
    	if($("#password").val()==""){
    		alert("비밀번호를 입력하세요!");
    		return;
    	}
    	if($("#password_re").val()==""){
    		alert("비밀번호확인을 입력하세요!");
    		return;
    	}
    	if($("#phone").val()==""){
    		alert("전화번호를 입력하세요!");
    		return;
    	}
    	
    	if($("#password").val()!= $("#password_re").val()){
    		alert("비밀번호가 틀립니다. 확인해주세요.");
    		return;
    	}
    	
    	var form = document.getElementById("editform");
    	form.action = "mypageInfo";
    	form.submit();
    }
    
    
    function home(){
    	var form = document.getElementById("editform");
    	form.action = "/";
    	form.submit();
    }

    //회원탈퇴 만드는중!
    function outMember() {
		 
		var t= window.open("/target", "m", "width=500, height=500");
		t.resizeTo(500,500);  
    }
		
	
</script>
</body>
</html>