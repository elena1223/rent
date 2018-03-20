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
 <div class="container">
  <h2>고객문의</h2>       
  <table class="table table-bordered" style="width:80%">
        <caption>게시글 상세</caption>
        <tbody>
            <tr>
                <td colspan="3"><b style="font-size:150%">${board.TITLE }</b><br/>
                ${board.NAME}
                <small style="color:gray"><fmt:formatDate value="${board.BDATE}" pattern="yyyy/MM/dd HH:mm:ss"/></small>
                </td>
                
            </tr>
            <tr height="300px">
                <td colspan="4">${board.CONTENTS }</td>
            </tr>
      </table>
</div>
    
     
    <a href="#this" class="btn" id="list">목록으로</a>
    <a href="#this" class="btn" id="update">수정하기</a>
