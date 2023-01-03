<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공상태

String sql="select * from goodsinfo order by to_number(gnum) desc";

//실행
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(sql);
//rs.next();
//System.out.println("value : "+rs.getString("title"));

%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>상품정보</h3>
<table width="500" border="1">
	<tr>	
		<td>상품번호</td>
		<td>상품명</td>
		<td>상품가격</td>
		<td>등록일</td>
	</tr>
<%
while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("gnum") %></td>
		<td>
			<a href="goodsboardDetail.jsp?c=<%=rs.getString("gnum") %>"><%=rs.getString("gname") %></a>
		</td>
		<td><%=rs.getString("gprice") %></td>
		<td><%=rs.getDate("gdate") %></td>
	</tr>

<%
}
%>

</table>
<a href="goodsboardReg.jsp">글쓰기</a>
</body>
<%
rs.close();
st.close();
conn.close();
%>
</html>