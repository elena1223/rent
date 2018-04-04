<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<html>
<head>
<style> 
textarea {
    width: 100%;
    height: 150px;
    padding: 12px 20px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    background-color: #f8f8f8;
    font-size: 16px;
    resize: none;
}


.col-75 {
    float: left;
    margin-top: 6px;
}

</style>
</head>
<body>
    <div id="sub_tit">
        <h2 id="ctn_title">방명록</h2>
        <p style="margin-bottom: 10px;">
        <span><small>누구나 자유롭게 남기고 싶은 말을 작성해주세요.</small></span>
		<div style="border-top:2px solid #ccc;"></div>
    </div>
<form style="margin-top: 30px;" id="visitform" name="visitform" method="post" autocomplete="off">
  <textarea  name= "comment" id="comment"></textarea>
  <p align="right">
		<button type="button" onclick="visit()" class="btn btn-info btn-sm"
		style="vertical-align:middle; margin-top: 10px; margin-bottom: 20px;">확인</button>  
</form>

            <!-- 방명록 내용 부분 -->
	<div id="comment">
		<c:forEach var="v" items="${requestScope.list}" varStatus="vs" 
		begin="${(page.page-1)*page.countList }" end="${(page.page-1)*page.countList+page.countList-1}">
			<hr size="1" width="700">
			<label><span class="glyphicon glyphicon-user"></span>&nbsp; ${v.name}</label>
			<label><small>${v.date}</small></label>
			<c:if test="${logon.LV==2}">
				<span><small><a href="javascript:del('${v.id}')">&nbsp;&nbsp;[삭제]</a></small></span>
				<br>
			</c:if>
			<p style="margin-top: 10px;">
			<br /> ${v.comment} <br />
				<p style="color: grey;" align="right">
					tag.&nbsp;
					<c:forEach var="t" items="${v.tags}" varStatus="vs">
						<a href="?tag=${t}">#${t}</a>&nbsp;
					</c:forEach>
				</p>
		</c:forEach>
		<hr size="1" width="700">
	</div>
	<div style="float:left; margin-bottom: 30px;">
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
		<c:choose>
		<c:when test="${page.page==i}">
		<b>${i }</b>
		</c:when>
		<c:otherwise>
		<a href="?page=${i }&tag=${tag}">${i }</a>
		</c:otherwise>
		</c:choose> 
	</c:forEach>
	</div>
	<script>
		function visit() {
			var comment = $("#comment").val();
			if(comment.length<1){
				window.alert("내용을 입력해 주세요.")
			}else{

			$.ajax({
				url : "/visitw",
				type : "POST",
				async : false,
				data : {
					"comment" : comment
				},
				success : function(rst) {

					if (rst == true) {
						//인증값이 맞는경우
						alert("등록되었습니다.");
						location.reload();

					} else {
						alert("등록실패.");
						location.reload();
					}

				}
			});
			}
		}

		function del(target) {

			$.ajax({
				url : "/delVisit",
				type : "POST",
				async : false,
				data : {
					"id" : target
				},
				success : function(rst) {

					if (rst == true) {
						//인증값이 맞는경우
						alert("삭제되었습니다.");
						location.reload();

					} else {
						alert("삭제실패.");
						location.reload();
					}

				}
			});

		}
	</script>

      
</body>
</html>