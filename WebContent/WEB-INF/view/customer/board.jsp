<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String type= (String)((Map)request.getAttribute("board")).get("TYPE");
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
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <div class="container">
 <c:set var="notice" value="notice"/>
  <h2><%=typek %></h2>
  <p style="position: absolute; right: 0; margin-right:130px">
    <a href="/customer/${board.TYPE}" class="btn" id="list">목록으로</a>
    <c:if test="${logon.NO==board.WRITER}">
    <a href="javascript:$('#modify').submit()" class="btn" id="update">수정하기</a>
    </c:if>
    <c:if test="${logon.NO==board.WRITER||logon.LV==2}">
    <a href="/customer/delete?no=${board.NO}&type=${board.TYPE}" class="btn" id="delete">삭제</a>
    </c:if>     
  </p>  
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
 <c:if test="${board.TYPE!=notice }">
   <table class="table" style="width:80%">
   <c:forEach var="c" items="${comments}">
  	<tr>
  		<th width=10%>${c.NAME}</th>
  		<td>${c.COMMENTS }</td>
  		<td width=5%><c:if test="${c.MNO==logon.NO||logon.LV==2 }">
  		<a href="/customer/cdelete?no=${c.NO }&cno=${c.CNO}&type=${board.TYPE}"><span class="glyphicon glyphicon-remove"></span></a>
  		</c:if></td>
  		<td width=15%><small><fmt:formatDate value="${c.CDATE}" pattern="MM/dd HH:mm:ss"/></small></td>
  	</tr>
  	</c:forEach>
  </table>
  
  	<form action="/customer/comment" method="post" id="form">
  		<input type="hidden" name="uri" value="<%=request.getAttribute("javax.servlet.forward.request_uri")%>">
  		<input type="hidden" name="cno" value="${board.NO }"/>
      <textarea class="form-control" name="comment" rows="5" id="content" style="resize: none;height:100px;width:80%" placeholder="댓글작성"></textarea><br/>
       <button id="sub" style="position: absolute; right: 0; margin-right:125px" class="btn btn-primary">댓글작성</button>
     </form>
       <br/><br/><br/>
</c:if>       
</div>
<form action="/customer/modify" id="modify" method="post">
	<input type="hidden" name="title" value="${board.TITLE }">
	<input type="hidden" name="content" value="${board.CONTENTS }">
	<input type="hidden" name="type" value="${board.TYPE }">
	<input type="hidden" name="no" value="${board.NO }">
</form>
	<script>
		

		if(${logon}+""==""){
			$("#content").attr('readonly', 'true');
		}
		$("#content").click(function(){
			if(${logon}+""==""){
				if(window.confirm("로그인 후 이용하실 수 있습니다. 로그인 하시겠습니까?")){
					location.href='/login';
				}
			}
		});
		
		$("#sub").click(function(){
			if(("#content").value().length<1){
				window.alert("댓글 내용을 작성해주세요.");
			}else{
				$("#form").submit();
			}
		})
	
	</script>

    
     

