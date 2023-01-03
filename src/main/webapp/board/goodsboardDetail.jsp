<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String gnum=request.getParameter("c");
if(gnum==null)
	gnum="1";

String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공상태

//String sql="select * from notices where seq='"+num+"'";
String sql="select * from goodsinfo where gnum=?";

//실행
//Statement st=conn.createStatement();
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, gnum);
//ResultSet rs=st.executeQuery(sql);
ResultSet rs=pstmt.executeQuery();
rs.next();
System.out.println("value : "+rs.getString("gname"));
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h3>noticeDetail.jsp</h3>

<table class="twidth">

   <colgroup>
      <col width="15%" />
      <col width="35%" />
      <col width="5%" />
      <col width="35%" />
   </colgroup>
   <caption>Describe</caption>
   <tbody>
      <tr>
         <th class="left">상품번호</th>
         <td><%=rs.getString("gnum") %></td>
      </tr>
      <tr>
         <th class="left">상품명</th>
         <td><%=rs.getString("gname") %></td>
         <th class="left">등록일</th>
         <td><%=rs.getDate("gdate") %></td>   
      </tr>
      <tr>
         <th class="left">상품간략소개</th>
         <td colspan="3" id="content"><%=rs.getString("gdescribe") %></td>         
      </tr>
      <tr>
         <th class="left">첨부</th>
         <td colspan="3" id="addfile">첨부</td>
         
      </tr>
   </tbody>

</table>
<a href="goodsboard.jsp">목록</a>
</body>
</html>

<%
rs.close();
//st.close();
pstmt.close();
conn.close();
%>