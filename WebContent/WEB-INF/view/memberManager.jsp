<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

th, td{

	text-align: center;

}


</style>


<div class="container">  
<h2>현재 회원</h2>        
<form>
	<p align="right" >
	<span class="glyphicon glyphicon-search"></span>&nbsp;&nbsp; 
	<input style="height:30px" name="key" value="${key }" placeholder="아이디 or 이메일"/> 
	<button type="button" id="b" style="margin-right:228px" class="btn btn-danger"><small>회원 강퇴</small></button>
	</p>
</form>
<form id="del" action="/manager/delete" method="post">
<table class="table table-bordered" style="width:80%">
    <thead>
      <tr>
      	<th width="10%" >번호</th>
        <th width="10%">이름</th>
        <th >이메일</th>
        <th width="15%">비밀번호</th>
        <th width="23%">연락처</th>
        <th>권한</th>
        <th width="10%">선택</th>
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
	    <c:otherwise><td><input type="checkbox" name="no" value="${m.NO }"/></td></c:otherwise>
	    </c:choose>
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


</script>