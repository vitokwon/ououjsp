<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//데이터받기
/* request.setCharacterEncoding("utf-8");

String num=request.getParameter("c");
String title=request.getParameter("title");
String content=request.getParameter("content");

Notice n=new Notice();
n.setTitle(title);
n.setContent(content);
n.setSeq(num);

NoticeDao dao=new NoticeDao();
int cnt=dao.update(n); */ //잘라냈다가 붙여넣으면 에러가 사라짐


/* //전달된 파람을 받아서 데이터베이스의 해당글을 수정
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공상태

//String sql="select * from notices where seq='"+num+"'";
String sql="update notices set title=?, content=? where seq=?";


//실행
//Statement st=conn.createStatement();
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, content);
pstmt.setString(3, num);

//업데이트
int cnt=pstmt.executeUpdate(); */

/* if(cnt>0){
	response.sendRedirect("noticeDetail.do?c="+num);
} */
//ResultSet rs=st.executeQuery(sql);
//ResultSet rs=pstmt.executeQuery();



%>


<!-- 
아니면 어디로 보낼건가요? 디테일페이지로 보냄 <br />
 -->