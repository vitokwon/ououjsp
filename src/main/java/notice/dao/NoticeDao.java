package notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import notice.vo.Notice;
import noticedb.db.dbCon;

public class NoticeDao {
	
	public List<Notice> getList() throws Exception {
		Connection conn=dbCon.getConnection();
		//접속성공상태

		String sql="select * from notices order by to_number(seq) desc";

		//실행
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		
		List<Notice> list=new ArrayList<Notice>();
		
		while (rs.next()) {
			Notice n=new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			list.add(n);
		}
		return list;
	}
	
	public int delete(Notice n) throws Exception {
		
		Connection conn=dbCon.getConnection();
		
		//String sql="select * from notices where seq='"+num+"'";
		String sql="delete from notices where seq=?";

		//실행
		//Statement st=conn.createStatement();
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, n.getSeq());

		int cnt=pstmt.executeUpdate();
		
		return cnt;
	}
		
	public int insert(Notice n) {

		PreparedStatement pstmt=null;
		int resultNum=0;
		Connection conn=null;
		
		try{
			conn=dbCon.getConnection();
			
			//insert작업
			String sql="insert into notices(seq,title,writer,content,regdate,hit)";
			sql +=" values((select max(to_number(seq))+1 from notices)";
			sql +=",?,'cj',?, systimestamp,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getContent());
			
			//실행
			resultNum=pstmt.executeUpdate();
			System.out.print("resultNum: "+resultNum);
			
		}catch(Exception e){
			
			e.printStackTrace();
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(Exception e){}
			if(conn!=null)try{conn.close();}catch(Exception e){}
		}
		return resultNum;
		
	}
	
	public int update(Notice notice) throws Exception {
		Connection conn=dbCon.getConnection();

		String sql="update notices set title=?, content=? where seq=?";

		//실행
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());

		int cnt=pstmt.executeUpdate();		
		return cnt;

	}

	public Notice getNotice(String num) throws Exception {
		Connection conn=dbCon.getConnection();

		String sql="select * from notices where seq=?";

		//실행
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, num);
		ResultSet rs=pstmt.executeQuery();
		rs.next();
//		System.out.println("value : "+rs.getString("title"));
		//notice.java파일에 저장
		Notice n=new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		//st.close();
		pstmt.close();
		conn.close();
		
		return n;
	}

}
