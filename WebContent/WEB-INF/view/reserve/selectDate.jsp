<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap/css/datepicker3.css" />
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/bootstrap/js/bootstrap-datepicker.kr.js"></script>

<div style="float:left; width: 100%" align="center">
  <h2 style="color:#2E64FE">예약 날짜 선택</h2>
  <small style="color:gray">당일은 예약할 수 없으며  내일날짜부터 예약하실 수 있습니다.</small>
  <h4 style="color: #AC58FA;"><b>${car.CNAME}</b></h4>
<form id="form" action="/reserve/result" method="post">
<input type="hidden" name="no" value="${car.NO }">
<img src="/imgCar/${car.IMG }" style="width: 400px; height: 200px;">
			<table class="table table-condensed" style="width: 300px">
				<tbody align="center">
					<tr>
						<td>${car.KILO }km</td>
						<td>${car.OIL }</td>
						<td>${car.MAX }인승</td>
						<td><fmt:formatNumber pattern="#,###">${car.PRICE }</fmt:formatNumber>원</td>
					</tr>
					<tr>
						<td colspan="4">${car.OPT }</td>
					</tr>
			</table>

  <table>
  <tr><td align="center"><input type="text" name="start" readonly 
  class="input-group input-append date" id="from"  style="width: 80%; text-align: center; 
  border:1px; border-style:solid; border-color: #D8D8D8; "/></td>
  <td>~</td>
  <td align="center"><input type="text" name="end" readonly 
  class="input-group input-append date" id="to"  style="width: 80%; text-align: center;
  border:1px; border-style:solid; border-color: #D8D8D8; "/></td>
  <td>  <button type="button" id="sub"  class="btn btn-success">예약하기</button>
  </td></tr>
  </table>
  
  
</form>
  총 <span id="day">1</span>일 / <span id="price"></span>원<br/>
  <span id="msg"></span><br/>
  
<div align="center"> 
  <div id ="days">
  </div>
</div>
  <br/>
</div>
  
<script>
    var dateCheck=false;
 window.onload = function () {
      bw();
      check();
   }
    
    function check(){
      $.ajax({
         url: "/reserve/dateCheck",
         type: "POST",
         async:false,
         data : {
            "start" : $('#from').val(),
            "end" : $('#to').val(),
            "no" : '${car.NO}'
         },
         success: function(rst){
            if(rst.CNT<=rst.RCNT){
               dateCheck=false;
               $.ajax({
                  url: "/reserve/overlapCheck",
                  type: "POST",
                  async:false,
                  data : {
                     "start" : $('#from').val(),
                     "end" : $('#to').val(),
                     "no" : '${car.NO}',
                     "cnt" : ${car.CNT} 
                  },
                  success: function(res){
                	 if(res.length==0){
                         $("#msg").css("color","green");
                         $("#msg").html("<br/>예약 가능한 날짜 입니다.");
                         $("#days").html("");
                         dateCheck=true;
                	 }else{
                     var html=""
                     for(var i=0;res.length>i;i++){
                        html+=res[i]
                        if(res.length==i+1||(i+1)%3==0){
                           html+="<br/>"
                        }else{
                           html+=" | "
                        }
                     }
                     $("#msg").html("<br/>예약 불가능한 날짜가 있습니다.(${car.CNT}대 운영중)");
                     $("#msg").css("color","red");
                     $("#days").css("color","red");
                     $("#days").html(html)
                  }
                  }
               })
               
            } else {
               $("#msg").css("color","green");
               $("#msg").html("<br/>예약 가능한 날짜 입니다.");
               $("#days").html("");
               dateCheck=true;
            }
         }
      });
         
    }
 
   function bw(){
    var between=(new Date($('#to').val())-new Date($('#from').val()))/1000/60/60/24+1
    $('#day').html(between);
    $('#price').html(between*${car.PRICE});
 }
   
   $("#sub").click(function(){
      check();
      if(dateCheck){
         $("#form").submit();
      }else{
         window.alert("예약가능한 날짜를 선택해주세요.")
      }
      
   });
 
   var day = new Date();
   day.setDate(day.getDate() + 1);
   
 $('#from').datepicker({
    format: "yyyy-mm-dd",
    language: "kr",
    startDate: day
    }).datepicker("setDate", day );
 
 $('#to').datepicker({
    format: "yyyy-mm-dd",
    language: "kr",
   startDate: day
       
    }).datepicker("setDate", day );
    
 $('#from').change(function(){
    if($('#from').val()>$('#to').val()){
    $('#to').val($('#from').val())
    }else{
       check();
       bw();
    }
    
    
 })
 
  $('#to').change(function(){
    if($('#from').val()>$('#to').val()){
    $('#from').val($('#to').val())
    }else{
       check();
       bw();
    }
    
    
 })
 
 
 </script>