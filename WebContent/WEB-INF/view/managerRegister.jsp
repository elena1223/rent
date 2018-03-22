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
		<h2>���� ���</h2>
		<form id="addform" name="addform" method="post" enctype="multipart/form-data">
			��� �׸��� �ʼ� �Է»����Դϴ�.
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
			<label class="radio-inline"><input type="radio" name="type" value="����">����</label>
			<label class="radio-inline"><input type="radio" name="type" value="����">����</label>
			<label class="radio-inline"><input type="radio" name="type" value="����">����</label>
			<label class="radio-inline"><input type="radio" name="type" value="����">����</label>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="price">Price</label>
				</div>
				<input type="number" min="0" max="1000000" step="50000" class="form-control"
					id="price" placeholder="Price" name="price">
				<div align="left">
					<small>1�� ���� �ݾ��̸�, �ִ� �ݾ��� 1,000,000�����Դϴ�.</small>
				</div>
			</div>

			<div align="center" style="width: 50%">
				<div align="left">
					<label for="oil">Oil</label>
				</div>
			<label class="radio-inline"><input type="radio" name="oil" value="���ָ�">���ָ�</label>
			<label class="radio-inline"><input type="radio" name="oil" value="����">����</label>
			<label class="radio-inline"><input type="radio" name="oil" value="LPG">LPG</label>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="option">Option</label>
				</div>
				<input type="text" class="form-control" id="option"
					placeholder="Option" name="option">
				<div align="left">
					<small>�ɼ��� ','�� ����Ͽ� �����մϴ�. ��)�Ĺ�ī�޶�,�׺���̼�</small>
				</div>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="max">Max</label>
				</div>
				<input type="number" min="0" max="45" class="form-control" id="max"
					placeholder="Max" name="max">
				<div align="left">
					<small>�ִ� ������ 45����� �����մϴ�.</small>
				</div>
			</div>

			<div class="form-group" align="center" style="width: 50%">
				<div align="left">
					<label for="cnt">Cnt</label>
				</div>
				<input type="number" min="0" class="form-control" id="cnt"
					placeholder="Cnt" name="cnt">
				<div align="left">
					<small>����� ���� ����� �Է��ϼ���.</small>
				</div>
			</div>

			<input id="image" type="file" onchange="InputImage();"><br/>
			<div id="imagePreview"></div>

			<br/>
			<button type="submit" class="btn" style="width: 20%" onclick="add()">���</button>
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
						alert("�̹��� ������ ���ε� �ϼ���");
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
	    		alert("���� �̸��� �Է��ϼ���.");
	    		return;
	    	}
	    	
	    	if($("#type").val()==""){
	    		alert("���� ������ �����ϼ���.");
	    		return;
	    	}
	    	
	    	if($("#price").val()==""){
	    		alert("��Ʈ�� �Է��ϼ���.");
	    		return;
	    	}
	    	
	    	if($("#oil").val()==""){
	    		alert("������ �����ϼ���.");
	    		return;
	    	}
	    	
	    	if($("#max").val()==""){
	    		alert("�ִ� ������ �Է��ϼ���.");
	    		return;
	    	}
	    	
	    	if($("#cnt").val()==""){
	    		alert("���� ����� �Է��ϼ���.");
	    		return;
	    	}
	    	
	    	if($("#image").val()==""){
	    		alert("�̹����� �����ϼ���.");
	    		return;
	    	}
	    	
	    	var form = document.getElementById("addform");
	    	form.action = "addCar";
	    	form.submit();
	    }
	</script>

</body>
</html>