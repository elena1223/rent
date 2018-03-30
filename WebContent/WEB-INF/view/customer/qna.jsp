<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	String type=((String)request.getAttribute( "javax.servlet.forward.request_uri")).split("/")[2];
	request.setAttribute("type", type);
	String typek=null;
	if(type.equals("qna")){
		typek="고객문의";
	}else if(type.equals("notice")){
		typek="공지";
	}else if(type.equals("review")){
		typek="후기";
	}else{
		response.sendRedirect("/index");
	}
	

%>
 <c:set var="notice" value="notice"/>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
 <style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: gray; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
</style>
<div class="container" style="margin-bottom: 25px;">
  <h2 style="color:#2E64FE"><%=typek %></h2> 
  <form id="del" action="/customer/delete2" method="post">
  <input type="hidden" name="type" value="${type}">
  <table class="table" style="width:80%">
    <thead>
      <tr>
      	<th style="width:5%"></th>
        <th style="width:55%">제목</th>
        <th style="width:10%">작성자</th>
        <th style="width:20%">작성일자</th>
        <th style="width:10%">조회수</th>
        <th style="width:5%"></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="b" items="${board }" begin="${(page.page-1)*page.countList }" end="${(page.page-1)*page.countList+page.countList-1}">
      <tr>
      	<td>${b.NO }</td>
        <td><a href="/customer/${type}/${b.NO }">${b.TITLE } (${b.CNT }<c:if test="${b.CNT==null }">0</c:if>)</a></td>
        <td>${b.NAME }</td>
        <td><fmt:formatDate value="${b.BDATE }" pattern="MM/dd HH:mm"/></td>
        <td>${b.HIT }</td>
        <c:if test="${logon.LV eq '2' }"><td><input class="check" type="checkbox" name="no" value="${b.NO}"/></td></c:if>
	</c:forEach>
    </tbody>
  </table> 
  </form>
  <c:if test="${logon.LV eq '2' }"><p align="right" style=" margin-right:235px"><a href="javascript:del();">선택삭제</a> <input id="checkAll" type="checkbox"/></p></c:if>
  <div style="float:left">
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
		<c:choose>
		<c:when test="${page.page==i}">
		<b>${i }</b>
		</c:when>
		<c:otherwise>
		<a href="?page=${i }&key=${key}">${i }</a>
		</c:otherwise>
		</c:choose> 
	</c:forEach>

	</div>
	<form>
	<p align="right" style="margin-right:225px">
		<input type="hidden" name="page" value="${page.page }"/>
		<span class="glyphicon glyphicon-search"></span> <input type="text" name="key" value="${key }" placeholder="작성자 or 제목 or 내용"/>
		</p>
	</form>
<c:if test="${logon!=null}">
<c:if test="${type!=notice||logon.LV==2}">
  <p align="right" style="margin-right:225px"><button type="button" onclick="location.href='/customer/write?type=${type}'" class="btn btn-primary">글쓰기</button></p>
  </c:if>
</c:if>
</div>
<br/>
<script>
function del(){
	if(window.confirm("선택한 게시물을 삭제하시겠습니까?")){
		$("#del").submit();
	}
	
}
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
    
