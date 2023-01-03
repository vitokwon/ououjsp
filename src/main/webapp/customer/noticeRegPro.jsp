<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my jsp file</title>
</head>
<body>
<h3>noticeRegPro</h3>
<!-- pstmt 사용
insert완성되면 notice.jsp로 돌아가도록 -->
<%
/* String title=request.getParameter("title");
String content=request.getParameter("content");

Notice n=new Notice();
n.setTitle(title);
n.setContent(content);

NoticeDao dao=new NoticeDao();
dao.insert(n); */

/* //db연결 insert
Connection conn=null;
PreparedStatement pstmt=null;


String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";


try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, user, pw);
	
	//insert작업
	String sql="insert into notices(seq,title,writer,content,regdate,hit)";
	sql +=" values((select max(to_number(seq))+1 from notices)";
	sql +=",?,'cj',?, systimestamp,0)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	
	//실행
	int resultNum=pstmt.executeUpdate();
	System.out.print("resultNum: "+resultNum);
	
	
	
}catch(Exception e){
	
	e.printStackTrace();
}finally{
	if(pstmt!=null)try{pstmt.close();}catch(Exception e){}
	if(conn!=null)try{conn.close();}catch(Exception e){}
} */

/* response.sendRedirect("notice.jsp"); */
%>

</body>
</html>