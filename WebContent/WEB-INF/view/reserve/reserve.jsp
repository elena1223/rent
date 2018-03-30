<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%
		String js = new Gson().toJson(request.getAttribute("list")).replace(" ", "");
	%>
	
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<div style="float:left; margin-right:10px">
  <h2 style="color:#2E64FE">차량 선택</h2>
 <table style="padding-left:10px">
 <tr>
  <td width="110px">
  <select class="form-control" style="width:100px" id="sel1">
    <option value="소형">소형</option>
    <option value="중형">중형</option>
    <option value="대형">대형</option>
    <option value="외제">외제</option>
  </select>
  </td>
  <td>
  <select class="form-control" style="width:300px" id="sel2">
    <c:forEach var="c" items="${list }">
	    <c:if test="${c.TYPE eq '소형'}">
	    	<option value="${c.NO }">${c.CNAME }</option>
	    </c:if>
    </c:forEach>
  </select>
  </td>
  </tr>
 
</table>
<br/>
<span id="cimg"></span>

</div >
<div style="float:center; margin-left:10px">
<table class="table table-bordered" id="info" style="width:400px;margin-top:140px">
</table>
<p style="margin-right:215px" align="right"><button type="button" id="sub" style="width:400px" class="btn btn-primary">날짜선택</button></p>
</div>
<script>

window.onload = function () {
	$("#sel1").trigger('change');
}
	
	
	var rst = JSON.parse('<%=js%>');
	
	$("#sub").click(function(){
		location.href='/reserve/'+$("#sel2 option:selected").val();
	})
	
	$("#sel1").change(function(){
		var html="";
		for(var i=0;i<rst.length;i++){
			if(rst[i].TYPE==$("#sel1 option:selected").val()){
			html+='<option value="'+rst[i].NO+'">'+rst[i].CNAME+'</option>'
			}
		}
		$("#sel2").html(html);
		$("#sel2").trigger('change');
	})
	
	$("#sel2").change(function(){
				for(var i=0;i<rst.length;i++){
					if(rst[i].NO==$("#sel2 option:selected").val()){
						var html='<img src="/imgCar/'+rst[i].IMG+'" style="width: 400px;">'
						$("#cimg").html(html);
					html='<tr height=50px><td style="text-align:center" colspan="3"><h2>'+rst[i].CNAME+'</h2></td></tr>'+
						'<tr height=50px><td style="text-align:center">'+rst[i].KILO+'km </td><td style="text-align:center">'+rst[i].OIL+'</td><td style="text-align:center">1일 '+rst[i].PRICE+'원</td></tr>'+
						'<tr height=50px><td style="text-align:center; width:15%">'+rst[i].MAX+'인승<td><td colspan="2" style="text-align:center">'+rst[i].OPT+'</td></tr>'
						$("#info").html(html);
					break;
					}
				}
			})
</script>