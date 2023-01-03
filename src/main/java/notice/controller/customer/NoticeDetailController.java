package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeDetailController implements NController{

	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("NoticeDetailController nvc2 신호");
		
		String num=request.getParameter("c");
//		System.out.println("num : "+num);

		if(num==null)
			num="1";

		NoticeDao dao=new NoticeDao();
		Notice n=dao.getNotice(num);
		
		request.setAttribute("n", n);
		
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	
	}
	
}
