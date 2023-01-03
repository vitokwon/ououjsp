<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>jstl3_fmt</h3>
number : <fmt:formatNumber value="12345678" type="number" /> <br />
currency : <fmt:formatNumber value="12345678" type="currency" currencySymbol="₩"/> <br />
percent : <fmt:formatNumber value="12345678" type="percent" /> <br />
pattern =".0" : <fmt:formatNumber value="12345678" pattern=".0" /> <br />

<c:set var="now" value="<%=new java.util.Date() %>" />
${now } <br />
date : <fmt:formatDate value="${now }" type="date"/> <br />
time : <fmt:formatDate value="${now }" type="time"/> <br />
both : <fmt:formatDate value="${now }" type="both"/> <br />

</body>
</html>