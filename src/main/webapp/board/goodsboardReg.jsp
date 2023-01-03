<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>goodsboardReg.jsp</h3>
<form action="goodsboardRegPro.jsp" method="post">
	<dl>
		<dt>상품명</dt>
		<td>
		<input type="text" name="gname" />
		</td>
	</dl>
	<div>상품간단소개<br />
		<textarea name="gdescribe" id="txtcontent" class="txtcontent">상품간단소개</textarea>
	</div>
	<dl>
		<dt>상품가격</dt>
		<td>
		<input type="text" name="gprice" />
		</td>
	</dl>
	<dl>
		<dt>첨부파일</dt>
		<dt>
			<input type="file" name="txtFile" />
		</dt>
	</dl>	
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel"/>
</form>

</body>
</html>