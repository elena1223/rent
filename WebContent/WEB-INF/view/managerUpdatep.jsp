<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Manager</title>
</head>
<body>
	<div align="center">
		<h2 style="color: #2E64FE">수정 목록</h2>
		<form name="form" method="post" enctype="multipart/form-data">
			<c:forEach var="li" items="${up }">
				<table>
					<tr>
						<input type="hidden" name="no" value="${li.NO }"/>
						<td colspan="3">&nbsp;<b style="font-size: 20px;"><input type="text" style="width: 30%" name="cname" value="${li.CNAME}" autocomplete="off"/>
						</b><small>(<input type="number" min="0" max="45" name="max" value="${li.MAX}" style="width: 6%"/>인승, 
						<input type="number" min="0" name="cnt" value="${li.CNT}" style="width: 6%"/>대 보유
						)</small>
						<label class="radio-inline"><input type="radio" name="type" value="소형" class="type" ${li.TYPE =='소형'?'checked' : '' }>소형</label>
						<label class="radio-inline"><input type="radio" name="type" value="중형" class="type" ${li.TYPE =='중형'?'checked' : '' }>중형</label>
						<label class="radio-inline"><input type="radio" name="type" value="대형" class="type" ${li.TYPE =='대형'?'checked' : '' }>대형</label>
						<label class="radio-inline"><input type="radio" name="type" value="외제" class="type" ${li.TYPE =='외제'?'checked' : '' }>외제</label>
						</td>
					</tr>
					<tr>
						<td rowspan="4" style="width: 50%"><img src="/imgCar/${li.IMG }" id="preview" style="width: 400px;" onclick="document.getElementById('img').click();">
						
						<input type="file" name="img" placeholder="변경할 사진" id="img" style="display: none"/>
						</td>
						<td align="center" style="width: 18%">1일</td>
						<td align="right"><input type="number" min="0" max="1000000" step="1000" name="price" value="${li.PRICE }"/>원&nbsp;</td>
					</tr>
					<tr align="center">
						<td>
							<label class="radio-inline"><input type="radio" name="oil" value="가솔린" class="oil" ${li.OIL =='가솔린'?'checked' : '' }>가솔린</label><br/>
							<label class="radio-inline"><input type="radio" name="oil" value="디젤" class="oil" ${li.OIL =='디젤'?'checked' : '' }>디젤</label><br/>
							<label class="radio-inline"><input type="radio" name="oil" value="LPG" class="oil" ${li.OIL =='LPG'?'checked' : '' }>LPG</label>
						</td>
						<td><input type="number" min="0" name="kilo" value="${li.KILO }" style="width: 30%"/>Km</td>
					</tr>
					<tr align="center">
						<td colspan="2">옵션</td>
					</tr>
					<tr align="center">
						<td colspan="2"><input type="text" name="opt" value="${li.OPT }" style="width: 100%" autocomplete="off"/></td>
					</tr>
				</table>
				<div align="left">
				※사진을 클릭하여 변경할 수 있습니다.
				</div>
				<br/>
			</c:forEach>
			<button type="submit" class="btn btn-success" style="width: 20%" onclick="update()" formaction="/manager/updatep">수정하기</button>
		</form>
	</div>
	<script>
		function update(){
			window.alert("수정이 완료되었습니다.");
		}
		document.getElementById("img").onchange= function() {
			if(!this.files[0].type.startsWith("image")){
				window.alert("jpg, gif, bmp, tif, png 형식의 파일만 첨부하실 수 있습니다.");
				this.value="";
				return;
			}
			var reader = new FileReader();
			reader.onload = function(){
				document.getElementById("preview").src = this.result;
			}
			reader.readAsDataURL(this.files[0]);
		}
	</script>
</body>
</html>