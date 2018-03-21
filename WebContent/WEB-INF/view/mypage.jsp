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
						 <input type="text" name= "name" id="name" value="${param.NAME}" onblur="nameCheck()"/>
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
						<input type="button" id="t1" value="인증" onclick="mailcheck()"> 
						 
					</td>
				</tr>	
				<tr>
					<td >
						인증번호&nbsp;<small><span class="msg_auth"></span></small>
					</td>
					<td>
						<input type="text" name = "lv" id= "lv"/> &nbsp; 
						<input type="button" id="t2" value="확인" onclick="authCheck()"> 
						<input type="button" id="t1" value="다시받기" onclick="mailcheck()"> 
						 
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
						placeholder="xxx-xxxx-xxxx" value="${param.PHONE}"
						style="padding: 2px;" />
						&nbsp;<small><span class="msg"></span></small>
					</td>
				</tr>

			</table>
		<button type="button" onclick="register()" style="vertical-align:middle; margin-top: 50px; margin-bottom: 50px;">
		회원가입</button>
			
		</div>
	</form>








</body>
</html>