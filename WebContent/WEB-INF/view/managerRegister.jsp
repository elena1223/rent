<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Manager</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div align="center">
		<h2>차량 등록</h2>
		<form id="addform" name="addform" method="post" enctype="multipart/form-data">
			모든 항목은 필수 입력사항입니다.
			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="cName">Car Name</label>
				</div>
				<input type="text" class="form-control" id="cName"
					placeholder="Car Name" name="cName"/>
			</div>

			<div align="center" style="width: 50%">
				<div align="left">
					<label for="type">Type</label>
				</div>
			<label class="radio-inline"><input type="radio" name="type" value="소형">소형</label>
			<label class="radio-inline"><input type="radio" name="type" value="중형">중형</label>
			<label class="radio-inline"><input type="radio" name="type" value="대형">대형</label>
			<label class="radio-inline"><input type="radio" name="type" value="외제">외제</label>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="price">Price</label>
				</div>
				<input type="number" min="0" max="1000000" step="50000" class="form-control"
					id="price" placeholder="Price" name="price">
				<div align="left">
					<small>1일 기준 금액이며, 최대 금액은 1,000,000만원입니다.</small>
				</div>
			</div>

			<div align="center" style="width: 50%">
				<div align="left">
					<label for="oil">Oil</label>
				</div>
			<label class="radio-inline"><input type="radio" name="oil" value="가솔린">가솔린</label>
			<label class="radio-inline"><input type="radio" name="oil" value="디젤">디젤</label>
			<label class="radio-inline"><input type="radio" name="oil" value="LPG">LPG</label>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="option">Option</label>
				</div>
				<input type="text" class="form-control" id="option"
					placeholder="Option" name="option">
				<div align="left">
					<small>옵션은 ','를 사용하여 구분합니다. 예)후방카메라,네비게이션</small>
				</div>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="max">Max</label>
				</div>
				<input type="number" min="0" max="45" class="form-control" id="max"
					placeholder="Max" name="max">
				<div align="left">
					<small>최대 정원은 45명까지 가능합니다.</small>
				</div>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="cnt">Cnt</label>
				</div>
				<input type="number" min="0" class="form-control" id="cnt"
					placeholder="Cnt" name="cnt">
				<div align="left">
					<small>등록할 차량 대수를 입력하세요.</small>
				</div>
			</div>

			<input id="image" type="file" onchange="InputImage();"><br/>
			<div id="imagePreview"></div>

			<br/>
			<button type="submit" class="btn" style="width: 20%" onclick="add()">등록</button>
		</form>
	</div>

	<script>
		var InputImage = (function loadImageFile() {
			if (window.FileReader) {
				var ImagePre;
				var ImgReader = new window.FileReader();
				var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;

				ImgReader.onload = function(Event) {
					if (!ImagePre) {
						var newPreview = document
								.getElementById("imagePreview");
						ImagePre = new Image();
						ImagePre.style.width = "400px";
						ImagePre.style.height = "220px";
						newPreview.appendChild(ImagePre);
					}
					ImagePre.src = Event.target.result;

				};

				return function() {
					var img = document.getElementById("image").files;
					if (!fileType.test(img[0].type)) {
						alert("이미지 파일을 업로드 하세요");
						return;
					}
					ImgReader.readAsDataURL(img[0]);
				}
			}
			document.getElementById("imagePreview").src = document
					.getElementById("image").value;
		})();
		
		function add(){
	    	if($("#cName").val()==""){
	    		alert("차량 이름을 입력하세요.");
	    		return;
	    	}
	    	
	    	if($("#type").val()==""){
	    		alert("차량 종류를 선택하세요.");
	    		return;
	    	}
	    	
	    	if($("#price").val()==""){
	    		alert("렌트비를 입력하세요.");
	    		return;
	    	}
	    	
	    	if($("#oil").val()==""){
	    		alert("유종을 선택하세요.");
	    		return;
	    	}
	    	
	    	if($("#max").val()==""){
	    		alert("최대 정원을 입력하세요.");
	    		return;
	    	}
	    	
	    	if($("#cnt").val()==""){
	    		alert("보유 대수를 입력하세요.");
	    		return;
	    	}
	    	
	    	if($("#image").val()==""){
	    		alert("이미지를 선택하세요.");
	    		return;
	    	}
	    	
	    	var form = document.getElementById("addform");
	    	form.action = "addCar";
	    	form.submit();
	    }
	</script>

</body>
</html>