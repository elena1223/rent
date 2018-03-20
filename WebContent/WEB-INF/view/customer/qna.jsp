<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: gray; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}
</style>
<div class="container">
  <h2 style="color:#2E64FE">고객문의</h2>         
  <table class="table">
    <thead>
      <tr>
      	<th style="width:5%"></th>
        <th style="width:10%">작성자</th>
        <th>제목</th>
        <th style="width:10%">조회수</th>
        <th style="width:35%">작성일자</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="b" items="${board }">
      <tr>
      	<td>${b.NO }</td>
        <td>${b.NAME }</td>
        <td><a href="/customer/qna/${b.NO }">${b.TITLE }</a></td>
        <td>${b.HIT }</td>
        <td><fmt:formatDate value="${b.BDATE }" pattern="MM/dd HH:mm"/></td>
	</c:forEach>
    </tbody>
  </table>
</div>

    
