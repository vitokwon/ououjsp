<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String islunar=request.getParameter("is_lunar");
String cphone=request.getParameter("cphone");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String birth=String.format("%s-%s-%s",year,month,day);
String email=request.getParameter("email");
//String habit=request.getParameter("habit"); //checkbox는 배열로 들어옴
String[] habits=request.getParameterValues("habit"); //checkbox는 배열로 받아야함
String habit="";
if(habits!=null){
	for(int i=0;i<habits.length;i++){
		//누적
		habit+=habits[i];
		//System.out.println(habits[i]); //마지막에 ,가 찍힘
		if(habits.length>i+1){
			habit+=",";
	}
}

//에러체크 id가 null인지, 패스워드가 일치 하지 않는지	
List<String> errors=new ArrayList();
if(id==null || id.equals("")) // 아이디 입력상태
	errors.add("아이디없음");	
if(!pwd.equals(pwd2) || pwd==null || pwd.equals("")) //패스워드 불일치
	errors.add("패스워드불일치");

if(errors.size()>0){ //에러가 있다면
	//errors를 가지고(request에 담아서) join.jsp로 가겠다
	request.setAttribute("errors", errors);
	request.getRequestDispatcher("join.jsp").forward(request, response);
	
	
}else{
	//회원 가입 후 index.jsp로 돌아가기
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pw="123456";

	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	//접속성공상태

	String sql="insert into nmember(id,pwd,name,gender,";
		sql+=" birth,is_lunar,cphone,email,habit,regdate)";
		sql+=" values(?,?,?,?,?,";
		sql+=" ?,?,?,?,sysdate)";

	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,pwd);
	pstmt.setString(3,name);
	pstmt.setString(4,gender);
	pstmt.setString(5,birth);
	pstmt.setString(6,islunar);
	pstmt.setString(7,cphone);
	pstmt.setString(8,email);
	pstmt.setString(9,habit);
	pstmt.executeUpdate();

	response.sendRedirect("../index.jsp");
	 
}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>joinProc.jsp</h1>

id : <%=id %> <br />
gender : <%=gender %> <br />
birth : <%=birth %> <br />
email : <%=email %> <br />

</body>
</html>