<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
 <h2>글수정</h2> 
 <form action="/customer/modifyp" id="form" method="post">
  <input type="hidden" name="type" value="${type}">
  <input type="hidden" name="no" value="${no}">
 <div class="form-group">
  <input type="text" name="title" class="form-control" value=${title } id="title" placeholder="제목">
</div>
  
  <div  class="form-group">
  <textarea class="form-control" name="contents" rows="5" id="content" style="resize: none;height:300px" placeholder="본문">${content }</textarea>
</div>
<p align="right">
 <button id="sub" style="right: 0; margin:10px" class="btn btn-default">수정완료</button>
 </p>
</form>
 <script>
 	$("#sub").click(function(){
 		if($("#title").val().length<1){
 			window.alert("제목을 입력해주세요.");
 			$("#title").focus();
 		}else if($("#content").val().length<5){
 			window.alert("본문내용을 5글자 이상 입력해주세요.");
 			$("#content").focus();
 		}else{
 			console.log("?")
 			$("#form").submit();
 		}
 		
 	});
 </script>