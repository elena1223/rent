<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="container">  
<h2>현재 회원</h2>        
<form><p align="right" ><span class="glyphicon glyphicon-search"></span> <input style="height:30px" name="key" value="${key }" placeholder="아이디 or 이메일"/> 
<button type="button" id="m"class="btn btn-success" >메세지</button>
<button type="button" id="b" class="btn btn-danger"  style="margin-right:228px" >회원강퇴</button>
</p></form>
<form id="del" action="/manager/delete" method="post">
<table class="table table-bordered" style="width:80%">
    <thead>
      <tr>
      	<th width="5%">번호</th>
        <th width="10%">이름</th>
        <th >이메일</th>
        <th width="15%">비밀번호</th>
        <th width="23%">연락처</th>
        <th>권한</th>
        <th width="5%"><input type="checkbox" id="checkAll"/></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="m" items="${member }">
    <c:choose>
    <c:when test="${m.LV eq '2'}"><tr class="success"></c:when>
    <c:when test="${m.LV eq '1' }"><tr class="info"></c:when>
    <c:otherwise><tr class="active"></c:otherwise>
    </c:choose>
      	<td>${m.NO }</td>
        <td>${m.NAME }</td>
        <td>${m.ID}</td>
        <td>${m.PASSWORD }</td>
        <td>${m.PHONE }</td>
        <td>${m.LV }</td>
        <c:choose>
	    <c:when test="${m.LV eq '2'}"><<td></td></c:when>
	    <c:otherwise><td><input type="checkbox" name="no" class="check" value="${m.NO }"/></td></c:otherwise>
	    </c:choose>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  </form>
</div>
<script>
$("#b").click(function(){
	if(window.confirm("정말로 선택한 회원들을 강퇴시키겠습니까?")){
		$("#del").submit()
	}
})
$("#m").click(function(){
	var content = window.prompt("전송할 메세지를 입력하세요")
	if(content!=null){
		
		
		$(".check").each(function(){
		if($(this).is(':checked')){
		
		$.ajax({
			url: "/manager/message",
			type: "POST",
			async:false,
			data : {
				"content" : content,
				"target" : $(this).val()
			},
			success: function(rst){
				if(rst == true){
					

				} else {

				}
			}
		});
		}
		})
		window.alert("메세지가 전송되었습니다.")
	}
	
})

$("#checkAll").change(function(){
	if( $("#checkAll").is(':checked') ){
	    $(".check").prop("checked", true);
	  }else{
	    $(".check").prop("checked", false);
	  }
})
$(".check").change(function(){
	var state=true;
	$(".check").each(function(){
		if(!$(this).is(':checked')){
			state=false;
			return false;
		}
	})
	$("#checkAll").prop("checked", state);
})

</script>