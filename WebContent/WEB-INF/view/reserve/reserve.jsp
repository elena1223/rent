<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<script>
	$("#sel1").change(function(){
		$.post("/reserve/readByType",{type:$("#sel1 option:selected").val()},
			success: function(rst) {
				var html="";
				for(var i=0;rst.length;i++){
					html+='<option value="'+rst.NO+'">'+rst.CNAME+'</option>'
				}
				$("#sel2").html(html);
			}
			
		})
			
		
	})
	
</script>