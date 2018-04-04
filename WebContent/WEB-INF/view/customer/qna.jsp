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
 a.bgg:link { color: black; text-decoration: none;}
 a.bgg:visited { color: gray; text-decoration: none;}
 a.bgg:hover { color: black; text-decoration: underline;}
 
</style>
<div  style="margin-bottom: 25px;">
  <h2 style="color:#2E64FE"><%=typek %></h2> 
  <p style="margin-bottom: 10px;">
  <c:if test="${logon==null && type=='qna'}">
  <span><small>문의글은 회원가입 후 작성하실 수 있습니다.</small></span>
  </c:if>
  <c:if test="${type=='review'}">
  <span><small>에코 렌트카를 이용하신 후기를 작성해주세요.</small></span>
  </c:if>  
  <c:if test="${logon==null && type=='notice'}">
  <span><small>저희 렌트카를 이용 시, 알아두실 사항입니다.</small></span>
  </c:if>  
  <c:if test="${logon!=null}">
<c:if test="${type!=notice||logon.LV==2}">
  <p align="right"><button type="button" onclick="location.href='/customer/write?type=${type}'" class="btn btn-info btn-sm">글쓰기</button></p>
  </c:if>
</c:if>
  <form id="del" action="/customer/delete2" method="post">
  <input type="hidden" name="type" value="${type}">
  <table class="table" style="width:100%">
    <thead>
      <tr>
      	<th style="width:7%"></th>
        <th style="width:50%; text-align: center;">제목</th>
        <th style="width:15%; text-align: center;">작성자</th>
        <th style="width:20%; text-align: center;">작성일자</th>
        <th style="width:20%; text-align: center;">조회수</th>
          <c:if test="${logon.LV eq '2' }">
        <th style="width:5%"><input id="checkAll" class="tt" type="checkbox"/></th>
        </c:if>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="n" items="${noti }" end="2">
    	<tr>
    		<th style="text-align: center;">공지</th>
    		<th><a href="/customer/notice/${n.NO }" class="bgg">${n.TITLE }</a></th>
    		<th style="text-align: center;">${n.NAME }</th>
    		<th style="text-align: center;"><fmt:formatDate value="${n.BDATE }" pattern="MM/dd HH:mm"/></th>
    		<th style="text-align: center;">${n.HIT }</th>
    		<th></th>
    	</tr>
    </c:forEach>
    <c:forEach var="b" items="${board }" varStatus="vs" begin="${(page.page-1)*page.countList }" end="${(page.page-1)*page.countList+page.countList-1}">
      <tr>
      	<c:choose>
      		<c:when test="${type==notice}">
        		<td align="center">${vs.count }</td>
      		</c:when>
	      	<c:otherwise>
		      	<td align="center">${b.NO }</td>
    	  	</c:otherwise>
      	</c:choose>
        <td><a href="/customer/${type}/${b.NO }" class="bgg">${b.TITLE }</a> (${b.CNT }<c:if test="${b.CNT==null }">0</c:if>)</td>
        <td align="center">${b.NAME }</td>
        <td align="center"><fmt:formatDate value="${b.BDATE }" pattern="MM/dd HH:mm"/></td>
        <td align="center">${b.HIT }</td>
        <c:if test="${logon.LV eq '2' }">
        <td align="center"><input class="check tt" type="checkbox" name="no" value="${b.NO}"/></td>
        </c:if>
	</c:forEach>
    </tbody>
  </table> 
  </form>
	<c:if test="${logon.LV eq '2' }">
	<p align="right"> 
	<button type="button" id="cancel"class="btn btn-danger btn-sm">삭제</button>	
	</p>
	</c:if>
  <div style="float:left">
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
		<c:choose>
		<c:when test="${page.page==i}">
		<b>${i }</b>
		</c:when>
		<c:otherwise>
		<a href="?page=${i }&key=${key}" class="bgg">${i }</a>
		</c:otherwise>
		</c:choose> 
	</c:forEach>

	</div>
	<form>
	<p align="right" style="margin-right:9px">
		<input type="hidden" name="page" value="${page.page }"/>
		<span class="glyphicon glyphicon-search"></span> 
		&nbsp;<input type="text" name="key" value="${key }" placeholder="작성자 or 제목 or 내용"/>
		</p>
	</form>
</div>
<br/>
<script>

	$("#cancel").click(function() {
		
		var b = false;
		$(".tt").each(function() {
			if ($(this).is(':checked')) {
				b = true;
				return true;
			}
		})
	
		if (!b) {
			alert("삭제할 게시물을 선택하세요");
		} else {
			
			if(window.confirm("선택한 게시물을 삭제하시겠습니까?")){
				$("#del").submit();
			}
	
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
    
