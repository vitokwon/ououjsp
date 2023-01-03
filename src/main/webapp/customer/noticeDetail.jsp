<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공상태

//String sql="select * from notices where seq='"+num+"'";
String sql="select * from notices where seq=?";

//실행
//Statement st=conn.createStatement();
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, num);
//ResultSet rs=st.executeQuery(sql);
ResultSet rs=pstmt.executeQuery();
rs.next();
System.out.println("value : "+rs.getString("title"));
 */%>

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
   <caption>Detail</caption>
   <tbody>
      <tr>
         <th class="left">글번호</th>
         <td>${n.seq}</td>
         <th class="left">조회수</th>
         <td>${n.hit}</td>   
      </tr>
      <tr>
         <th class="left">작성자</th>
         <td>${n.writer}</td>
         <th class="left">작성시간</th>
         <td>${n.regdate}</td>   
      </tr>
      <tr>
         <th class="left">내용</th>
         <td colspan="3" id="content">${n.content}</td>
         
      </tr>
      <tr>
         <th class="left">첨부</th>
         <td colspan="3" id="addfile">첨부</td>
         
      </tr>
   </tbody>

</table>
<a href="noticeEdit.do?c=${n.seq}">수정</a>
<a href="noticeDelProc.jsp?c=${n.seq}">삭제</a>
<a href="notice.do">목록</a>
</body>
</html>

<%

%>