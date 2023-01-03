<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%
/* String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공상태

String sql="select * from notices order by to_number(seq) desc";

//실행
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(sql);
//rs.next();
//System.out.println("value : "+rs.getString("title")); */

%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>Notice</h3>
<table width="500" border="1">
	<tr>	
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<c:forEach items="${list }" var="n">
	<tr>
		<td>${n.seq }</td>
		<td>
			<a href="noticeDetail.do?c=${n.seq }">${n.title }</a>
		</td>
		<td>${n.writer }</td>
		<td>${n.regdate }</td>
		<td>${n.hit }</td>
	</tr>
</c:forEach>


</table>
<a href="noticeReg.do">글쓰기</a>
</body>

</html>