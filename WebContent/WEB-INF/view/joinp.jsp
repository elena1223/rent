<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
    <input type="hidden" name="w" value="">
	<form id="registerform" name="registerform" method="post" autocomplete="off" >
		
    <div id="sub_tit">
        <h2 id="ctn_title">회원가입</h2>
		<div style="border-top:2px solid #ccc;"></div>
    </div>
    <p  style="margin-top: 10px;">
		<small >(*)항목은 필수 입력사항입니다.</small><br/>
		<span><small>이메일 인증 후 렌트카 예약 가능</small></span>
	</p>
		<div align="center">
			<table style="margin-top: 20px;">
				<tr>
					<td >
						(*) 이름 &nbsp;
					</td>
					
					<td>
						 <input type="text" name= "name" id="name" value="${param.NAME}" 
						 pattern = "[가-힣]{2,4}" onblur="nameCheck()"/>
						  &nbsp;<small><span class="msg_name" ></span></small>
					</td>
				</tr >
				<tr>
					<td >
						(*) ID(E-mail)&nbsp;
						
					</td>
					<td>
						<input type="text" name = "id" id= "id" value="${param.ID}" 
						onblur="idCheck()"/> &nbsp;
						<small><span class="msg_id"></span></small> 
						<input type="button" class="btn btn-default btn-xs" id="t1" value="인증" onclick="mailcheck()"> 
						 
					</td>
				</tr>	
				<tr>
					<td >
						인증번호&nbsp;<small><span class="msg_auth"></span></small>
					</td>
					<td>
						<input type="text" name = "lv" id= "lv"/> &nbsp; 
						<input type="button" id="t2" class="btn btn-default btn-xs" value="확인" onclick="authCheck()"> 
						<input type="button" id="t1" class="btn btn-default btn-xs" value="다시받기" onclick="mailcheck()"> 
						 
					</td>
				</tr>	
				<tr>
					<td >
						(*) 비밀번호 &nbsp;<br/>
					</td>
					<td>
						<input type="password" name = "password" id="password" value="${param.PASSWORD}"/>
					</td>
				</tr>
				<tr >
					<td >
						(*) 비밀번호 확인 &nbsp;<br/>
					</td>
					<td>
						<input type="password" id="password_re" onblur="passCheck()"/>
						&nbsp;<small><span class="msg_re"></span></small>
					</td>
				</tr>
				<tr >
					<td >
						(*) 핸드폰 번호&nbsp;<br/>
					</td> 
					<td>
						<input type="text" name= "phone" id="phone" autocomplete="off" maxlength="13"
						placeholder="xxx-xxxx-xxxx" value="${param.PHONE}" onblur="phoneCheck()"
						style="padding: 2px;" />
						&nbsp;<small><span class="msg_phone"></span></small>
					</td>
				</tr>

			</table>
		<button type="button" class="btn btn-success" onclick="register()" style="vertical-align:middle; margin-top: 50px; margin-bottom: 50px;">
		확인</button>
			
		</div>
	</form>
<script>
	function nameCheck(){
		var name =  $("#name").val();
		if(name == ""){
			$(".msg_name").html("이름을 입력하세요.");
			$(".msg_name").css("color", "red");

		} else {
			$(".msg_name").html("");
		}
	}

	function idCheck(){
		var id =  $("#id").val();
		if(id.length==0){
			//아이디가 없는 경우
			$(".msg_id").html("아이디를 입력해주세요.");
			$(".msg_id").css("color", "red");
			return false;
		}
		$.ajax({
			url: "/idCheck",
			type: "POST",
			async:false,
			data : {
				"id" : id
			},
			success: function(rst){
				var result = rst;
				console.log(result);
				if(result == "true"){
					//아이디가 없는 경우
					$(".msg_id").html("사용가능합니다.");
					$(".msg_id").css("color", "green");

				} else if (result == "false") {
					//아이디가 있는 경우
					$(".msg_id").html("이미 사용중인 ID입니다.");
					$(".msg_id").css("color", "red");
					//아이디 형식이 틀린 경우
				} else {
					$(".msg_id").html("잘못된 ID 형식 입니다.");
					$(".msg_id").css("color", "red");
				}
			}
		});
	}
	function authCheck(){
		
		var lv =  $("#lv").val();
		console.log(lv);
		if(lv.length==0){
			//인증번호 없는 경우
			$(".msg_auth").html("인증번호를 입력해주세요.");
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
					$("#lv").val() =  1;

				} else {
					//인증값이 틀린경우
					$(".msg_auth").html("인증번호가 틀립니다.");
					$(".msg_auth").css("color", "red");
					$("#lv").val() =  0;

				}
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
				var result = rst;
				if(result == true){
					//인증메일 전송완료
					alert("인증메일이 전송되었습니다.");
				} else {
					//인증메일 전송실패
					alert("ERROR");
				}
			}
		});
	}

    function phoneCheck(){
		var phone =  $("#phone").val();
		var phoneCheck = phone.replace(/\-/g,"");
		
		if(phoneCheck.length < 10 || phoneCheck.length > 11 ){
			alert("잘못된 휴대폰 번호입니다.");
			$("#phone").val("");
		
    		return false;
		}

		$.ajax({
			url: "/phoneCheck",
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
     
    function apply(str){
        str = str.replace(/[^0-9]/g, '');
        console.log(str);
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
	
    function register(){
    	if($("#name").val()==""){
    		alert("이름을 입력하세요!");
    		return;
    	}
    	
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
    	
    	var form = document.getElementById("registerform");
    	form.action = "register";
    	form.submit();
    }


</script>
</body>
</html>