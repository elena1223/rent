<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    padding: 15px;
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
	<form id="registerform" name="registerform" action="register" 
	onsubmit="return registerform_submit(this);" method="post" autocomplete="off" >
		
    <div id="sub_tit">
        <h2 id="ctn_title">회원가입</h2>
		<div style="border-top:2px solid #ccc;"></div>
    </div>
    <p  style="margin-top: 10px;">
		<small >모든 항목은 필수 입력사항입니다.</small>
	</p>
		<div align="center">
			<table style="margin-top: 20px;">
				<tr>
					<td >
						이름 &nbsp;<span class="msg"></span>
					</td>
					
					<td>
						 <input type="text" name= "name" id="name" value="${param.NAME}"/>
					</td>
				</tr >
				<tr>
					<td >
						ID(E-mail)&nbsp;<span class="msg"></span>
					</td>
					<td>
						<input type="text" name = "id" id= "id" value="${param.ID}"/> &nbsp; 
						<input type="button" id="t1" value="인증하기" onclick="mailcheck()"> 
						 <span><small>(이메일 인증을 하셔야 렌트카 예약이 가능합니다)</small></span>
						 
					</td>
				</tr>					
				
				<tr>
					<td >
						비밀번호 &nbsp;<span class="msg"></span>
					</td>
					<td>
						<input type="password" name = "password" id="password" value="${param.PASSWORD}"/>
					</td>
				</tr>
				<tr >
					<td >
						비밀번호 확인 &nbsp;<span class="msg"></span>
					</td>
					<td>
						<input type="password" id="password_re" />
					</td>
				</tr>
				<tr >
					<td >
						핸드폰 번호&nbsp;<span class="msg"></span>
					</td> 
					<td>
						<input type="text" name= "phone" id="phone" autocomplete="off" maxlength="13"
						placeholder="xxx-xxxx-xxxx" value="${param.PHONE}"
						style="padding: 2px;" />
					</td>
				</tr>

			</table>
		<button type="submit" style="vertical-align:middle; margin-top: 50px; margin-bottom: 50px;">
		회원가입</button>
			
		</div>
	</form>
<script>


	
	function mailcheck() {
		var mail = $("#id").val();
		console.log(mail)
		$.post("/email", {
			"email" : mail
		}, function(rst) {
			window.alert("rst = " + rst);
		});
	};

    
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



</script>
</body>
</html>