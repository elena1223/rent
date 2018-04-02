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
		<h2 style="color: #2E64FE">���� ���</h2>
		<form name="form" method="post" enctype="multipart/form-data">
			<c:forEach var="li" items="${up }">
				<table>
					<tr>
						<input type="hidden" name="no" value="${li.NO }"/>
						<td colspan="3">&nbsp;<b style="font-size: 20px;"><input type="text" style="width: 30%" name="cname" value="${li.CNAME}" autocomplete="off"/>
						</b><small>(<input type="number" min="0" max="45" name="max" value="${li.MAX}" style="width: 6%"/>�ν�, 
						<input type="number" min="0" name="cnt" value="${li.CNT}" style="width: 6%"/>�� ����
						)</small>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type" ${li.TYPE =='����'?'checked' : '' }>����</label>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type" ${li.TYPE =='����'?'checked' : '' }>����</label>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type" ${li.TYPE =='����'?'checked' : '' }>����</label>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type" ${li.TYPE =='����'?'checked' : '' }>����</label>
						</td>
					</tr>
					<tr>
						<td rowspan="4" style="width: 50%"><img src="/imgCar/${li.IMG }" id="preview" style="width: 400px;" onclick="document.getElementById('img').click();">
						
						<input type="file" name="img" placeholder="������ ����" id="img" style="display: none"/>
						</td>
						<td align="center" style="width: 18%">1��</td>
						<td align="right"><input type="number" min="0" max="1000000" step="1000" name="price" value="${li.PRICE }"/>��&nbsp;</td>
					</tr>
					<tr align="center">
						<td>
							<label class="radio-inline"><input type="radio" name="oil" value="���ָ�" class="oil" ${li.OIL =='���ָ�'?'checked' : '' }>���ָ�</label><br/>
							<label class="radio-inline"><input type="radio" name="oil" value="����" class="oil" ${li.OIL =='����'?'checked' : '' }>����</label><br/>
							<label class="radio-inline"><input type="radio" name="oil" value="LPG" class="oil" ${li.OIL =='LPG'?'checked' : '' }>LPG</label>
						</td>
						<td><input type="number" min="0" name="kilo" value="${li.KILO }" style="width: 30%"/>Km</td>
					</tr>
					<tr align="center">
						<td colspan="2">�ɼ�</td>
					</tr>
					<tr align="center">
						<td colspan="2"><input type="text" name="opt" value="${li.OPT }" style="width: 100%" autocomplete="off"/></td>
					</tr>
				</table>
				<div align="left">
				�ػ����� Ŭ���Ͽ� ������ �� �ֽ��ϴ�.
				</div>
				<br/>
			</c:forEach>
			<button type="submit" class="btn btn-success" style="width: 20%" onclick="update()" formaction="/manager/updatep">�����ϱ�</button>
		</form>
	</div>
	<script>
		function update(){
			window.alert("������ �Ϸ�Ǿ����ϴ�.");
		}
		document.getElementById("img").onchange= function() {
			if(!this.files[0].type.startsWith("image")){
				window.alert("jpg, gif, bmp, tif, png ������ ���ϸ� ÷���Ͻ� �� �ֽ��ϴ�.");
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