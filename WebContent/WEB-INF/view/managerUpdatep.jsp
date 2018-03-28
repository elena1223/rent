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
		<h2>���� ���</h2>
		<form name="form" method="post">
			<c:forEach var="li" items="${up }">
				<table>
					<tr>
						<td colspan="3">&nbsp;<b style="font-size: 20px;"><input type="text" style="width: 30%" value="${li.CNAME}"/>
						</b><small>(<input type="number" min="0" max="45" value="${li.MAX}" style="width: 6%"/>�ν�)</small>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type">����</label>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type">����</label>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type">����</label>
						<label class="radio-inline"><input type="radio" name="type" value="����" class="type">����</label>
						</td>
					</tr>
					<tr>
						<td rowspan="4" style="width: 50%"><img
							src="/imgCar/${li.IMG }" style="width: 400px;"></td>
						<td align="center" style="width: 18%">1��</td>
						<td align="right"><input type="number" min="0" max="1000000" value="${li.PRICE }"/>��&nbsp;</td>
					</tr>
					<tr align="center">
						<td>
							<label class="radio-inline"><input type="radio" name="oil" value="���ָ�" class="oil">���ָ�</label>
							<label class="radio-inline"><input type="radio" name="oil" value="����" class="oil">����</label>
							<label class="radio-inline"><input type="radio" name="oil" value="LPG" class="oil">LPG</label>
						</td>
						<td><input type="number" min="0" value="${li.KILO }" style="width: 30%"/>Km</td>
					</tr>
					<tr align="center">
						<td colspan="2">�ɼ�</td>
					</tr>
					<tr align="center">
						<td colspan="2"><input type="text" value="${li.OPT }" style="width: 100%"/></td>
					</tr>
				</table>
				<br/>
			</c:forEach>
			<button type="submit" class="btn btn-success" style="width: 20%" onclick="update()" formaction="/manager/updateremove">�����ϱ�</button>
		</form>
	</div>
	<script>
		/* function update(){
			window.alert("������ �Ϸ�Ǿ����ϴ�.");
		} */
	</script>
</body>
</html>